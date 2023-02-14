package DTNsShop.poly.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import DTNsShop.poly.constant.MailInfo;
import DTNsShop.poly.service.MailerService;


@Service
public class MailerServiceImpl implements MailerService {

	@Autowired
	JavaMailSender sender;

	@Override
	public void send(MailInfo mail) throws MessagingException {

		MimeMessage message = sender.createMimeMessage();

		MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		helper.setFrom(mail.getFrom());
		helper.setTo(mail.getTo());
		helper.setSubject(mail.getSubject());
		helper.setText(mail.getBody(), true);
		helper.setReplyTo(mail.getFrom());
		String[] cc = mail.getCc();
		if (cc != null && cc.length > 0) {
			helper.setCc(cc);
		}
		String[] bcc = mail.getBcc();
		if (bcc != null && bcc.length > 0) {
			for(String b : bcc) {
				helper.addBcc(b);;
			}
		}
		if (mail.getAttachments() != null) {
			List<File> attachments = mail.getAttachments();
			if (attachments != null && attachments.size() > 0) {
				for (File file : attachments) {
					helper.addAttachment(file.getName(), file);
				}
			}
		}
		sender.send(message);
	}

	@Override
	public void send(String to, String subject, String body) throws MessagingException {
		this.send(new MailInfo(to, subject, body));
	}

	List<MailInfo> list = new ArrayList<>();

	@Override
	public void queue(MailInfo mail) {
		list.add(mail);
	}

	@Override
	public void queue(String to, String subject, String body) {
		queue(new MailInfo(to, subject, body));
	}

	@Scheduled(fixedDelay = 5000)
	public void run() {
		while (!list.isEmpty()) {
			MailInfo mail = list.remove(0);
			try {
				this.send(mail);
				System.out.println("Đang gửi "+ list.size());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}

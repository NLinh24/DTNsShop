package DTNsShop.poly.service;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ParamService {

	@Autowired
	ServletContext app;
	@Autowired
	HttpServletRequest request;

	public String getString(String name, String defaultValue) {
		String value = (String) request.getParameter(name);
		if (value != null) {
			return value;
		}
		return defaultValue;
	}

	public int getInt(String name, int defaultValue) {
		int value = Integer.parseInt(request.getParameter(name));
		if (!String.valueOf(value).isEmpty()) {
			return value;
		}
		return defaultValue;
	}

	public double getDouble(String name, double defaultValue) {
		double value = Double.parseDouble(request.getParameter(name));
		if (!String.valueOf(value).isEmpty()) {
			return value;
		}
		return defaultValue;
	}

	public boolean getBoolean(String name, boolean defaultValue) {
		String value = (String) request.getParameter(name);
		if (value != null) {
			return Boolean.valueOf(value);
		}
		return defaultValue;
	}

	public Date getDate(String name, String pattern) {
		String value = request.getParameter(name).toString();
		Date date;
		try {
			date = new SimpleDateFormat(pattern).parse(value);
			if (value != null) {
				return date;
			}
		} catch (ParseException e) {
			System.out.println(">>Lỗi định dạng ngày tháng!");
		}

		return null;

	}
	String filename2 = "";
	public MultipartFile save(Optional<MultipartFile> file, String path,String name) {
		if (file.isPresent()) {
			MultipartFile hinhanh = file.get();
			if (!hinhanh.isEmpty()) {
				String filename = hinhanh.getOriginalFilename();
				filename2 = filename.replaceAll(filename, name+filename.substring(filename.lastIndexOf("."),filename.length()));
				File pathUpload = new File(app.getRealPath(path + filename2));
				try {
					hinhanh.transferTo(pathUpload);
					//request.setAttribute("message", "Upload "+filename+" thành công!!");
					//request.setAttribute("st",(path + filename2));
					return hinhanh;
				} catch (IllegalStateException | IOException e) {
					//request.setAttribute("message", "Upload thất bại!!");
				}
			}
		}
		return null;
	}
	
	public String getFileName() {
		return  filename2;
	}
}

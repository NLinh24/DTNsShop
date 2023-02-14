 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <!-- Page Header-->
    <header class="bg-white shadow-sm px-4 py-3 z-index-20">
        <div class="container-fluid px-0">
            <h2 class="mb-0 p-1">Dashboard</h2>
        </div>
    </header>
    <!-- Dashboard Counts Section-->
    <section class="pb-0">
        <div class="container-fluid">
            <div class="card mb-0">
                <div class="card-body">
                    <div class="row gx-5 bg-white">
                        <!-- Item -->
                        <div class="col-xl-3 col-sm-6 py-4 border-lg-end border-gray-200">
                            <div class="d-flex align-items-center">
                                <div class="icon flex-shrink-0 bg-violet">
                                    <svg class="svg-icon svg-icon-sm svg-icon-heavy">
                                        <use xlink:href="#user-1"> </use>
                                    </svg>
                                </div>
                                <div class="mx-3">
                                    <h6 class="h4 fw-light text-gray-600 mb-3">Tổng số<br>Tài khoản</h6>
                                    <div class="progress" style="height: 4px">
                                        <div class="progress-bar bg-violet" role="progressbar"
                                            style="width:${account_count}%; height: 4px;" aria-valuenow="25" aria-valuemin="0"
                                            aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="number"><strong class="text-lg">${account_count}</strong></div>
                            </div>
                        </div>
                        <!-- Item -->
                        <div class="col-xl-3 col-sm-6 py-4 border-lg-end border-gray-200">
                            <div class="d-flex align-items-center">
                                <div class="icon flex-shrink-0 bg-red">
                                    <svg class="svg-icon svg-icon-sm svg-icon-heavy">
                                        <use xlink:href="#survey-1"> </use>
                                    </svg>
                                </div>
                                <div class="mx-3">
                                    <h6 class="h4 fw-light text-gray-600 mb-3">Tổng số<br>Đơn hàng</h6>
                                    <div class="progress" style="height: 4px">
                                        <div class="progress-bar bg-red" role="progressbar"
                                            style="width: ${order_count}%; height: 4px;" aria-valuenow="70" aria-valuemin="0"
                                            aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="number"><strong class="text-lg">${order_count}</strong></div>
                            </div>
                        </div>
                        <!-- Item -->
                        <div class="col-xl-3 col-sm-6 py-4 border-lg-end border-gray-200">
                            <div class="d-flex align-items-center">
                                <div class="icon flex-shrink-0 bg-green">
                                    <svg  xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-list-task" viewBox="0 0 16 16">
				                       <path d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5l2.404.961L10.404 2l-2.218-.887zm3.564 1.426L5.596 5 8 5.961 14.154 3.5l-2.404-.961zm3.25 1.7-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14.762V6.838L1 4.239v7.923l6.5 2.6zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 0 1-.372 0L.63 13.09a1 1 0 0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464L7.443.184z"/>
				                    </svg>
                                </div>
                                <div class="mx-3">
                                    <h6 class="h4 fw-light text-gray-600 mb-3">Tổng số<br>Sản phẩm</h6>
                                    <div class="progress" style="height: 4px">
                                        <div class="progress-bar bg-green" role="progressbar"
                                            style="width:${product_count}%; height: 4px;" aria-valuenow="40" aria-valuemin="0"
                                            aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="number"><strong class="text-lg">${product_count}</strong></div>
                            </div>
                        </div>
                        <!-- Item -->
                        <div class="col-xl-3 col-sm-6 py-4">
                            <div class="d-flex align-items-center">
                                <div class="icon flex-shrink-0 bg-orange">
                                   <svg  xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-list-task" viewBox="0 0 16 16">
 									<path fill-rule="evenodd" d="M2 2.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5V3a.5.5 0 0 0-.5-.5H2zM3 3H2v1h1V3z"/>
                     				 <path d="M5 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM5.5 7a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9zm0 4a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9z"/>
                     				 <path fill-rule="evenodd" d="M1.5 7a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5V7zM2 7h1v1H2V7zm0 3.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5H2zm1 .5H2v1h1v-1z"/>				                    </svg>
                                </div>
                                <div class="mx-3">
                                    <h6 class="h4 fw-light text-gray-600 mb-3">Tổng số<br>Danh mục</h6>
                                    <div class="progress" style="height: 4px">
                                        <div class="progress-bar bg-orange" role="progressbar"
                                            style="width:${category_count}%; height: 4px;" aria-valuenow="50" aria-valuemin="0"
                                            aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="number"><strong class="text-lg">${category_count}</strong></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Dashboard Header Section    -->
    <section class="pb-0 mb-3">
            <div class="container-fluid">
              <div class="row align-items-stretch">
                <!-- Statistics -->
                <div class="col-lg-3 col-12">
                  <div class="card mb-3">
                    <div class="card-body">
                      <div class="d-flex align-items-center">
                        <div class="icon flex-shrink-0 bg-red"><i class="fas fa-tasks"></i></div>
                        <div class="ms-3"><strong class="text-lg d-block lh-1 mb-1">234</strong><small class="text-uppercase text-gray-500 small d-block lh-1">Applications</small></div>
                      </div>
                    </div>
                  </div>
                  <div class="card mb-3">
                    <div class="card-body">
                      <div class="d-flex align-items-center">
                        <div class="icon flex-shrink-0 bg-green"><i class="far fa-calendar"></i></div>
                        <div class="ms-3"><strong class="text-lg d-block lh-1 mb-1">152</strong><small class="text-uppercase text-gray-500 small d-block lh-1">Interviews</small></div>
                      </div>
                    </div>
                  </div>
                  <div class="card mb-0">
                    <div class="card-body">
                      <div class="d-flex align-items-center">
                        <div class="icon flex-shrink-0 bg-orange"><i class="far fa-paper-plane"></i></div>
                        <div class="ms-3"><strong class="text-lg d-block lh-1 mb-1">147</strong><small class="text-uppercase text-gray-500 small d-block lh-1">Forwards</small></div>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- Line Chart            -->
                <div class="col-lg-6 col-12">
                  <div class="card mb-0 h-100">
                    <div class="card-body">
                      <canvas id="lineCahrt"></canvas>
                    </div>
                  </div>
                </div>
                <div class="col-lg-3 col-12">
                  <!-- Numbers-->
                  <div class="card mb-0">
                    <div class="card-body">
                      <div class="d-flex align-items-center">
                        <div class="icon flex-shrink-0 bg-green"><i class="fas fa-chart-area"></i></div>
                        <div class="ms-3"><strong class="text-lg mb-0 d-block lh-1">99.9%</strong><small class="text-gray-500 small text-uppercase">Success Rate</small></div>
                      </div>
                    </div>
                  </div>
                  <!-- Numbers-->
                  <div class="card mb-0">
                    <div class="card-body">
                      <div class="d-flex align-items-center">
                        <div class="icon flex-shrink-0 bg-blue"><i class="fas fa-chart-area"></i></div>
                        <div class="ms-3"><strong class="text-lg mb-0 d-block lh-1">99.9%</strong><small class="text-gray-500 small text-uppercase">Success Rate</small></div>
                      </div>
                    </div>
                  </div>
                  <!-- Numbers-->
                  <div class="card mb-0">
                    <div class="card-body">
                      <div class="d-flex align-items-center">
                        <div class="icon flex-shrink-0 bg-red"><i class="fas fa-chart-area"></i></div>
                        <div class="ms-3"><strong class="text-lg mb-0 d-block lh-1">99.9%</strong><small class="text-gray-500 small text-uppercase">Success Rate</small></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>
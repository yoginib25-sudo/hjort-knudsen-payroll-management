Rails.application.routes.draw do

  # =========================
  # Admin Login
  # =========================

  get    "admin/login",  to: "admin#login"
  post   "admin/login",  to: "admin#login"
  delete "admin/logout", to: "admin#logout"


  # =========================
  # Employee Portal
  # =========================

  get  "employee/login",     to: "employee_portal#login"
  post "employee/login",     to: "employee_portal#login"
  get  "employee/dashboard", to: "employee_portal#dashboard"

  # Employee Logout

  delete "employee/logout",  to: "employee_portal#logout"


  # =========================
  # Main Dashboard
  # =========================

  get "dashboard/index"


  # =========================
  # Employees
  # =========================

  resources :employees, only: [:index, :new, :create, :edit, :update, :destroy]


  # =========================
  # Salary Slips
  # =========================

  resources :salary_slips, only: [:index, :new, :create, :show, :edit, :update, :destroy]


  # =========================
  # Root
  # =========================

  root "dashboard#index"


  # =========================
  # Health Check
  # =========================

  get "up" => "rails/health#show", as: :rails_health_check

end
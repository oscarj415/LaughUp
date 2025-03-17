// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// import UserTypeController from "./user_type_controller";
// application.register("user-type", UserTypeController);
// import ReviewController from "./review_controller";
// application.register("review", ReviewController);

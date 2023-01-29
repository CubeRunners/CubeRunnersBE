use actix_web::{get, post, web, App, HttpResponse, HttpServer, Responder};

#[get("/")]
async fn hello() -> impl Responder {
    HttpResponse::Ok().body("Hello world!")
}

#[post("/echo")]
async fn echo(req_body: String) -> impl Responder {
    HttpResponse::Ok().body(req_body)
}

async fn manual_hello() -> impl Responder {
    HttpResponse::Ok().body("Hey there!")
}

#[post("/api/v1/user")]
async fn user(req_body: String) -> impl Responder {
    HttpResponse::Ok()
}

#[post("/api/v1/login")]
async fn login(req_body: String) -> impl Responder {
    HttpResponse::Ok()
}

#[post("/api/v1/:idCube")]
async fn byIdCube(req_body: String) -> impl Responder {
    HttpResponse::Ok()
}

#[post("/api/v1/:like")]
async fn like(req_body: String) -> impl Responder {
    HttpResponse::Ok()
}

#[get("/api/v1/:idCube")]
#[get("/api/v1/like")]
#[get("/api/v1/:idCard")]

#[update("/api/v1/like")]

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .service(hello)
            .service(echo)
            .route("/hey", web::get().to(manual_hello))
    })
    .bind(("127.0.0.1", 8080))?
    .run()
    .await
}
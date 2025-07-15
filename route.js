import express from "express";
import clients from "./src/controllers/clients.js";

const routes = express.Router();
routes.get("/clients", clients.findAll);
routes.get("/", (req, res) => {
  return res.json({ name: "Ciclano Fulano" });
});

export { routes as default };
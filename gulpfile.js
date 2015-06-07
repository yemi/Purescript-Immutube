var gulp = require("gulp")
var mandragora = require("mandragora-bucket")

mandragora.config.entries = {
    "Immutube": {
        "name": "immutube-bundled",
        "dir": "dist"
    }
}

mandragora(gulp)

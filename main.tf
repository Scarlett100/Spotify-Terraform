# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    spotify = {
      version = "~> 0.2.6"
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
}

data "spotify_search_track" "by_artist" {
  artist = "Dolly Parton"
  #  album = "Jolene"
  #  name  = "Early Morning Breeze"
}

resource "spotify_playlist" "playlist" {
  name        = "Terraform Summer Jams"
  description = "Using Infrastructure as code to create a playlist, using Terraform!"
  public      = true

  tracks = [
    data.spotify_search_track.by_artist.tracks[0].id,
    
    "47hsUYxvbTlBAN3sP9dEOd",
    "1WJfspc1lIKz3dyVbCvHnF",
    "6SSSGEgfuqTP75xaNOwsTo",
    "55HWsOjIkrP3Pomed4zjkH",
    "4nRBgPceAv04r19I9Xn3Tk"
  ]
}

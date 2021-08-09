From: =?UTF-8?Q?St=C3=A9phane_Charette?= <stephanecharette@gmail.com>
Subject: which example to use?
Date: Mon, 9 Aug 2021 14:48:36 -0700
Message-ID: <CA+HxBUKWTvC4u_xFmdF34BH1kEr9aSmDawujF9aXe=a3eTekFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=zzid1vs4cyQg8Otle0hq8g3uM+ZwBNySSQXJy3x3HVo=;
        b=DC7Ho+ccPdS+iaObWYxF+a6GGmAqtOv+awv1ZvPP6wAEjOQRbbdOCsvq40tQX33gWf
         19TDzEgI2UETYUJsN1Gyj3iDfARvX7Wp0dLcYI0PUOBtYKHQ5k1hV4Rkm6tj5FR4GYw6
         8oGHVmPxHV0dOX39h1X0YkA8d0A0nQCXua8sinN8JikAzAOT3TBoYbhNG1yAQUhD46Lz
         VUnPGJhE4WoKHgnQwo/nF2GPLFpzw/acZz55S9KzHp1mJ+R2UOhVudQ2EBH2BgXskMwv
         PLGhDyBmFL/aRjOEKHnpq0wNGgTyHHEMZEsu1CHk/vHcHZRrVJu70mYzSMzJYXUHGxt3
         iblg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: netfilter@vger.kernel.org

I'm looking through the examples trying to figure out what they do.
Which one should I be using to get a callback when an interface goes
up/down, or when an ip address changes?

(Would be nice if there was a readme in the examples folder with maybe
just 1 line explaining what the various samples are attempting to do.)

Thanks,

St=C3=A9phane Charette

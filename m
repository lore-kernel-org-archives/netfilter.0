From: =?UTF-8?B?Q8OpZHJpYyBNYXJ0w61uZXogQ2FtcG9z?= 
        <cedricmartinezcampos@gmail.com>
Subject: ebtables complains about the speeding up example
Date: Sat, 9 Apr 2022 16:13:53 +0200
Message-ID: <CAMjZu9NUzT__WUyb0jzX=oeAiJrzp6oaPJwY=UHwN_PDhPtBiw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=ZG3+P4qm8zAuwEQ60v4HoWlLs3QN1FYbuVv3dK8A4p8=;
        b=WQtvkVwSS2St0i/veRsYssWM34o/GLdwT5gra21d68sqfuIhwlNb6HCRLYpo+JJ1ce
         MfD7iYCAvxxaQfnEUW58vK5v+4Nhov4TjNRh/JjkyjzPiNBneXhauEWv4eTijOwXLdIk
         7lPYPbf4djy9AG5efSeYPxsX6gfr0kTJeDaCjugebVCVPv//IzH70K+dTMN0Rcy5igL0
         zm++PxamS9wUvNOZG+lmsowGtaSC5AQSiC7Ei+4/7xl/0lrOtR+I1xiXqiyOnWmwQShb
         w5WpR6nV+ek5ODoe1Bs98SjY2kpnpVaMM+AmfeIPnrA2w6SNswwErrYxsmsbkQbVkwxL
         Kccw==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi, there!

In one of the basic examples of ebtable's documentation, "Speeding up
traffic destinated to the bridge itself", it is suggested to issue the
command

    # ebtables -t broute \
               -A BROUTING \
               -d $MAC_OF_BR0 \
               -p ipv4 \
               -j redirect \
               --redirect-target DROP

This however returns the error

    ebtables: No chain/target/match by that name


I guess it is because there is no chain called BROUTING. Is this
really necessary? In such a case, how could I solve this?

Thank you for your time,
C=C3=A9dric

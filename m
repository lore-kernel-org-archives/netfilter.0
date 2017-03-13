From: Ran Shalit <ranshalit@gmail.com>
Subject: cookies blocking
Date: Mon, 13 Mar 2017 18:08:34 +0200
Message-ID: <CAJ2oMhKcUmOnXfHjUv4htpasvNEPXp_SDddUSVPV7Jt_zunDNA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=+SgA91YVDMMRMwfOUveiUiJFe7psBT9bzev+hh+o+Bk=;
        b=mpKRWiXkdFp2SwA959KD8bPsJtLgrsNH0U/8Fg6gnZwqRrO+7j96FdyRdhJAUUVXyy
         xjcm8rThNzYcc0apJRT+mkk6yydZq1Z8zZsUxOUFMmEWr9UJsLN8X6GBIDtNxfmHDjZ3
         uvPQXCakCObhnU8oeZHcCT6N8UttYkxUXqUtsGdm49QS9n/p8jyKo04TVvmegjVWPK+r
         TaVIWnh75ZdZ2I1CWn6S9IwgxBTFP0532lc8/w09eg6xwzjWaH/MTAMshLDvM4ZiJwC1
         nBAJy/S03ZdH4y+D6Hf1yBBo2sxQTkguVwVOoF939YC9qIxggKn2wtQqqngVp4kOKNie
         bPOw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

Is it possible to filter/block cookies using netfilter/iptables ?

I can't see how to do this.

Thank you,
Ran

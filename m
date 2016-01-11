From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Is conntrack -D atomic?
Date: Mon, 11 Jan 2016 18:45:22 +0530
Message-ID: <CAA5aLPiDuOvSSUfxs3h4+_M9xY6EpDmL8VPP00ia_2brkFyLEg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=oq5kOxkUI7fwkrdoQup3MkgDYaGeoQWN5AS4n0RI+gw=;
        b=GybEVZ5bnEDekV1Xw8uOav+YIRNOsW72HuMYGaZa3gSoEcCj2mD/TfiDsPCF/i1PJD
         nD0sxDEdOodw5UQJUGLdA0q8auyFinNRMeWCowNcj+qB2nsGgCKzhPuU96efbPbQkbbq
         V235DqbY82M/qpf50QBYFXJEe1mdiU/Si13tj1UkTPQjRxj0uARFRloptw343lO2HMaK
         rTto9PzgTXIWOdCVYksnD9gcHpv0tlmKXYrABlsxtdOoCsXdOSvRzojUpxRugwRdnGai
         d41BihUice2mKZu4ur606S/JIU4LcD1t68ENc/YEhg3Bs5uJu95Sh6TTygV3HW24U3iK
         2T0Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I am trying to delete some conntrack entries using "conntrack -D ".

Is this operation atomic in nature?

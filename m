From: jack Linux <ilinuxer.85@gmail.com>
Subject: Limit transfer speed rate by Iptables Rules
Date: Thu, 5 Feb 2015 14:26:37 +0200
Message-ID: <CAGHcRxYH5j1M-=QqTqJBFgC0iZBk8+Htuwd_xF5aFGk9qNab0A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=NV9M/oBl033aftocsk0T4pGbA/4RaJPBQt6aKzyOhmk=;
        b=erSOTQw0/NA5IMFm9cykrDQRbk94xsTujTKuwy/RTZHTEaBfGDUVaEnxYYnD1BCWwu
         SPTDYWcWsR03g19sks8essXyHoGBzbA8wP57p/sneeqAFrmYrHlJBf4rOoR1gpvWG0+V
         uD6rI00ATZeuaL0FnExcv81HjLXxjEQGrapAEtbYmbGXoWDnez0krxtv0latIau2p2XH
         IAVhDkM6BQmVdcVXd6KJhafZBuWTNx3dJnjr3gkuuG91b5VxliLF7r6ojewRTenpi851
         3Ce10qvMih49g9QyZIZ7MhOP+2C0DGreBlzyyMBJ9HVkyOHs1Bitfv3v7vLSnL/4SbXb
         7NoQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have D-Link Router DSL-2730U that support busybox OS and iptables
version 1.4.0
I managed successfully to block the host for being connect to the
internet using the following command

block by ip address


iptables -I  FORWARD -d 192.168.1.6 -j DROP


Or By mac source


iptables -I FORWARD -m mac --mac-source bc:20:a4:ff:79:80 -j DROP


The only problem now i have is trying to limit transfer speed rate
(upload & download) to be only serve 30/kbps by MAC Address using
iptables
I tried to make iptables rule like


iptables -I FORWARD -m mac --mac-source bc:20:a4:ff:79:80 -m state
--state RELATED,ESTABLISHED -m limit --limit 100/second --limit-burst
30 -j ACCEPT
But it didn't work

Note : this router cannot modify , delete or add any files . i cannot
make a bash or script file inside the router run , and unfortunately
the iptables connlimit module not supported in this iptables version
too

From: Ajith Adapa <adapa.ajith@gmail.com>
Subject: Fwd: IPtables and SNAT
Date: Tue, 27 Oct 2009 16:25:10 +0530
Message-ID: <5f765be60910270355v420513d6mf3cdce0ed820600@mail.gmail.com>
References: <95ac437a-3f19-490a-80d0-3ce0a20850ed@y10g2000prg.googlegroups.com>
	 <46ee7b1c0910212155pd99519cw9831d4bb7d7f3064@mail.gmail.com>
	 <b8dec168-132d-4fba-9d09-fbb5554c339d@m7g2000prd.googlegroups.com>
	 <ee114c7a-303d-4776-8562-314387348ec8@g1g2000pra.googlegroups.com>
	 <56378e320910270203i5ab08ec3gd48d1283b4f37bac@mail.gmail.com>
	 <5f765be60910270345w5ec689f5r8cdddb0b34b5e9e0@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type;
        bh=2QDuptHZ6517bYUiQLZ3wMIF1TpeM3WRZAy4ijqx9Kw=;
        b=Um5YpKGKyH61notDX6XusAYvjnGBK8dnxfKkrnf5YDMzFdvw6rb4T7/bsYgfjyZ0xe
         3/wsqMQk5AJPpeXlTwxjh5/hpYVyRkMSdG/gYOe+gfRPsmC4k//MZEeoeLwOI6yWWY1t
         Zr/bu2+fc45ygSMZOVGD4pe4sLS0w939D561c=
In-Reply-To: <5f765be60910270345w5ec689f5r8cdddb0b34b5e9e0@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> First thing to bear in mind: The mangle table is purely for packet
> manipulation actions and should not be used for filtering. Move the
> two accept rules into the filter table (just omit the -t mangle
> parameter).
>
> Port 21 is only the ftp control port - data uses port 20.
>
> If you have the ftp helper try
> $IPTABLES -t nat -A POSTROUTING -s 192.x.y.a -m helper --helper ftp -j SNAT --to-source 194.160.1.1

Sorry I made the corrections accordinly by placing in FILTER table
moving from MANGLE table. Added POSTROUTING nat rule for ftp helper.

But there is no change in the situation as I still see no packets
leaving from BOX1 to FTPServer. Still I see counters for respective
iptable rules getting incremented nothing more than that.

--
Thanks & Regards
www.codingfreak.blogspot.com

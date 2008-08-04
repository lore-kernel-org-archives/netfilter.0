From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Rules For MailServer
Date: Mon, 4 Aug 2008 06:05:15 +0200
Message-ID: <000001c8f5e7$4cfe8be0$e6fba3a0$@info>
References: <116049.97924.qm@web94002.mail.in2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <116049.97924.qm@web94002.mail.in2.yahoo.com>
Content-Language: nl
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> Hi List,
> I'm running a mailserver on qmail, it has
> eth0(192.168.1.100) & eth1(x.x.x.x), issue is that
> lots of unwanted SMTP connection has been established
> on that due to this reason socket has timeout
> frequently.
> 
> any kind of limit on connection, or any kind of
> solutions of securing SMTP will be appreciable.

I'm don't think netfilter rules will really help you here because you'll never know *from where* a connection will be made: you won't be able to block it before it's already there and you don't want to limit legitimate email. Are you already using DNSBL's like ZEN from Spamhaus or something like that?


Grts.
Rob



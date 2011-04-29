From: Mahmood Naderan <nt_mahmood@yahoo.com>
Subject: Re: can't initialize iptables table `filter'
Date: Fri, 29 Apr 2011 04:09:24 -0700 (PDT)
Message-ID: <716679.51968.qm@web111703.mail.gq1.yahoo.com>
References: <642302.28729.qm@web111719.mail.gq1.yahoo.com> <alpine.LNX.2.01.1104291246120.19355@obet.zrqbmnf.qr> <993639.25943.qm@web111704.mail.gq1.yahoo.com> <alpine.LNX.2.01.1104291305050.2679@obet.zrqbmnf.qr>
Reply-To: Mahmood Naderan <nt_mahmood@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1304075364; bh=LwPgKhAoiRYOO7IBpxHnIYfYw95Uhch74zPJQcltqwo=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:References:Date:From:Reply-To:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=BwwGiz9JSM/LX5m3oCAP4UEA+65aXyrlK10/rajfucCA7E8kqkCrGHllyDdJPyF0Jcc6EX05KJUAg0Bv1rYY3yqh5DVusTCb2ywA1pX1yMfOjcv3luO44Ob/FSE9txFj4ab92pYPfMvczCYWGfvD6aQWOv4tripxZgVklPqQulU=
In-Reply-To: <alpine.LNX.2.01.1104291305050.2679@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

>But I talked about the kernel.
Sorry but I am confused. What is wrong with kernel?=20
Since the client can boot and I can login to that,=A0I don't think any =
thing wrong=A0with kernel.

Can you exaplain more?

// Naderan *Mahmood;


----- Original Message -----
=46rom: Jan Engelhardt <jengelh@medozas.de>
To: Mahmood Naderan <nt_mahmood@yahoo.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Sent: Friday, April 29, 2011 3:35 PM
Subject: Re: can't initialize iptables table `filter'

On Friday 2011-04-29 12:50, Mahmood Naderan wrote:

>Thanks for your quick reply. Since the client has invalid IP, it can n=
ot access to the internet.
>So from the server I "chroot" the folder where the image exists and in=
stalled iptables.

But I talked about the kernel.


>>FATAL: Could not load /lib/modules/2.6.32-24-server/modules.dep: No s=
uch file or directory
>>iptables v1.4.4: can't initialize iptables table `filter': iptables w=
ho? (do you need to insmod?)
>>Perhaps iptables or your kernel needs to be upgraded.
>
>Make sure you kernel is configured with these enabled, and don't forge=
t=20
>to actually provide the modules, if not already built-in, because it=20
>does have the looks of a crippled installation, judging from the missi=
ng=20
>modules.dep.
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at=A0 http://vger.kernel.org/majordomo-info.html


From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: tc and priority
Date: Thu, 21 May 2009 16:07:41 +0300
Message-ID: <38db14850905210607s11fd9126i4bce902a668dfc6@mail.gmail.com>
References: <4A142FF7.1050700@duet.it>
	 <38db14850905202353r3c494d15se7f53f4b508f1ba0@mail.gmail.com>
	 <4A150D46.6090806@duet.it>
	 <38db14850905210414p41bba89exda7aacd88d905637@mail.gmail.com>
	 <4A15423C.5070208@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=YSm4ReCpX4iMyhd/jvC5RALh/pCrzO46+3gICOpB6VE=;
        b=gpi9EunZSgLXFX8ds+9LMz8z5GPSnaiE7RbluQ6hImKbCojo7CI/oe8ZzJZCE1zASs
         YMd+bda2bs8OPxXQghAGvWVw8XaGmPyhp6cmImtzKMb0n0Hd3i5xPsN8WMGBzhrubLtr
         uP9UUIOPW0kVBaXwhNGV/Dm3lCUpYtj2qSxV4=
In-Reply-To: <4A15423C.5070208@duet.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fabio Marcone <fabio.marcone@duet.it>
Cc: netfilter@vger.kernel.org

2009/5/21, Fabio Marcone <fabio.marcone@duet.it>:
> Hi,
> >
> > Different priorities are actual for filters with the same parent,
> > lower ones are looking first.
> >
> >
> ok
>
> > Check output:
> > tc -s filter show dev eth0
> > and
> > tc -s qdisc show dev eth0
> >
> >
> # tc -s -d qdisc show dev eth0
> qdisc prio 1: bands 3 priomap  1 2 2 2 1 2 0 0 1 1 1 1 1 1 1 1
> Sent 7021292 bytes 4684 pkt (dropped 0, overlimits 0 requeues 0)
> rate 0bit 0pps backlog 0b 0p requeues 0
> qdisc sfq 2: parent 1:1 limit 128p quantum 1514b flows 128/1024 perturb
> 10sec
> Sent 2997906 bytes 2003 pkt (dropped 0, overlimits 0 requeues 0)
> rate 0bit 0pps backlog 0b 0p requeues 0
> qdisc sfq 3: parent 1:2 limit 128p quantum 1514b flows 128/1024 perturb
> 10sec
> Sent 720 bytes 8 pkt (dropped 0, overlimits 0 requeues 0)
> rate 0bit 0pps backlog 0b 0p requeues 0
> qdisc sfq 4: parent 1:3 limit 128p quantum 1514b flows 128/1024 perturb
> 10sec
> Sent 4022666 bytes 2673 pkt (dropped 0, overlimits 0 requeues 0)
> rate 0bit 0pps backlog 0b 0p requeues 0
>
> # tc -s -d class show dev eth0
> class prio 1:1 parent 1: leaf 2:
> Sent 2997906 bytes 2003 pkt (dropped 0, overlimits 0 requeues 0)
> backlog 0b 0p requeues 0
> class prio 1:2 parent 1: leaf 3:
> Sent 6082 bytes 49 pkt (dropped 0, overlimits 0 requeues 0)
> backlog 0b 0p requeues 0
> class prio 1:3 parent 1: leaf 4:
> Sent 4022666 bytes 2673 pkt (dropped 0, overlimits 0 requeues 0)
> backlog 0b 0p requeues 0
>
>
> you see, class with higher priority sent less packets than class 1:3 (with
> lower priority). This is the proof that something is wrong, or I fall in
> error?
>
> class 1:2 receive packets from a ssh connection, used for test.
>
>
> Thanks,
> Fabio
>

I need additional info:
iptables -S
iptables -S -t mangle
and
tc -s filter show dev eth0.

There must be something wrong in your packet marking scheme.
What is your test environment?


-- 
Best regards
Anatoly Muliarski

From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: Fwd: Re: IP Tables slows network response times
Date: Mon, 15 Aug 2005 12:53:34 +0200
Message-ID: <4300742E.6050307@mnemon.de>
References: <57F9959B46E0FA4D8BA88AEDFBE5829074AD@pxtbenexd01.pxt.primeexalia.com>	<200508152018.33866.michael@networkstuff.co.nz>	<4300612F.6070603@mnemon.de>
	<200508152205.09409.michael@networkstuff.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508152205.09409.michael@networkstuff.co.nz>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Michael Hallager schrieb:
> 1. I have tried both IN and OUT and I am not seeing any error messages or 
> anything *obvious*
> 
> 2. With those FW rules in place I can do NSLOOKUP on the domain anme with no 
> problems.

Humm, strange. Could you please provide the output of iptables-save as
Rob said ?

Some time ago, I had a similar problem with slow responses (~30s delay).
It turned out that it was identd, as Grant assumed in your case too.
Adding a rule like

iptables -A OUTPUT -p tcp --dport 113 -j REJECT \
         --reject-with tcp-reset

solved this for me. I don't know the Slackware distro, but it seems,
that they use sendmail. If this is true, it is quite likely that identd
causes the trouble (at least it was true for me on one box).

Have a nice time,

Joerg



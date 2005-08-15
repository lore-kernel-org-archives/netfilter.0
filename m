From: Michael Hallager <michael@networkstuff.co.nz>
Subject: Re: Fwd: Re: IP Tables slows network response times
Date: Mon, 15 Aug 2005 23:04:15 +1200
Message-ID: <200508152304.15397.michael@networkstuff.co.nz>
References: <57F9959B46E0FA4D8BA88AEDFBE5829074AD@pxtbenexd01.pxt.primeexalia.com>
	<200508152205.09409.michael@networkstuff.co.nz>
	<4300742E.6050307@mnemon.de>
Reply-To: michael@networkstuff.co.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4300742E.6050307@mnemon.de>
Content-Disposition: inline
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

I use Postfix MTA and I am getting long waits on other aservices like www.
I will post the output.

> Some time ago, I had a similar problem with slow responses (~30s delay).
> It turned out that it was identd, as Grant assumed in your case too.
> Adding a rule like
>
> iptables -A OUTPUT -p tcp --dport 113 -j REJECT \
>          --reject-with tcp-reset
>
> solved this for me. I don't know the Slackware distro, but it seems,
> that they use sendmail. If this is true, it is quite likely that identd
> causes the trouble (at least it was true for me on one box).
>
> Have a nice time,
>
> Joerg

-- 
Michael Hallager
networkStuff ltd
www.networkstuff.co.nz | p.09.839.1000 | m.029.638.7883


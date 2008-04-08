From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: iptables -j ROUTE --gw xxxx not working?
Date: Tue, 8 Apr 2008 21:06:43 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804082104350.2229@fbirervta.pbzchgretzou.qr>
References: <ftge49$b4h$1@ger.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ftge49$b4h$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric B." <ebenze@hotmail.com>
Cc: netfilter@vger.kernel.org


On Tuesday 2008-04-08 20:38, Eric B. wrote:
>Hi,
>
>I'm running RHEL4.2 with iptables iptables v1.2.11 from pkg 
>iptables-1.2.11-3.1.RHEL4.
>
>I've tried the following command but been told that --gw argument is 
>unknown:
>
># iptables -t mangle -I POSTROUTING -j ROUTE --gw 192.168.104.251
>iptables v1.2.11: Unknown arg `--gw'

Then you don't have(*) ROUTE. I would not even bother with this
ancient method of policy routing. Nowadays, MARK is used together
with iproute2 to select output routes.


(*) The reason it does not display an error is deeper design problem
in iptables. Reason being that it cannot tell beforehand if ROUTE is
a chain or an actual target, and as such, failure to load a target
extension is considered normal until the tables are actually going to
be committed.

From: "Andreas Sachs" <andilist@gmx.de>
Subject: Re: Passed chains from local process to local ip
Date: Mon, 26 Jul 2004 09:54:19 +0200 (MEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <9196.1090828459@www51.gmx.net>
References: <1090825381.2463.59.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

Hello,
Thanks, for your answer.

> Anyway, I must admit I have some difficulties to understand your context
> and the particular reason why A cannot listen on ip-a, ip-c, ip-d and
> ip-e. The fact is locally generated packets NAT works. I use it all the
> time for SSH redirections, but I never tried it on locally destined
> traffic. The more I can say is try and see for yourself, but I guess it
> will work (don't forget local traffic is bound to lo interface, whatever
> local addresses it uses as source or destination).
> 

My Context:
ip-a: mysql 3
ip-c: mysql 3
ip-d: mysql 3
ip-e: mysql 3

new ip: ip-b: mysql 4.0

i can bind mysql to one or to all ip-addresses. so it's not possible to bind
mysql 3 to all ip-addresses without ip-b. 

my idea:
bind mysql3 to ip-a and "redirect" ip-c, -d, -e to ip-a.

Greetings
Andreas





-- 
250 MB Mailbox, 100 FreeSMS/Monat, 1000 MB Online-Festplatte
Jetzt GMX TopMail kostenlos testen http://www.gmx.net/de/go/topmail



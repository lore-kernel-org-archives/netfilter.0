From: Steve Comfort <steve@4Dllc.com>
Subject: Re: Very newB questions
Date: Fri, 25 Jun 2004 09:51:36 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40DBD988.7040502@4Dllc.com>
References: <40DACA0E.7050808@4Dllc.com> <40DB26F4.8000808@newkirk.us>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Joel Newkirk <firewalldude@newkirk.us>
Cc: netfilter <netfilter@lists.netfilter.org>

Hi John, gents,

> Have you bookmarked and printed Oscar Andreasson's tutorial at 
> http://iptables-tutorial.frozentux.net ?  I think it's the hands-down 
> best document around regarding iptables. 

First off John, thanks for all your suggestions: I won't comment yet, 
'cos its early in the morning here and my braincells are still chugging 
into life. I started looking at Netfilter yesterday :) Yes, I found the 
tutorial and have downloaded it and am busy trying to absorb as much as 
I can.

> Out of curiosity, is this an embedded system you are making into a 
> firewall/router, or what?  I've compiled and used iptables and ip 
> commands for ARM-based Sharp Zaurus handhelds.  (I actually used one 
> of mine as a wireless->GPRS gateway for a few days of DSL outage, 
> feeding my LAN traffic and newkirk.us domain traffic over 802.11b to 
> the Zaurus, then via IRDA over my cellphone GPRS tunnelled to my 
> office, an ISP) 

(You must have really needed to be connected :) Yes, the CPU is an 
IXP425, with an Atheros wireless chipset and ethernet PHY on the other 
side. Obviously the product is a broadband wifi thingy. I've just 
finished getting netSNMP working on it, as well as PPPOE, so the 
firewalling is about the last piece of the puzzle that needs to be 
placed before it can take its first steps into the big bad world out 
there :)

> Yep.  As Mr Stone mentioned, ACCEPT is a target, NOT a chain.  
> However, the way iptables rules work, if the target is NOT a valid 
> target (ACCEPT,REJECT,DROP,SNAT,DNAT,MASQUERADE, that sort of thing) 
> then it assumes it's the name of a custom rule chain, named ACC in 
> this case, and then fails when it can't find said chain.  I also 
> notice that it seems to be truncating the iptables version number?  
> Very odd. 

Indeed :) Hopefully I will be able to enlighten myself as to why sooner 
rather than later...

Best regards
Steve




From: DALive Editor <dalive@flashmail.com>
Subject: Re: netfilter before routing for local outgoing packets ?
Date: Thu, 25 Sep 2003 18:29:07 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F736C33.9030903@flashmail.com>
References: <20030924225535.GB3366@bougret.hpl.hp.com>
Reply-To: dalive@flashmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030924225535.GB3366@bougret.hpl.hp.com>
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
To: netfilter@lists.netfilter.org
Cc: jt@hpl.hp.com

Hello sir....I'm but a humble rookie. Yet, i recently, and very proudly 
compiled my first kernel. And this is a feature/option selectable in the 
kernel configuration, called "NAT of locak connections", under 
Networking Options > Networking Configuration. By the way, that was 
kernel 2.4.22.

Someone correct me if I'm wrong please.
Peace.


Jean Tourrilhes wrote:

>	Hi,
>
>	After reading various documentations, I've hit a deadlock. I
>hope you guys can help me.
>	<Not suscribed to the list, please cc me>
>
>	What I want to do :
>	I want to be able to route a specific *local* application
>differently from other applications. A crude simplification would be
>to route 'telnet' via eth0 and 'http' via eth1. In practice, I would
>really like the flexibility of having two set of routes.
>
>	I can define multiple routing tables (via 'ip route'), and set
>some rules defining which table should be used (via 'ip rule'). Those
>rules arebased on source address, dest address, TOS or
>fwmark. Netfilter allow me to set TOS or fwmark based on more or less
>what I want.
>		http://en.tldp.org/HOWTO/Adv-Routing-HOWTO/lartc.netfilter.html
>		http://linux-ip.net/html/tools-ip-rule.html
>		http://linux-ip.net/html/adv-multi-internet.html
>		(Excellent document by the way !)
>
>	Unfortunately, local outgoing packet don't seem to go through
>netfilter before passing through the routing table.
>		http://www.docum.org/stef.coene/qos/kptd/
>
>	Did I miss something obvious ? Is there any way to use 'ip
>rule' for local outgoing traffic ? Is there any other mechanism that
>would do what I want ?
>
>	Thanks...
>
>	Jean
>
>
>  
>




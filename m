From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: port 23000 block
Date: Tue, 17 Sep 2002 20:42:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020917194237.LZBN295.mta06-svc.ntlworld.com@there>
References: <001001c25e7d$1a569500$6501010a@esie.ensino.eb.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001001c25e7d$1a569500$6501010a@esie.ensino.eb.br>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tuesday 17 September 2002 8:04 pm, esie wrote:

> Hi, list
> I got some problems in my firewall

> #iptables -A INPUT -p all -i eth1 -j ACCEPT

You trust all your internal users - they have complete access to your 
firewall :-)

> #iptables -A FORWARD -p all -i eth1 -o eth0 -j ACCEPT

This allows internal users to send any protocol to the Internet - okay.

> iptables -A INPUT -p tcp --dport 25 -j ACCEPT
> iptables -A INPUT -p tcp --dport 110 -j ACCEPT
> iptables -A INPUT -p tcp --dport 53 -j ACCEPT
> iptables -A INPUT -p udp --dport 53 -j ACCEPT
> iptables -A INPUT -p tcp --dport 80 -j ACCEPT
> iptables -A INPUT -p tcp --dport 443 -j ACCEPT
> iptables -A INPUT -p tcp --dport 3128 -j ACCEPT
> iptables -A INPUT -p tcp --dport 23000 -j ACCEPT
> iptables -A INPUT -p tcp --dport 8999 -j ACCEPT
> iptables -A INPUT -p tcp --dport 13352 -j ACCEPT

Are all these services really running *on* the firewall machine ?

The INPUT chain is *only* for packets addressed to the machine itself, not 
for packets going through it.....

> iptables -t nat -A POSTROUTING -s 10.1.0.0/22 -o eth0 -p tcp --dport 21 -j
> MASQUERADE

These rules (I've shown just one of fourteen similar rules, for different 
services) suggest to me that you're not really running these services on the 
firewall at all - you're trying to allow people to access them *through* the 
firewall - in which case your INPUT rules above should be FORWARD rules, and 
the FORWARD rule allowing anything from the internal LAN to the Internet 
should not be there at all :-)

> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

Okay, this lets all the replies back in.

> iptables -A FORWARD -j DROP

I personally prefer to do this as a default policy: iptables -P FORWARD DROP 
but so long as it's the last rule in the chain the effect is the same...

> However, I"ve had problem with port 23000, which is necessary to run
> terminal emulator I tested the comunication without squid rules, but didn't
> work.

Please give us more information than "it didn't work"....

I do not recognise what protocol requires port 23000; perhaps you can either 
tell us what terminal emulation program you are using, or else tell us what 
packets you see with something like ethereal when you try to use it, which 
might indicate what the problem is.   Do you *know* whether the protocol you 
are using will work properly through a NATted connection ?

Antony.

-- 

There are only 10 types of people in the world:
those who understand binary notation,
and those who don't.


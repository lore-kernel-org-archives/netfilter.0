From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Why cant the firewall machine resolve host names??
Date: Sat, 26 Oct 2002 11:57:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021026105733.LQJJ292.mta03-svc.ntlworld.com@there>
References: <20021026104016.72923.qmail@web40712.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021026104016.72923.qmail@web40712.mail.yahoo.com>
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
To: Netfilter mailinglist <netfilter@lists.netfilter.org>

On Saturday 26 October 2002 11:40 am, Tasha Smith wrote:

> Hii,
> Sorry to keep bugging you, but i think i am finally getting this whole
> iptables thing. This is my exact script... Averything is working but the
> FIREWALL machine CAN NOT resolve host names? I cant surf the net with the
> firewall machine can you tell me why? I added the DNS rules but they didnt
> work?? All my lan computers can SURF the net?

I've snipped out stuff which seems okay....

> # Remove any existing rules from all chains.
> iptables --flush
> iptables -t nat --flush
> iptables -t mangle --flush
>
> # Unlimited access on the loopback interface.
> iptables -A INPUT  -i lo -j ACCEPT
> iptables -A OUTPUT -o lo -j ACCEPT
>
> # Set the default policy to drop.
> iptables --policy INPUT DROP
> iptables --policy FORWARD DROP
> iptables --policy OUTPUT ACCEPT
>
> iptables -t nat --policy PREROUTING ACCEPT
> iptables -t nat --policy OUTPUT DROP ######
> iptables -t nat --policy POSTROUTING DROP
>
> # iptables -t mangle --policy PREROUTING DROP
> # iptables -t mangle --policy OUTPUT DROP

Never, never, never set a default drop policy on nat or mangle tables.

It will stop things working.   The filter table is for filtering - do not try 
to filter (ie drop or reject) packets in the other two tables.

> # Allow stateful connections
> iptables -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> # Allow Access for DNS service.
> if [ "$CONNECTION_TRACKING" = "1" ]; then
>    iptables -A OUPUT -o eth0 -p udp \

You might want to spell OUTPUT correctly :-)

>             -s $IP_INET --sport 1024:65535 \

Why are you restricting the source port to be above 1024 ?   If you are 
running a name daemon on the machine it might be using a source port of 53.

>             -d 111.53.4.110 --dport 53 \
>             -m state --state NEW -j ACCEPT
> fi
>
> iptables -A OUTPUT -o eth0 -p udp \
>          -s $IP_INET     --sport 1024:65535 \
>          -d 111.53.4.110 --dport 53 -j ACCEPT

I don't quite understand why you have this rule as well as the conditional 
one above ?

> iptables -A INPUT  -i eth0 -p udp \
>          -s 111.53.4.110  --sport 53 \
>          -d $eth0_address --dport 1024:65535 -j ACCEPT

This should not be necessary because you have an ESTABLISHED,RELATED rule in 
your INPUT chain already - that will allow the replies back.

> if [ "$CONNECTION_TRACKING" = "1" ]; then
>     iptables -A OUTPUT -o eth0 -p tcp \
>              -s $IP_INET --sport 1024:65535 \
>              -d 111.53.4.110 --dport 53 \
>              -m state --state NEW -j ACCEPT
> fi
>
> iptables -A OUTPUT -o eth0 -p tcp \
>          -s $IP_INET --sport 1024:65535 \
>          -d 111.53.4.110 --dport 53 \

Are you missing a -j ACCEPT on this rule ?   Again, I don't understand why 
you have this as well as the one immediately above.

> iptables -A INPUT -i eth0 -p tcp ! --syn \
>          -s 111.53.4.110 --sport 53 \
>          -d $IP_INET --dport 1024:65535 -j ACCEPT

Not necessary with the ESTABLISHED,RELATED rule.

Antony.

-- 

Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer


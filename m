From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: still can't route using fwmark
Date: Sat, 18 Apr 2009 13:33:34 -0600
Message-ID: <op.uslkl80px1lyi3@localhost>
References: <op.uskfabufx1lyi3@localhost>
 <20090418082314.GA12566@internet24.de> <op.usld3aqfx1lyi3@localhost>
 <20090418184809.GA15649@internet24.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090418184809.GA15649@internet24.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Jacob <jacob@internet24.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Sat, 18 Apr 2009 12:48:09 -0600, Thomas Jacob <jacob@internet24.de> wrote:

>>How can I be sure fwmark is working?  Judging by my setup, which is very simple, packets and connections are being marked, but routing is not affected by fwmark.
>
> You can check the routing cache using "ip route show cache", and see what routing
> decisions were taken.

(Thanks), I see this:
debiandesk:/home/lloyd/data/loadbal# ip route show cache
72.249.38.123 from 10.60.27.199 dev ppp0
    cache  mtu 1500 advmss 1460 hoplimit 64
local 10.60.27.199 from 72.249.38.123 dev lo  src 10.60.27.199
    cache <local,src-direct>  iif ppp0
local 10.60.27.199 from 72.249.38.123 dev lo  src 10.60.27.199
    cache <local,src-direct>  iif ppp0
broadcast 192.168.1.255 dev eth0  src 192.168.1.1
    cache <local,brd>  mtu 1500 advmss 1460 hoplimit 64
209.40.204.55 from 10.60.27.199 dev ppp0
    cache  mtu 1500 advmss 1460 hoplimit 64
local 10.60.27.199 from 209.40.204.55 dev lo  src 10.60.27.199
    cache <local,src-direct>  iif ppp0
local 10.60.27.199 from 209.40.204.55 dev lo  src 10.60.27.199
    cache <local,src-direct>  iif ppp0

Should there be signs here of fwmark-related decisions?
 
> Maybe you could post your connmark related iptables rules as well.

I am logging the CONNMARK stuff now.  The logs show the connection marking taking place.  I just added a few comments.  Here are the rules, taken from my shell script:

# define CONNMARK1
iptables -t mangle -N CONNMARK1
iptables -t mangle -A CONNMARK1 -j MARK --set-mark 1
iptables -t mangle -A CONNMARK1 -j CONNMARK --save-mark
iptables -t mangle -A CONNMARK1 -j LOG --log-prefix 'iptables-mark1: ' --log-level info

# define CONNMARK1
iptables -t mangle -N CONNMARK2
iptables -t mangle -A CONNMARK2 -j MARK --set-mark 2
iptables -t mangle -A CONNMARK2 -j CONNMARK --save-mark
iptables -t mangle -A CONNMARK2 -j LOG --log-prefix 'iptables-mark2: ' --log-level info

# define RESTOREMARK
iptables -t mangle -N RESTOREMARK
iptables -t mangle -A RESTOREMARK -j CONNMARK --restore-mark
iptables -t mangle -A RESTOREMARK -j LOG --log-prefix 'restore-mark: ' --log-level info

# define SNAT1
iptables -t nat -N SNAT1
iptables -t nat -A SNAT1 -j LOG --log-prefix "SNAT $src0: " --log-level info
iptables -t nat -A SNAT1 -j SNAT --to-source $src0

# define SNAT2
iptables -t nat -N SNAT2
iptables -t nat -A SNAT2 -j LOG --log-prefix "SNAT $src1: " --log-level info
iptables -t nat -A SNAT2 -j SNAT --to-source $src1

# restore the fwmark on packets that belong to an existing connection
iptables -A PREROUTING -i eth0  -t mangle -m state --state ESTABLISHED,RELATED -j RESTOREMARK
# if there is a mark, can quit
iptables -A PREROUTING -t mangle -m mark ! --mark 0 -j RETURN

# mark all packets with fwmark 1
iptables -A PREROUTING -t mangle -j CONNMARK1

# mark every other packet with fwmark 2
iptables -A PREROUTING -t mangle -m statistic --mode nth --every 2 --packet 0 -j CONNMARK2

# fix source IPs to match interface IP
iptables -t nat -A POSTROUTING -o ppp0 -j SNAT1
iptables -t nat -A POSTROUTING -o ppp1 -j SNAT2

# masquerade eth0
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE


>
> Also you could try to remove those two routes in the default table, which I
> gather from your description are routes for $gw0=$gw1=10.60.255.254 (btw, the
> second will normally never be used anyway), I remember having problems before
> when routes matched after the policy route tables in the main table.

Do you mean the routes in the rt_link1 and rt_link2 tables?  I saw in a couple of articles on load balancing the suggestion that only the default route is necessary in each of the user-defined tables.  Of course, the only reason I use these tables is to be able to route through a different interface.

> Why are you using the same IP (10.60.255.254) on different links? Possibly you could
> try different IPs for that. I've haven't used PPP links for policy routing so far,
> could be that they behave differently in some significant way wrt. to all this,
> compared to broadcast networks.

10.60.255.254 is the gateway for each of the links ppp0 and ppp1.  I cannot change that, and I don't see why the gateway should have to be different.

I ought to point out that I am connecting to my ISP using GPRS (ppp tunneled over GSM telephone connection).  The ISP assigns a private IP to me, and the gateway IP is also private.   The ISP is natting to a public IP, and that public IP changes constantly!  I assume this is part of some load-balancing that my ISP is doing!

--
Lloyd

> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> !DSPAM:49ea206b166987818312239!
>
> 




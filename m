From: gapsf@yandex.ru
Subject: Re: Routing the DNS Traffic via specific interface.
Date: Fri, 3 Feb 2012 14:30:55 +0700
Message-ID: <1558553033.20120203143055@yandex.ru>
References: <EB822645982FC24F99C33D9513902AFAA877C9@inba-mail02.sonusnet.com> <607824512.20120125163350@yandex.ru> <EB822645982FC24F99C33D9513902AFA0CCED0A2@inba-mail01.sonusnet.com>
Reply-To: gapsf@yandex.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1328254215; bh=LmqMqbDN5rU9Qt44VrEP17rqCwK0eF2kcpPQqKRbXvA=;
	h=Date:From:Reply-To:Message-ID:To:CC:Subject:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=Od5LYPkdogb6g20BtDFJj9jVVgvacQb+RlB3CQs0kmUJNwHF0mIY66OQ+Fa4Yxu3l
	 kc0zh1obllnb2fV6+Ec+Tp9Y90E2Z605amhP4t6Nen/yww/Dc4fn2f2a56hfq5HFYy
	 GX+Lc8GHD/fadjhWfp8lQ7GR2pJU2kzJSXn3SCNU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1328254215; bh=LmqMqbDN5rU9Qt44VrEP17rqCwK0eF2kcpPQqKRbXvA=;
	h=Date:From:Reply-To:Message-ID:To:CC:Subject:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=Od5LYPkdogb6g20BtDFJj9jVVgvacQb+RlB3CQs0kmUJNwHF0mIY66OQ+Fa4Yxu3l
	 kc0zh1obllnb2fV6+Ec+Tp9Y90E2Z605amhP4t6Nen/yww/Dc4fn2f2a56hfq5HFYy
	 GX+Lc8GHD/fadjhWfp8lQ7GR2pJU2kzJSXn3SCNU=
In-Reply-To: <EB822645982FC24F99C33D9513902AFA0CCED0A2@inba-mail01.sonusnet.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Netravali Ganesh <gnetravali@sonusnet.com>
Cc: netfilter@vger.kernel.org

Well, I know two ways,
but I don't know what is right from the standpoint of an more experienced sysadmin.
Solution #1
Script that periodically do "health check" of a link (i.e. route) by ping
some reliable host (router) reachable via eth2.
See example below. Run it in background from another bash script like `chkroutes &`.
Or even try to connect to DNS-server with `nc` instead of pings:
`nc -c exit -w1 <ip_of_DNS_server> 53`
Because ISPs equipment hardware exploited in this scenario,
I do not know whether it is acceptable according to netiquette.
If you want to react only to the interface down on gateway you should
use somthing like "post-up", "post-down" in /etc/network/interfaces in Debian.
On post-up add rule in RPDB, on post-down you delete this entry.
For tarffic switching you have three options:
- modify additional routing tables isp2: add/delete default route or
- modify RPDB rules: add/delete 'from all fwmark 0x4 lookup isp2' entry or even
- modify iptables rules - add/delete MARK rule.

Solution #2
Use dynamic routing protocols and daemons like zebra or quagga.
For me it's look like overkill in this simple situation.
And I still can't undestand how exactly routing daemon on gateway finds that route is dad.
So applicability of dynamic routing for this purposes is still unclear for me.

=== chkroutes =======================================================================================
#!/bin/sh

SWITCHED=0
TARGET=<some_reliable_host>

test_route2_cycle()
{
    while true; do
        ping -I eth2 -c3 $TARGET
        PING=$?
        if [ "$PING" == "0" && "$SWITCHED" == "1"]; then
            # TARGET reachable
            ip rule add from all fwmark 0x4 table inet2
            ip route flush cache
            SWITCHED=0
        else
            # TARGET unreachable
            if [ "$SWITCHED" == "0" ]; then
                ip rule del from all fwmark 0x4 table inet2
                ip route flush cache
                SWITCHED=1
            fi
        fi
        sleep 10
    done
}

echo $$ > /var/run/chkroutes.pid
test_route2_cycle
==============================================================================================


NG> Hi..
NG> Thanks for the help. This worked excellent for me. I have another question on this.
NG> Suppose if I have 2 interfaces say eth2 and eth3. If I want to implement conditional routing, say ex, eth2 is down and all DNS traffic needs to redirect via eth3 upon detecting the link failure, how do I do that.



NG> Thanks
NG> Ganesh Netravali


NG> -----Original Message-----
NG> From: gapsf@yandex.ru [mailto:gapsf@yandex.ru] 
NG> Sent: Wednesday, January 25, 2012 3:04 PM
NG> To: netfilter@vger.kernel.org; Netravali Ganesh
NG> Subject: Re: Routing the DNS Traffic via specific interface.

NG> No. You should use "Policy routing" with MARK target in iptables.

NG> Mark outgoing DNS packets with iptables in mangle PREOROUTING for example.
NG> # iptables -t mangle -A PREROUTING -p udp --dport 53 -j MARK --set-mark 0x4

NG> Create additional routing table with different routing rules.
NG> Add new entry in /etc/iproute2/rt_tables =========================================
NG> #
NG> # reserved values
NG> #
NG> 255     local
NG> 254     main
NG> 253     default
NG> 0       unspec
NG> #
NG> # local
NG> #
NG> #1     inr.ruhep
NG> 1      isp2 # <- new entry
NG> =========================================

NG> Then execute
NG> # ip route flush table isp2
NG> and add defalt route into newly created table # route add default via <ip_of_your_eth2_gateway> dev eth2 table isp2

NG> Add new policy in RPDB.
NG> # ip rule add from all fwmark 0x4 table isp2

NG> Check RPDB
NG> # ip rule show
NG> You should view somthing like this:
NG> 0:      from all lookup local
NG> 32763:  from all fwmark 0x4 lookup isp2
NG> 32766:  from all lookup main
NG> 32767:  from all lookup default

NG> In result: all traffic routed with main routing table, except marked DNS traffic routed via "isp2" routing table via its default route and iface.
NG> View picture http://postimage.org/image/nn9owf5x7/ for example.

NG>> Hi ..

NG>> I have 2 interfaces eth0 and eth1 on the system connected to different subnets. I need to route all the outgoing DNS traffic of the system via eth1 interface. Pls let me know if below IPTABLES rules is proper way ?

NG>> Block the output DNS traffic on eth0 interface.

NG>> iptables -A FORWARD -p udp -o eth0 --dport 53 -j DROP

NG>> Forward output DNS traffic from eth1 interface

NG>> iptables -A FORWARD -p udp -o eth1 --dport 53 -j ACCEPT


NG>> Thanks
NG>> Ganesh


NG>> --
NG>> To unsubscribe from this list: send the line "unsubscribe netfilter" 
NG>> in the body of a message to majordomo@vger.kernel.org More majordomo 
NG>> info at  http://vger.kernel.org/majordomo-info.html


From: Paul Annesley <paul.annesley@gmail.com>
Subject: SNAT and outbound ICMP echo-reply on 2.4.20
Date: Fri, 12 Nov 2004 00:30:43 +1100
Message-ID: <99fb0588041111053034c67f12@mail.gmail.com>
Reply-To: Paul Annesley <paul.annesley@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi,

To summarise, it seems that netfilter in 2.4.20 does not SNAT outbound
ICMP echo-replies (the echo-request reached the LAN host via a DNAT),
but netfilter in 2.4.27 does seem to.
Does anyone know anything about this?

I'm running OpenWRT linux on a Linksys WRT54GS router...

root@wrt54gs:~# uname -a
Linux wrt54gs 2.4.20 #1 Sun Sep 12 04:13:25 EDT 2004 mips unknown

root@wrt54gs:~# iptables --version
iptables v1.2.9

root@wrt54gs:~# dmesg |grep -i netfilter
ip_tables: (C) 2000-2002 Netfilter core team

The primary WAN interface is vlan1 which has IP address x.x.x.54/24

I'm testing with these commands:
ifconfig vlan1:55 x.x.x.55
iptable -t nat -F
iptables -t nat -A PREROUTING -d x.x.x.55 -j DNAT --to-destination
192.168.64.200
iptables -t nat -A POSTROUTING -s 192.168.64.200 -j SNAT --to-source x.x.x.55
iptables -t nat -A POSTROUTING -s 192.168.64.0/24 -j SNAT --to-source x.x.x.54

.. which results in this nat ruleset:
root@wrt54gs:/etc/init.d# iptables -t nat -L -v
Chain PREROUTING (policy ACCEPT 3672 packets, 565K bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 DNAT       all  --  any    any     anywhere            
x.x.x.55       to:192.168.64.200

Chain POSTROUTING (policy ACCEPT 278 packets, 35012 bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 SNAT       all  --  any    any     192.168.64.200      
anywhere            to:x.x.x.55
    0     0 SNAT       all  --  any    any     192.168.64.0/24     
anywhere            to:x.x.x.54

Chain OUTPUT (policy ACCEPT 31 packets, 3251 bytes)
 pkts bytes target     prot opt in     out     source               destination


This results in 192.168.64.200 being 1:1 NAT as x.x.x.55, and all
other addresses in 192.168.64.0/24 are one-way SNATed as x.x.x.54

Everything works fine, except that when I ping x.x.x.55 from outside,
the echo-reply from 192.168.64.200 is not SNATed by netfilter -
instead it is forwarded with source address 192.168.64.200 and
subsequently filtered by a border router ACL.

I have inserted a match-only rule (no target, just to see the
counters) like this:
iptables -t nat -I POSTROUTING -s 192.168.64.200 -p icmp --icmp-type echo-reply

After pinging the x.x.x.55 from an external host, and using tcpdump to
watch the echo-replies leave the NAT box with source address
192.168.64.200, the counters for the rule I inserted remain at 0 - it
seems the echo-reply is never reaching the nat table, however it is
being forwarded without SNAT translation.  FORWARD policy is ACCEPT
and there's no FORWARD rules getting in the way.

The same kind of setup running kernel 2.4.27 seems to work fine..
pings to the WAN IP are DNATed to the LAN host, and the LAN hosts
echo-replies are SNATed back to the WAN IP before being sent on to
echo-request source.

Was something changed between 2.4.20 and 2.4.27 which would cause this
difference?

Also, is it possible to somehow manually change the source IP to
x.x.x.55 for any packets matching something like -d 192.168.64.200 -p
icmp --icmp-type echo?

Thanks,
Paul


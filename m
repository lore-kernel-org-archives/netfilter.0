From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Help needed understanding what I am doing wrong.
Date: Mon, 3 Jun 2002 22:32:41 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206032132.g53LWgA23232@Networker.rockstone.co.uk>
References: <002a01c20b42$ea39aa70$6301a8c0@JJONES1>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <002a01c20b42$ea39aa70$6301a8c0@JJONES1>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: 'Iptables' <netfilter@lists.samba.org>

On Monday 03 June 2002 10:09 pm, John Jones wrote:

> echo 1 > /proc/sys/net/ipv4/ip_forward
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -p tcp -d 10.0.0.10 --dport 53 -j ACCEPT
> iptables -A FORWARD -p udp -d 10.0.0.10 --dport 53 -j ACCEPT
> iptables -t nat -I PREROUTING 1 -p tcp -d 66.38.133.120 --dport 53 -j
> DNAT --to 10.0.0.10:53
> iptables -t nat -I PREROUTING 1 -p udp -d 66.38.133.120 --sport 53 -j
> DNAT --to 10.0.0.10:53

If this is your entire ruleset, the problem is that your name server is ging 
out to the Internet with a source address of 10.0.0.10, therefore nothing 
else can reply to it.

(By the way, you should change that --sport in the last rule to --dport.)

Anyway, I'm happy to have a go at a ruleset for you, but please can you 
remind me exactly what you're trying to do ?   Looking back over the thread 
of this question, you've said you're trying to redirect DNS requests to a 
name server on the DMZ - is this DNS requests from machines on the internal 
LAN, or machines on the outside (or both) ?

I'll assume for the moment you've got an internal LAN, a DMZ with a DNS 
server on it, and you want to make sure that all DNS requests from machines 
on the internal LAN get redirected to the DMZ DNS server, which can then go 
out to the Internet to resolve queries.   If that's wrong, just let me know 
and I'll have another go.

iptables -A PREROUTING -t nat -i $LAN_IF -p tcp --dport 53 -j DNAT --to 
10.0.0.10
iptables -A PREROUTING -t nat -i $LAN_IF -p udp --dport 53 -j DNAT --to 
10.0.0.10

These two rules will catch all DNS lookups from internal machines and send 
them to the DNS server on 10.0.0.10

iptables -A POSTROUTING -t nat -o $EXT_IF -j SNAT --to $EXT_IP

This rule will masquerade all your outgoing packets (from either the internal 
LAN or the DMZ) behind the external address of the firewall

iptables -A FORWARD -i $LAN_IF -j ACCEPT
iptables -A FORWARD -i $DMZ_IF -j ACCEPT

These two rules will forward all packets which come from either the internal 
LAN or the DMZ through the firewall (ie they will not allow packets which 
come from the external interface)

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

This will allow all replies through the box, no matter where they're from.


I think that should do it.


Antony.


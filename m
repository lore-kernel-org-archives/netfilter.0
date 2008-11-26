From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: http PREROUTING works but other ports do not
Date: Wed, 26 Nov 2008 11:07:59 -0600
Message-ID: <492D826F.3040408@riverviewtech.net>
References: <20081110194846.79984f14@zas.gateway.2wire.net>	<491A7300.5010200@riverviewtech.net> <20081112170200.410edbe5@zas.gateway.2wire.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20081112170200.410edbe5@zas.gateway.2wire.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/12/08 17:02, mictlan tecutli wrote:
> first of all thanks for the quick responce. i'll attempt to answer 
> your questions as clearly as possible.

You are welcome.  I'm sorry that this reply has been so long in coming, 
but I have not had the time to provide a proper reply.

> nope i'm using both of them. i have ssh on port 2222 on the host 
> running the firewall (that is to say the host hosting the vservers). 
> and port 2220 get forwared to 10.10.10.20:22, that is to say the 
> standard ssh port on 10.10.10.20, which is on a virtual interface 
> callded dummy0:something. each vserver has an ip in the 10.10.10.* 
> net, and the external interface is eth0 and corresponds to 
> xxx.xxx.xxx.9.

*nod*

> i've tried using a destination address ("-d") of the specific address 
> (xxx.xxx.xxx.9) and the subnet (xxx.xxx.xxx.0/24) on diferent in 
> order to try all the posible variations hope that one of them would 
> work :/

Hum.  I'm betting that it will work when we figure out what is 
preventing things from working.

> eth0 is external and dummy0 is internal virtual interface.

Thank you.

> i have specific ips (10.10.10.*) assignied to the individial virtual 
> virtual servers. all of the virtual servers run ssh on port 22. in 
> the host,    iptables recieves a request for, say, port 2220 and sends 
> it on to port 22 and the ip in question (10.10.10.20 in this case).

*nod*

Just to make sure we are on the same page, is it safe to say the following:
  - All external access is to the same IP xxx.xxx.xxx.9.
  - The host has its ssh high ported to port 2222.
  - Each virtual system has an internal IP of 10.10.10.<something>.
  - Each virtual systems SSH is high ported to 22<something> where the 
<something> is the last octet of the IP.
    (Note that this scheme, nice as it is, will not allow you to have an 
internal virtual system at 10.10.10.22.)

(I'm presuming the above is correct for the sake of discussion.)

I would expect this very basic firewall setup be sufficient for what you 
are wanting.

    iptables -t nat -A PREROUTING -i ${EXT} -d xxx.xxx.xxx.9 -p tcp -m 
tcp --dport 2220 -j DNAT --to-destination 10.10.10.20:22
    iptables -t nat -A PREROUTING -i ${EXT} -d xxx.xxx.xxx.9 -p tcp -m 
tcp --dport 2230 -j DNAT --to-destination 10.10.10.30:22
    iptables -t nat -A PREROUTING -i ${EXT} -d xxx.xxx.xxx.9 -p tcp -m 
tcp --dport 2240 -j DNAT --to-destination 10.10.10.40:22

    iptables -t nat -A POSTROUTING -o ${EXT} -j MASQUERADE

    iptables -t filter -P FORWARD DROP
    iptables -t filter -A FORWARD -i ${EXT} -o ${INT} -m state --state 
ESTABLISHED,RELATED -j ACCEPT
    iptables -t filter -A FORWARD -i ${INT} -o ${EXT} -j ACCEPT
    iptables -t filter -A FORWARD -i ${EXT} -o ${INT} -d 10.10.10.20 -p 
tcp -m tcp --dport 22 -j ACCEPT
    iptables -t filter -A FORWARD -i ${EXT} -o ${INT} -d 10.10.10.30 -p 
tcp -m tcp --dport 22 -j ACCEPT
    iptables -t filter -A FORWARD -i ${EXT} -o ${INT} -d 10.10.10.40 -p 
tcp -m tcp --dport 22 -j ACCEPT

If you can, please try this type of firewall rule set to see if things 
work.  I'm wondering if there is not something else in play that is 
interfering with the result you want.

This is a very minimalist    iptables firewall that does very simple 
stateful filtering.  You will likely want to filter inbound traffic to 
the host (but is not forwarded to any virtual systems).  You may even 
want to, and possibly should, filter outbound traffic from the virtual 
systems.

A suggestion.  If you do egress filtering, I'd add the following rule to 
the end of the filter table FORWARD chain:

    iptables -t filter -A FORWARD -i ${INT} -o ${EXT} -s 10.10.10.0/24 
-j REJECT

This will allow your firewall to send ICMP notifications back to 
internal systems immediately if their outbound traffic is rejected, thus 
(hopefully) preventing timeouts and other weird errors.

You may want to REJECT traffic on the external interface as well, 
however this practice is questionable.  IMHO I think this is a nice idea 
(same reason as you want to use it internally) but there are 
implications to doing it, not the least of which include bandwidth and / 
or participating in (D)DoS attacks.

Additionally, you may want to do the following two rules that allow the 
virtual systems to be able to reach each other via the external address.

  - Remove the "-i ${EXT}" from the nat table PREROUTING chain to allow 
the rules to operate on inbound and outbound traffic.
  - Add the following rule to your nat table POSTROUTING chain to 
support this and avoid the "TCP Triangle".

    iptables -t nat -A POSTROUTING -o ${INT} -s 10.10.10.0/24 -d 
10.10.10.0/24 -j MASQUERADE

Refer to other posts in the mailing list archive to understand why.)



Grant. . . .

From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Forwarding Protocol 41 (ipv6)
Date: Fri, 18 Aug 2006 15:40:39 +0200
Message-ID: <44E5C357.3060601@plouf.fr.eu.org>
References: <J40ELH$5F97F9C8FEC17F9A0CAFB5C57BFEE593@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <J40ELH$5F97F9C8FEC17F9A0CAFB5C57BFEE593@libero.it>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

Hello,

claudio987@libero.it a =E9crit :
> Hi, I have a problem.
> I have a Dlink router working with a linux based firmware
> This router uses an "outbound" nat and then is not possible to
> forwarding protocol 41 (protocol used to ipv6 tunnel) on an internal ip
> address of my lan. Now I ask you if is possible to change nat into
> bidirectional nat and than have the bossibility to set an entry in
> iptables to forward protocol 41

Assuming that the local IPv6 tunnel endpoint IPv4 address is 192.168.0.2=20
and the router's external interface is ppp0, try this :

# inbound destination NAT for IPv6 tunnel
iptables -t nat -A PREROUTING -i ppp0 -p 41 -j DNAT --to 192.168.0.2
# inbound forwarding for IPv6 tunnel
iptables -t filter -A FORWARD -i ppp0 -p 41 -d 192.168.0.2 -j ACCEPT


From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Filter by IP address problems
Date: Thu, 12 Dec 2002 09:39:29 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212120939.29993.netfilter@newkirk.us>
References: <FLEKIPPLAEDMJMOOBBDPAEHJDLAA.stewart.thompson@shaw.ca> <1039702392.6682.14.camel@damon.betcolan>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1039702392.6682.14.camel@damon.betcolan>
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
To: Damon Brinkley <damon@betcoinc.com>, stewart.thompson@shaw.ca
Cc: netfilter@lists.netfilter.org

On Thursday 12 December 2002 09:13 am, Damon Brinkley wrote:
> Thanks Stu but I'm still doing something wrong.
>
> Here's the rules I have now.
>
> ###############################
>
> echo 0 > /proc/sys/net/ipv4/ip_forward
>
> /sbin/modprobe iptable_nat
> /sbin/modprobe ip_conntrack
> /sbin/modprobe ip_conntrack_ftp
>
> /sbin/iptables -F
> /sbin/iptables -t nat -F
> /sbin/iptables -X
> /sbin/iptables -t nat -X
>
> /sbin/iptables -P INPUT DROP
> /sbin/iptables -P OUTPUT DROP
> /sbin/iptables -P FORWARD DROP
>
> # INPUT CHAIN
> # NONUSERS =3D 172.17.0.0/20
> /sbin/iptables -A INPUT -s $NONUSERS -j ACCEPT
>
> # FORWARD CHAIN
> /sbin/iptables -A FORWARD -s $NONUSERS -j ACCEPT
>
> # POSTROUTING
> /sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>
> echo 1 > /proc/sys/net/ipv4/ip_forward
>
> ######################################
>
> This should give my laptop, IP 172.17.0.244, complete access but I get
> Request timed out when pinging www.yahoo.com
>
> Here's what I get when running iptables -nL

You can also run "iptables -t nat -nL" to show the nat table chains.  As=20
with most iptables calls, if you don't specify it assumes filter table.

anyway, make sure you are also doing:
echo 1 > /proc/sys/net/ipv4/ip_dynaddr
so that it will actually have (and maintain) the current IP address for=20
masquerading.

Finally, you are not allowing any return connection back to the laptop=20
through the FORWARD chain.  Try adding:

/sbin/iptables -A FORWARD -d $NONUSERS -m state \
--state ESTABLISHED -j ACCEPT

and it should work for browsing.  If you use "ESTABLISHED,RELATED"=20
instead then it should be more reliable, since it will allow icmp=20
traffic related to the browsing.

Also, you are allowing the laptop to communicate to the firewall box=20
local processes (INPUT) but not allowing anything back from it to the=20
laptop (OUTPUT).  If you need them to communicate with each other, apart=20
from the firewall forwarding (separate issues) then you need to allow=20
communications in OUTPUT that go to the laptop as well, either simply=20
ACCEPTing appropriate traffic, or using a state rule as above in OUTPUT=20
to allow local processes on the firewall box to reply, but not initiate=20
connections to the laptop.

I've never worked with ipchains, just iptables, but I gather that with=20
ipchains it was necessary to allow traffic through INPUT in order to=20
forward.  (I've seen this a lot this past week :^)  With iptables the=20
packets hit prerouting then netfilter decides whether the packet is=20
destined for the local box, or forwarding, and it goes to EITHER one or=20
the other, but not both.  INPUT and OUTPUT are for the local box itself,=20
and don't have any affect at all on forwarding, SNAT/DNAT, etc.

j



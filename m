From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: problem with ip tables help required
Date: Sat, 8 Feb 2003 11:38:08 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302081138.08120.netfilter@newkirk.us>
References: <OF56582234.0D18279E-ON65256CC6.00202B97-65256CC6.00203F99@diamond.philips.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OF56582234.0D18279E-ON65256CC6.00202B97-65256CC6.00203F99@diamond.philips.com>
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
To: purushotham.krishnappa@philips.com, netfilter@lists.netfilter.org

On Friday 07 February 2003 12:56 am, purushotham.krishnappa@philips.com=20
wrote:
> Hi
>
>
> The requirement is like this
>
>
>               WebServer-------------------- -
> ----Router/Firewall---------------------------------------client
> 10.60.90.7/8            eth1                  eth0                   =20
>                     192.168.10.15 10.60.90.5/8               =20
> 192.168.10.5/24

> i am not able to connect to webserver from 192.168.10.5  to 10.60.90.7
>    BUT i can ping 10.60.90.5 I need clients to connect from
> 192.168.10.0/24  to able to connect to only port 80 on 10.161.90.7.8

> # (4) FORWARD chain rules
> # Accept the packets we want to forward
> iptables -A FORWARD -i eth1 -j ACCEPT
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

Unless I read your situation wrong, the connections from 192.168.10.x=20
will be coming in eth0, not eth1.  These rules allow any traffic from=20
10.60.x.y coming in eth1 through, and any EST/REL traffic through either=20
way  You also need:

iptables -A FORWARD -i eth0 -p tcp --dport 80 -d 10.60.90.5 -j ACCEPT

to allow the DNATted connections through.

j



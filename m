From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: Port Forwarding Need help
Date: Thu, 16 Dec 2004 12:05:36 -0500 (EST)
Message-ID: <10908.142.169.215.10.1103216736.squirrel@142.169.215.10>
References: <1282c4c804121607563fa643e1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1282c4c804121607563fa643e1@mail.gmail.com>
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
To: nitin mandolkar <nitinmandolkar@gmail.com>
Cc: netfilter@lists.netfilter.org

On Thu, December 16, 2004 10:56 am, nitin mandolkar said:
> Need Help in port forwaeding.
>
> This is my set up.
>
>                   DSL ROUTER (WAN IP : x.x.x.x | LAN IP 192.168.5.1)
>
>                                               |
>                                               |
>                                               |
>                  Linux Machine (eth0: 192.168.0.2 eth1: 192.168.5.12)
>                                               |
>                                               |
>                                               |
>                  Windows machine(eth1: 192.168.5.4)(IIS is running on
>                  this machine on port 80)

Your setup is not clear and is most likely to be wrong.

Are you able to ping linux machine from the windows one?
What the eth0 binding on linux box is for?
Are three nodes belonging to the same ethernet segment ?

>
>                 From router i am forwarding the request to linux
> machine to port 80.
>                 any one from out site they are able to see a test
> pages on linux
>                 machine.
>
>               i want to forward any request coming on port 80 on linux
> machine to
>                windows machine on port 80.

If all three nodes are belonging to the same segment, I don't see why
you DNAT to the linux box instead of the Windows one.

>
>
> /sbin/iptables -A PREROUTING -t nat -p tcp -s 192.168.5.1 -d
> 192.168.5.12 --dport 80  -j DNAT --to-destination  192.168.5.4:80

Unless you are SNATing forwarded requests (which I doubt) coming from
the Internet to look like coming from your DSL router, the above
rule would fail.

i.e. -s 192.168.5.1 specifies to match packets with this source address.

What you need is something along those lines :

# Change destination for Internet inbound connections on dest TCP 80
iptables -t nat -A PREROUTING -p tcp -d  192.168.5.12 --dport 80 -j DNAT
--to 192.168.5.4

# Accept FORWARDed packets
iptables -A FORWARD -p tcp -d 192.168.5.4 --dport 80 -j ACCEPT

I also assume you are not filtering in POSTROUTING.

>
> I Use above iptables entry but it is not working.
>

Maybe you need to re-think about your setup and why you are doing it
that way. In such a case, if everything goes wrong, resend your new setup
schema (this time a bit more clear).

> Nitin mandolkar.
>
>

HTH,

Samuel





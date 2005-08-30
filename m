From: Jakub Wartak <vnulllists@pcnet.com.pl>
Subject: Re: max-src-conn-rate (Connection rate throttling per IP)
Date: Tue, 30 Aug 2005 15:07:16 +0200
Message-ID: <200508301507.16497.vnulllists@pcnet.com.pl>
References: <200508301440.59667.benoit.panizzon@imp.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508301440.59667.benoit.panizzon@imp.ch>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Dnia wtorek, 30 sierpnia 2005 14:40, Benoit Panizzon napisa=B3:
> Hi all
>
> I'm looking for a way to prevent connection DOSing of specific services.
>
> The goal is to count the connection rate per conneting ip and then reject
> those connections if they pass a certain limit.
>
> It looks like OpenBSD's pf is the only packet filter (except some
> commerctial Firewalls) which has this ability.
>
> The best I managed with iptables is to throttle the connection rate for a
> specific port, but this of course affecs normal users trying to use that
> service and does not change the fact of the service being DOSed.
>
> The other possibility I found is to write my own userspace QUEUE target
> connection rate tracker via the iptables api. But as I'm not a programmer
> and I think this is a quite common request I just wonder:
>
> Hasn't allready somebody written such a per source connection rate
> limmiter?
>

Have you tried hashlimit ?

ex1. ( not tested ):=20

# seems that hashlimit doesn't support negation ( "!" )
# example way to achieve the same result:
iptables -t raw -N ANTIDOS
iptables -t raw -A ANTIDOS -m hashlimit --hashlimit 5/s \
=A0=A0=A0=A0=A0=A0=A0=A0--hashlimit-name limitDoS --hashlimit-mode srcip,ds=
tport -j ACCEPT
iptables -t raw -A ANTIDOS -j DROP

iptables -t raw -A PREROUTING -i eth0 -p tcp --syn -j ANTIDOS

Another idea is to add "bad" IPs to recent list and then drop all traffic f=
rom=20
them for example for 12 hours.

You could also use connlimit.

=2D-=20
Jakub Wartak
=2Dvnull
=46reeBSD/OpenBSD/Linux/Solaris/Network Administrator


From: =?iso-8859-1?B?SOVrYW4gRW5nYmxvbQ==?= <cynic_0@hotmail.com>
Subject: Re: source-mac filtering
Date: Sun, 11 Jan 2004 18:36:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Sea1-F70KoMFYsDSzhx00053a6c@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hi,

Tried this (REDIRECT to another non-dhcp-standard udp-port) as well now, an=
d=20
the test indicates the same thing as before.
Started the dhcp deamon at udp/54356 and redirected everything coming in to=
=20
the machine on upd/67 (normal dhcp) to port 54356.
What happaned was that the dhcp-server did not respond. When using strace=20
one could see that there in nothing coming in on the socket.

The redirect-rule seems to work fine, pkts increasing every time something =

is received on port 67 :
# iptables -L -v -n -t nat
Chain PREROUTING (policy ACCEPT 11 packets, 756 bytes)
pkts bytes target     prot opt in     out     source              =20
destination
   27  8856 REDIRECT   udp  --  *      *       0.0.0.0/0           =20
0.0.0.0/0          udp dpt:67 MAC 00:B0:D0:BF:27:E8 redir ports 54356


However, when starting the dhcpd on port 67 again (still with the=20
redirect-rule in the nat-table) the dhcp server responds, indicating (as fa=
r=20
as I can see, I'm a tester not a designer) tha the dhcpd is somehow=20
"listening on a lower level" than the iptables are working.

I'll try with another dhcpd.

br H=E5kan E.



>From: Alistair Tonner <>
>To: H=E5kan Engblom <cynic_0@hotmail.com>,  netfilter@lists.netfilter.org
>Subject: Re: source-mac filtering
>Date: Sun, 11 Jan 2004 00:55:44 -0500
>
>On January 10, 2004 06:20 pm, H=E5kan Engblom wrote:
> > Hi,
> >
> > I've run in to a strange problem. I have a dhcp-server on a 2.4.22=20
>kernel
> > with a 1.2.8 iptables. The dhcp-server is configured only to offer
> > IP-addresses to one single mac-address (it is a single host on a private
> > network)
> >
> >
> > Does anyone have a clue ?
> >
> > br H=E5kan Engblom
> >
> > Some "logs" :
>
>	<relevant info snipped, since it has been through the list several times>
>
>	Can I think out loud for a moment???
>
>	have dhcpd listen on a *different* port than normal
>	have iptables grab relevant mac address broadcasts and redirect to=20
>appropriate port?
>
>	drop anything not in relevant mac address range?
>
>	Perhaps this might work???
>	anyone care to try?? --my personal net is static ... thankgod its only 5 =

>boxen
>
>	Alistair Tonner
>

_________________________________________________________________
Hitta r=E4tt p=E5 n=E4tet med MSN S=F6k http://search.msn.se/



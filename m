From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DHCP and Ident
Date: Sat, 10 Jul 2004 15:51:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407101551.35291.Antony@Soft-Solutions.co.uk>
References: <20040710141220.GA22967@itstud.chalmers.se>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040710141220.GA22967@itstud.chalmers.se>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Saturday 10 July 2004 3:12 pm, Erik Wikstr=F6m wrote:

> Hi
>
> I've been thinking for some time now about the rules needed to allow th=
e
> firewallbox to receive its public IP from a DHCP-server but everywhere =
I
> look it's done in different ways.

> But then I realised that since I don't have a source or destination
> address netfilter will probably not be able to track the connection.

You'll find it (almost?) impossible to use netfilter to control DHCP requ=
ests.

You can do all the usual stuff with follow-up lease renewals and so on, b=
ut as=20
you already said, before the first DHCP request, you don't have an IP=20
address, and you're right - the IP stack and netfilter don't do much unde=
r=20
those circumstances.

Another way to look at what I'm saying is "you don't have to do anything=20
special with netfilter to allow your machine to get an address by DHCP", =
so I=20
wouldn't worry about it.

> $IPTABLES  -I INPUT -i $LAN_IFACE -p udp --dport 67:68 --sport \
> 	67:68 -j ACCEPT
>
> But this opens two ports and the only protocol I know of that uses two
> ports is FTP, so If someone could give me some hints I'd be happy.

UDP 67 is used by the DHCP server - this is the port the client sends req=
uests=20
to, and it's the port the responses (and, often, informational messages o=
nce=20
you have your lease) come from on the server

UDP 68 is used by the DHCP client - this is the port the client sends req=
uests=20
from, and it's the port the response from the server are sent to.

So, if you're running the client end, you only need to allow packets in t=
o=20
port 68 (and they'll be coming from the server's port 67)

RFC2131 is the definitive reference.

Just as a point of information, by the way, I get a DHCP address from my =
ISP=20
on a cable modem, and I allow the requests out from my firewall, and the=20
replies back again, but I block any new connections initiated from the=20
outside (including the ISP).   My logs show a DHCP packet from ISP port 6=
7 to=20
my firewall port 68 about every 20 seconds (the lease time is 86400 secon=
ds =3D=20
24 hours).

> I was also wondering if about Ident, today I use it only when connectin=
g
> to IRC-servers and have port 113 forwarded to the computer running the
> IRC-client but this solution is not so good if another computer on my
> network should have a need of Ident. So I was wondering: If I install a=
n
> Identd on my firewallbox and let it take care of requests would it work=
,
> considering that the connection does not origin from the firewallbox?

My experience of most things which want an ident response is that if they=
 get=20
any response at all, they're happy.   It doesn't matter whether it's accu=
rate=20
or not - they just want some sort of response.

This may depend on the particular IRC server, however, and as always, YMM=
V.

For some "fake identd" software, see for example:

http://www.guru-group.fi/~too/sw/identd.readme
http://hangout.de/fakeidentd

And even a trivial Perl script to do it for you:

http://www.bovine.net/~jlawson/coding/fake-identd/identd.txt

Regards,

Antony.

--=20
I love deadlines.   I love the whooshing noise they make as they go by.

 - Douglas Noel Adams

                                                     Please reply to the =
list;
                                                           please don't C=
C me.



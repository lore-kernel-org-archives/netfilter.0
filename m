From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT Problems FTP (maybe a newbie question)
Date: Thu, 20 Nov 2003 00:19:29 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311200019.hAK0JYj24159@agate.rockstone.co.uk>
References: <002201c3aefa$df26b9e0$0af2d3c8@admin1>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002201c3aefa$df26b9e0$0af2d3c8@admin1>
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

On Thursday 20 November 2003 12:11 am, Francisco Andr=E9 Barbosa Neto wro=
te:

> Hi all, I've installed Slackware 9.1 in 2 diferent pc's, in 2 different
> clients. These machines are doing nat to all the internal network. I'm
> running only a single rule described below, but when any of the client
> machines try to connect to any ftp site, the connection was ok but when=
 the
> user gives an ls command the server respond 500 ilegal command.
>
> iptables -F
> iptables -t nat -F
>
> iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -d 0.0.0.0/0 -j SNAT -=
-to
> 200.X.X.X

I would recommend that you specify the interface which packets are suppos=
ed=20
to leave from in the above rule, just to make sure it applies only to tra=
ffic=20
going out of your external interface:

iptables -t nat -A POSTROUTING -o eth0 -s 192.168.0.0/24 -d 0.0.0.0/0 -j =
SNAT=20
--to 200.X.X.X

(assuming eth0 is the external interface, with the 200.x.x.x address on i=
t -=20
if not, insert the appropriate interface name instead).

However, to get back to your question regarding why FTP isn't doing what =
you=20
want, have you compiled support and/or loaded modules for FTP NAT and=20
Connection Tracking?

Antony.

--=20

In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac
                                                     Please reply to the =
list;
                                                           please don't C=
C me.


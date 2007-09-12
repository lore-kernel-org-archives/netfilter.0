From: Jorge Davila <davila@nicaraguaopensource.com>
Subject: Re: FWDing packets from a physical interface to a virtual interface
Date: Tue, 11 Sep 2007 19:40:15 -0600
Message-ID: <web-24515613@bk3.webmaillogin.com>
References: <1189550213.14727.34.camel@Thinkpad>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1189550213.14727.34.camel@Thinkpad>
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
To: Arash Yadegarnia <arash@bluehome.net>, netfilter@lists.netfilter.org

Arash:

AFAIK, you must open a path in the firewall to the vpn daemon=20
(port/protocol) and the daemon will be in charge of administering the=20
traffic between the clients and the vpn server.

Additionally, you must tell to the client where is the server (the ip=20
address), what device will be used (tun or tap device).

May you want ask in the mailing list for the vendor/provider of the vpn=20
software that you are using.


Hope this helps,

Jorge D=E1vila.

On Wed, 12 Sep 2007 02:06:53 +0330
  Arash Yadegarnia <arash@bluehome.net> wrote:
> Hi, :)
>=20
> Here is the situation:
>=20
> I have a machine with 2 NICs, assume eth0 (192.168.0.10) connected to my
> LAN, and eth1 (192.168.0.20) connected to Internet through a gateway.
> I also, have a virtual tap0 (TUN/TAP) interface (10.0.0.1) on this
> machine.
>=20
> All that I want to do is simply, forwarding ALL traffic coming to eth0
> from the LAN, into my tap0 interface, So I can modify them using my own
> user space program which can capture packets on the tap interface and
> send them on eth1 to another address somewhere in the world (through
> Internet).
>=20
> Since I want IP addresses unchanged, I cannot use NAT or Masquerading.
> As far as I know, In this matter forwarding should be done in Layer-2 so
> I'm not sure if I can use iptables to do the job.
> I also have tried bridging but I was trapped in a horrible bridge loop
> (Enabling STP on bridge also didn't work for me).
>=20
> Any ideas? :)
>=20
> Thanks,
> Arash
>=20
>=20
>=20

Jorge Isaac Davila Lopez
Nicaragua Open Source
+505 430 5462
davila@nicaraguaopensource.com


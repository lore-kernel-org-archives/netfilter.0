From: Jorge Davila <davila@nicaraguaopensource.com>
Subject: Re: Forward port to openvpn client
Date: Tue, 14 Aug 2007 16:19:43 -0600
Message-ID: <web-80100806@bk1.webmaillogin.com>
References: <BAY113-F334B7FEC24D2CD5B0520D5E4DD0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY113-F334B7FEC24D2CD5B0520D5E4DD0@phx.gbl>
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
To: Johan ?hrn <johan_oern@hotmail.com>, netfilter@lists.netfilter.org

Johan:

May you must ask in the openvpn mailing list.

Well, check this list:

1) You must have in your firewall an open path for the tcp traffic to the=20
port 3739.

2) Check the openvpn configuration files to see if the references to the=20
virtual addresses are ok

3) Check in your firewall if exists an open path to tun0 virtual interface.

Hope this helps,

Jorge D=E1vila.

On Tue, 14 Aug 2007 23:59:56 +0200
  "Johan =D6hrn" <johan_oern@hotmail.com> wrote:
> Hi,
>=20
> I want to forward port 3739 on my firewall (openvpn server) to an openvpn=
=20
>client on port 3739.
>=20
> This is my setup:
>=20
> firewall:
> external interface: eth2
> external ip: 87.251.222.104
> openvpn interface: tun0
>=20
> openvpn client:
> ip: 10.0.10.6
>=20
> I can't figure out how to do the forward. I've tried everything I could=20
>find on google and nothing seem to help. I can connect from the server to =

>the client on port 3739 so it's not a firewall issue on the client side.=20
>Someone sugested that iptables might not be able to forward a port over an=
=20
>ipsec interface.
>=20
> Can someone tell me if what I'm trying to do is possible and if so, how?
>=20
> / Johan
>=20
> _________________________________________________________________
> Express yourself instantly with MSN Messenger! Download today it's FREE! =

>http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/
>=20
>=20
>=20

Jorge Isaac Davila Lopez
Nicaragua Open Source
+505 430 5462
davila@nicaraguaopensource.com


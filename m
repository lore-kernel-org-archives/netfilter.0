From: Jorge Davila <davila@nicaraguaopensource.com>
Subject: Re: Passwords and user names
Date: Sun, 21 May 2006 00:28:58 +0000
Message-ID: <1148171338.4415.14.camel@davila.nicaraguaopensource.com>
References: <2ddb22030605201549r42e7bb3av49c38bbe48f39ec3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2ddb22030605201549r42e7bb3av49c38bbe48f39ec3@mail.gmail.com>
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
To: David Theobald <davidtheo@gmail.com>
Cc: netfilter@lists.netfilter.org

David:

For a wireless router Lynksys WRT54GS:

As the paper said: "Make your that all your hardware is powered off"

1) Connect your wired computers to the ethernet ports of the routers

2) Connect the Internet port of the router to the device that connects
you to Internet (e.g.: your cablemodem)

3) Power on the cable or dsl modem

4) Power on the router

5) Open a browser in your computer and point to http://192.168.1.1/ (the
router's default address) - of course, for this give to your computer an
address in the network 192.168.1.0/24=20

6) User name: empty (there is no name for the user) | Password: admin

7) Once the password is entered you will see the administrative
interface.

I guess that you can continue from here. Ask to your ISP is you will
need configure the router to receive the tcp/ip configuration from a
dhcp server or you need configure an static ip address.

In the tab wireless you can enable/disable wireless access to your
router.

In the tab Application & Games you can configure need to be forward to
some of your workstation (e.g.: your laptop). But if you are connecting
to a server and you don't have a server in your home network you don't
need forward traffic to your home home network.

Remember change the password and change the access to the administrative
interface to use https instead of http.

Hope this help,

Jorge.



El dom, 21-05-2006 a las 10:49 +1200, David Theobald escribi=F3:
> Hi all
>=20
> I am trying to set up a home network. how do I do the following. I am
> also Taking a network management paper and don't understand how it is
> done.
>=20
> I have one wireless computer on my network and a computer on a
> ethernet both connected to the internet thourgh a firewall using
> IPTABLES what Rules do I use to make the wireless computer use
> user-based authenentication on the proxy to access http and ftp I am
> using squid web Caching also.
>=20
> Thanks for any help you can give
>=20
> David
>=20
--=20
Jorge Isaac Davila Lopez
Nicaragua Open Source
+505 808 2478
davila@nicaraguaopensource.com=20



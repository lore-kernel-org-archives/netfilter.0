From: Tony Earnshaw <tonye@billy.demon.nl>
Subject: Re: Compiling new iptables after kernel patch (compilation errors)
Date: Thu, 01 Apr 2004 11:19:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080811180.23093.46.camel@localhost>
References: <BC908CF0.6B5A%luke@westaironline.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BC908CF0.6B5A%luke@westaironline.com>
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

tor, 01.04.2004 kl. 00.57 skrev Luke Deryckx:

[...]

> I=A2m using a debian based linux called Pebble
> (www.nycwireless.org/pebble) with the 2.4.22 kernel (which I have
> recompiled and reinstalled).=20
>=20
> I=A2ve tried compiling with and without the NO_SHARED_LIBS value set in
> Makefile (changing this seems to change the error, but there is still
> and error) and I=A2ve also made extra sure that I have the correct
> KERNEL_DIR set (/usr/src/linux-2.4.22 in my case).=20
>=20
> Any advice would be most appreciated.=20

Obsolete libtool version? 1.4.3 works for me with Netfilter 1.2.9 on
RedHat RHEL3, libtool 1.5.x is out.

--Tonni

--=20

mail: billy - at - billy.demon.nl
http://www.billy.demon.nl



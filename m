From: =?iso-8859-1?Q?Herv=E9?= Eychenne <rv@wallfire.org>
Subject: Re: Weird behavior for -j MASQUERADE, please help ! :)
Date: Sat, 25 May 2002 17:56:09 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020525155609.GA414@eychenne.org>
References: <3CEE81BA.4030904@wanadoo.fr> <3CEFA216.2050406@wanadoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <3CEFA216.2050406@wanadoo.fr>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Valentin LAB <vaab@wanadoo.fr>
Cc: netfilter <netfilter@lists.samba.org>

On Sat, May 25, 2002 at 04:39:18PM +0200, Valentin LAB wrote:

> Well, I've found the solution. It's in the forgotten PPPoe manual in=20
> kernel mode of 2.4.x (i've found it in google's cache, it had=20
> disappeared from the referenced link.)

Fortunately, it is documented in the (recent) iptables manpage...

> It links to this page : http://www.hgfelger.de/mss/mss.html , which is=20
> quite interesting to read when you have an ADSL Modem and you have=20
> problems as those mentionned above with kernel-mode PPPoe driver.
>=20
> It tells to add only one line to the firewall script :
>=20
> iptables  -I FORWARD  -p tcp  --tcp-flags SYN,RST SYN   -j TCPMSS=20
> --clamp-mss-to-pmtu
>=20
> if this isn't magic, i'm a toaster :))
> This work really fine for me now.
>=20
> Could somebody comment this line for my education ? (or give a quick=20
> link to explain, or give the state-of-the-art on the TCPMSS target)

Isn't the manpage explication sufficient?

 RV

--=20
 _
(=B0=3D  Herv=E9 Eychenne
//)
v_/_ WallFire project:  http://www.wallfire.org/


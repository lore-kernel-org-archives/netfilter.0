From: Jason Opperisano <opie@817west.com>
Subject: Re: providing partial access to iptables for non root user
Date: Mon, 21 Feb 2005 09:29:17 -0500
Message-ID: <1108996157.5516.14.camel@hubcap.ljm.dom>
References: <4219C6F1.2070500@juergens.name>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4219C6F1.2070500@juergens.name>
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
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

On Mon, 2005-02-21 at 06:33, Michael J=C3=BCrgens wrote:
> Hi,
>=20
> I=C2=B4m looking for a solution to provide a non root user write access=
 to a=20
> chain.
>=20
> In this special case I have to provide the a mechanism to block some ip=
=20
> adresses to connect to http.
> But this should be done by a non root user. The non root user should no=
t=20
> change any other rule.
>=20
> Any ideas?

use sudo?

Host_Alias      LOCALHOST =3D thishostname

User_Alias	U_HTTP	=3D youruser

Cmnd_Alias	C_HTTP	=3D /sbin/iptables -A blockhttp -s * -j DROP

U_HTTP		LOCALHOST =3D C_HTTP

...or if is this is scripted:

U_HTTP		LOCALHOST =3D NOPASSWD: C_HTTP

obviously--there's opportunity for abuse here--but it's the best i've
come up with.  if you front-end this with a script, it will allow you to
scrub/check/validate the input much more extensively (which is what i
actually do).

-j

--
"Oh look at me! I'm making people happy! I'm the magical man from
 Happyland, in a gumdrop house on Lollipop Lane!"
	--The Simpsons



From: Jorge Davila <davila@cablenet.com.ni>
Subject: Re: How can i see a list of applied p-o-m patches
Date: Sat, 28 Jan 2006 15:59:08 -0600
Message-ID: <1138485548.2448.3.camel@davila.nicaraguaopensource.com>
References: <2006128162128.095688@xp>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2006128162128.095688@xp>
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
To: Claudio Roberto Cussuol <claudio@brazilfw.com.br>
Cc: netfilter@lists.netfilter.org

I don't know if exist a particular way to do that .. but you can try
test a rule with the target that you want to know if it's present.

Too, when you are applying the patches .. the installation tell you is
the patch is present.

See first the options in the kernel, some options are presents in the
kernel and in the patch-o-matic, be carefully applying the patches.

Regards

Jorge D=E1vila.

El s=E1b, 28-01-2006 a las 16:21 -0200, Claudio Roberto Cussuol escribi=F3=
:
> Hi friends
>=20
> I'm using an embedded system based on the kernel 2.4.30 where were appl=
ied
> several patches with patch-o-matic (not by me).
>=20
> I have the kernel source, .config, and the patch-o-matic used.
>=20
> Now I need to upgrade that kernel to version 2.4.32, and I'd like to ap=
ply the
> same patches.
>=20
> Is there any way I could see a list of patches that were applied on tha=
t 2.4.30?
>=20
> Thank You.
>=20

--=20
-----------------------------------------------------------------
Jorge Isaac Davila Lopez
-
sitio web: http://www.nicaraguaopensource.com/
correo-e: davila@cablenet.com.ni
-----------------------------------------------------------------




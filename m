From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: [OT] iptables and 802.1x authenticator
Date: Sat, 05 May 2007 11:23:21 -0400
Message-ID: <1178378601.6574.3.camel@localhost>
References: <1178329218.8026.0.camel@localhost>
	<1178347689.2956.4.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1178347689.2956.4.camel@localhost>
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

On Sat, 2007-05-05 at 08:48 +0200, Cedric Blancher wrote:
> Le vendredi 04 mai 2007 =C3=A0 21:40 -0400, John A. Sullivan III a =C3=A9=
crit :
> > Hello, all. Does anyone know of an open source linux 802.1x
> > authenticator? I see XSupplicant for the supplicant and FreeRADIUS for
> > the authentication server but I can't seem to find an authenticator.
>=20
> See hostapd: http://hostap.epitest.fi/hostapd/
>=20
> I never see it implemented for wired networks... But it's the only
> 802.1x authenticator I know around.
>=20
>=20
Thank you, Cedric.  I looked at hostap but must have been brain
cramping! Now I just need to see if we can create iptables rules based
upon what the authentication server returns through the authenticator.
If anyone has experience in doing that, please let me know.  Thanks -
John
--=20
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net



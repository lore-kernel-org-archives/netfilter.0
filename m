From: Leonardo Teves <leonardo.teves@alimentos-granix.com.ar>
Subject: Re: Blocking programs with IPtables
Date: Sun, 01 Aug 2004 13:29:34 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <410D1A6E.1080302@alimentos-granix.com.ar>
References: <410A5D82.4050109@alimentos-granix.com.ar> <1091204797.7514.30.camel@porky>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1091204797.7514.30.camel@porky>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Thanks Eric!
I was checking info about NuFW, and it's very interesting. Will look for
more news about this project.
Anyway, could this:

http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-3.=
html#ss3.18

be a solution?
Thanks again,
Leo.

--=20
"Cristo vuelve pronto, prep=E1rate"


Eric Leblond wrote:
> It's a planned feature of NuFW. So it can not solved your problem but it
> will soon.
> In fact, NuFW is a authenticating firewall which extend Netfilter. It's
> basic goal has been extended with interesting features (QOS per user,
> SSO capabilities, user activities logging). One of the next planned
> feature is to have the client warn about the soft that established the
> connection and to be able to filter on this parameter. You will be able
> to say things like :
> "I want user of the group accountant to be able to connect to IMAP
> server with thunderbird if there OS is newer than WIN2K"
>=20
> "I want admins to be able to connect to IMAP server with any client
> software if OS is Linux"
>=20
> More informations on :
> 	http://www.nufw.org
>=20
> BR,


From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: Is anyone else getting these.
Date: Mon, 04 Jul 2005 11:09:21 +0200
Message-ID: <42C8FCC1.7030204@mnemon.de>
References: <57F9959B46E0FA4D8BA88AEDFBE58290741F@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <57F9959B46E0FA4D8BA88AEDFBE58290741F@pxtbenexd01.pxt.primeexalia.com>
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
To: netfilter@lists.netfilter.org

Gary W. Smith schrieb:
> I have verified my IP's not to on relays.ordb.org.  I'm wondering if th=
ey blacklisted netfilter.org?
>=20
>=20
>=20
> FW: Unzustellbar: [SPAM] - Crazy portmap request - Sending mail server =
found=20
> on relays.ordb.org
>=20
> -----Original Message-----
> From: Systemadministrator [mailto:postmaster@echtzeit.com]=20
> Sent: Friday, July 01, 2005 2:11 PM
> To: Gary W. Smith
> Subject: Unzustellbar: [SPAM] - Crazy portmap request - Sending mail se=
rver found on relays.ordb.org
>=20
> Your message
>=20
>   To:      netfilter@lists.netfilter.org
>   Subject: [SPAM] - Crazy portmap request - Sending mail server found o=
n
> relays.ordb.org
>   Sent:    Fri, 1 Jul 2005 00:56:12 +0200
>=20
> did not reach the following recipient(s):
>=20
> phergenhahn@echtzeit.de on Fri, 1 Jul 2005 23:11:28 +0200
>     Der Name des Empf=E4ngers wurde nicht erkannt.

I suppose that everyone posting to the list gets this mail - at least I
get it ervery time. Like Jason already posted, adding

:0
* From.*postmaster@echtzeit.com
/dev/null

to my .procmailrc solved this and mekes me feel better :)

Have a nice time,

Joerg




From: =?ISO-8859-1?Q?Ren=E9_Gallati?= <draxinusom@gmail.com>
Subject: Re: ip + mac authentication
Date: Wed, 19 Jan 2005 15:55:21 +0100
Message-ID: <50f03b970501190655386250c1@mail.gmail.com>
References: <20050119103603.82231.qmail@web30810.mail.mud.yahoo.com>
Reply-To: =?ISO-8859-1?Q?Ren=E9_Gallati?= <draxinusom@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050119103603.82231.qmail@web30810.mail.mud.yahoo.com>
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
To: Linux Query <linux_query@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Wed, 19 Jan 2005 02:36:03 -0800 (PST), Linux Query
<linux_query@yahoo.com> wrote:
>=20
> Hi all!
>=20
> I want to ensure that each of my clients can have
> access to the net only with the ip address which is
> specifically assigned to him / her. Is the following
> going to work ?
>=20
> iptables -I FORWARD -o externalinterface -s
> xx.xx.xx.xx -m mac --mac-source yy:yy:yy:yy:yy -j
> ACCEPT
>=20
> or is it required to be done in some other way ?
>=20

You already received advice on how it can be done. I'll just add here
that you should not forget that changing one's MAC address is as easy
as changing an IP address. Many people blindly believe it is not
possible or hard to change a MAC address but it is in fact very easy.

So all you can do is really force an IP/MAC pair, but you cannot
prevent that someone impersonates another system that is also allowed
to communicate.

--=20
C U

     - -- ---- ----- -----/\/  Ren=E9 Gallati  \/\---- ----- --- -- -


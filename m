From: Jorge Davila <davila@nicaraguaopensource.com>
Subject: Re: Match specific netbios flag?
Date: Wed, 16 May 2007 18:14:48 -0600
Message-ID: <web-14761470@bk3.webmaillogin.com>
References: <20070516230058.CB1692477C@ws5-3.us4.outblaze.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070516230058.CB1692477C@ws5-3.us4.outblaze.com>
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
To: k bah <kbah@linuxmail.org>, netfilter@lists.netfilter.org

May you must try something different instead of iptables.

For loggin the connection/disconnection is enough the configuration of the =

loggin in the smb configuration file.

If you really want monitoring may you want use Nagios.

Hope this help,

Jorge D=E1vila.

On Thu, 17 May 2007 07:00:58 +0800
  "k bah" <kbah@linuxmail.org> wrote:
>=20
> Hi,
>=20
> I'm using kernel 2.6.17, iptables 1.3.5.
>=20
> Is there a way to match specific netbios ns flags? I did not find any on =

>the iptables man page.
>=20
> I'm trying to log it like this:
>=20
> -A INPUT -s 10.1.1.15 -i eth1 -p udp -m string --string "elease" --algo b=
m=20
>--to 65535 -j LOG --log-prefix "received release from 015"
>=20
> where 10.1.1.1 is the machine with iptables, the internal net router.=20
>10.1.1.15 is Windows XP.
>=20
> I would like to match it with a flag, not a string, to be more secure=20
>(netbios ns flag 0x3010)
>=20
> the packet captured with wireshark is:
> -------------
> ...
> 11164 11877.336283 10.1.1.15              10.1.1.255            NBNS=20
>    Release NB HT015<20>
> ...
> NetBIOS Name Service
>    Transaction ID: 0x808f
>    Flags: 0x3010 (Release)
>        0... .... .... .... =3D Response: Message is a query
>        .011 0... .... .... =3D Opcode: Release (6)
>        .... ..0. .... .... =3D Truncated: Message is not truncated
>        .... ...0 .... .... =3D Recursion desired: Don't do query recursiv=
ely
>        .... .... ...1 .... =3D Broadcast: Broadcast packet
>    Questions: 1
>    Answer RRs: 0
>    Authority RRs: 0
>    Additional RRs: 1
>    Queries
>        HT015<20>: type NB, class IN
>            Name: HT015<20> (Server service)
>            Type: NB
>            Class: IN
>    Additional records
>        HT015<20>: type NB, class IN
>            Name: HT015<20> (Server service)
>            Type: NB
>            Class: IN
>            Time to live: 0 time
>            Data length: 6
>            Flags: 0x0 (B-node, unique)
>                0... .... .... .... =3D Unique name
>                .00. .... .... .... =3D B-node
>            Addr: 10.1.1.15
> -------------
>=20
> I want to know when that host went offline by turning the computer off, o=
r=20
>because of some physical failure, as a broken cable, or disconnected cable=
=20
>on the switch.
>=20
> thanks,
>=20
> kbah
>=20
> =3D
> ERP - Accounting Software, SQL Edition
> SQL, fully customizable free SDK.
> http://a8-asy.a8ww.net/a8-ads/adftrclick?redirectid=3Dea7c49bd3fe7f7a9558=
6c9ff6c085471
>=20
>=20
> --=20
> Powered by Outblaze
>=20
>=20

Jorge Isaac Davila Lopez
Nicaragua Open Source
davila@nicaraguaopensource.com


From: =?iso-8859-1?Q?Svavar_=D6rn_Eysteinsson?= <svavar@fiton.is>
Subject: RE: DNAT to another Network?
Date: Wed, 7 Jul 2004 12:22:27 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407071201.i67C12P23199@ps0.linanet.is>
References: <200407071307.17282.gdh@acentral.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_003F_01C4641D.13261AB0"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407071307.17282.gdh@acentral.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: 'Gavin Hamill' <gdh@acentral.co.uk>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_003F_01C4641D.13261AB0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



Cool :0)
Thanks.

Anyone know how I would draw this in fwbuilder?.
This scenario confuses me. :0(

Thanks a lot.
Best regards,

Svavar O=20
=20
-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Gavin Hamill
Sent: 7. j=FAl=ED 2004 12:07
To: netfilter@lists.netfilter.org
Subject: Re: DNAT to another Network?

On Wednesday 07 July 2004 12:51, Svavar =D6rn Eysteinsson wrote:
> Hi everybody.
>
> I have one question about DNAT.
>
> I have a computer foo.com on an ipaddress xxx.xxx.xxx.xxx
>
> Is there any way for me to DNAT all traffic with destination to =
foo.com
> to another server out-of-town, e.g. computer foobar.com with
> zzz.zzz.zzz.zzz that
> is not on my public network.?

Yes, basically using Computer A to be an IP-level proxy. Note that the
source=20
address as seen by Computer B will always be that of Computer A. If this =
is=20
not a problem, you can use:

$IPTABLES -t nat -A PREROUTING -p tcp --dport 80 -d xxx.xxx.xxx.xxx -j =
DNAT=20
--to zzz.zzz.zzz.zzz
$IPTABLES -A FORWARD -p tcp --dport 80 -d xxx.xxx.xxx.xxx j ACCEPT
$IPTABLES -t nat -A POSTROUTING -p tcp --dport 80 -d zzz.zzz.zzz.zzz -j =
SNAT

--to xxx.xxx.xxx.xxx

Drop the '--dport 80' bits if you want all traffic, not just HTTP to be=20
proxied.

Cheers,
Gavin.


------=_NextPart_000_003F_01C4641D.13261AB0
Content-Type: text/x-vcard;
	name="=?iso-8859-1?Q?Svavar_=D6rn_Eysteinsson_=28svavar@fiton.is=29_-_F=EDton_e?=
	=?iso-8859-1?Q?hf.vcf?="
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="=?iso-8859-1?Q?Svavar_=D6rn_Eysteinsson_=28svavar@fiton.is=29_-_F=EDton_e?=
	=?iso-8859-1?Q?hf.vcf?="

BEGIN:VCARD
VERSION:2.1
N:Eysteinsson;Svavar;=D6rn
FN:Svavar =D6rn Eysteinsson (svavar@fiton.is) - F=EDton ehf
ORG:F=EDton ehf;IT
TITLE:Kerfisstj=F3ri / System Administrator
TEL;WORK;VOICE:5953600
TEL;CELL;VOICE:8621624
TEL;WORK;FAX:5953649
ADR;WORK:;;Gar=F0astr=E6ti 37;RVK;;101;Iceland
LABEL;WORK;ENCODING=3DQUOTED-PRINTABLE:Gar=3DF0astr=3DE6ti =
37=3D0D=3D0ARVK 101=3D0D=3D0AIceland
URL;WORK:http://www.fiton.is
EMAIL;PREF;INTERNET:svavar@fiton.is
REV:20040616T133518Z
END:VCARD

------=_NextPart_000_003F_01C4641D.13261AB0--



From: "Fred Zwarts" <F.Zwarts@KVI.nl>
Subject: ip6tables redirect
Date: Thu, 2 Dec 2010 13:15:34 +0100
Message-ID: <26D8DC6230C54AACAA60179B4D5E132C@WINDOWS.KVI.NL>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_04AD_01CB9223.01088F80"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is a multi-part message in MIME format.

------=_NextPart_000_04AD_01CB9223.01088F80
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

We are moving from an IPv4 only environment to a mixed IPv4/IPv6 =
environment.
As a part of this exercise, we also need to transform our iptables =
settings to settings for ip6tables.
This seems to work, apart for one item, which is a redirection of a tcp =
port of one of our servers to another port on the same server.
On this server, we use for iptables a REDIRECT for the nat table.
This does not work for ip6tables. It complains that it does not know the =
option --to-port.
My question is how to do such a port redirect with ip6tables.

When I searched the archives of this mailing list, I found that this =
question pops up about once every two years,=20
but a real answer I could not find. The contribution that comes the =
closest to an answer is from 5 years ago:
http://marc.info/?l=3Dnetfilter&m=3D111219622601073&w=3D2
I fully agree with what is said there about NAT.
But I wonder whether the discussions, mentioned there, are still =
continuing, or that it resulted in some decision
and whether something has been implemented in these five years.
(Is there someone with inside information from the core team?)
If nothing has been implemented yet, are there plans to do so in the =
near future,=20
or are there any recommendations for alternative solutions?

Regards,
Fred.Zwarts.
------=_NextPart_000_04AD_01CB9223.01088F80
Content-Type: text/x-vcard;
	name="Fred Zwarts.vcf"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="Fred Zwarts.vcf"

BEGIN:VCARD
VERSION:2.1
N:Zwarts;Fred;;Dr
FN:Fred Zwarts
ORG:KVI;IT
TITLE:Software system developer
TEL;WORK;VOICE:+31 (0)50 363 3619
TEL;HOME;VOICE:+31 (0)50 302 3635
TEL;WORK;FAX:+31 (0)50 363 4003
ADR;WORK:;;Zernikelaan 25;Groningen;Groningen;9747 AA;The Netherlands
LABEL;WORK;ENCODING=3DQUOTED-PRINTABLE:Zernikelaan =
25=3D0D=3D0AGroningen, Groningen 9747 AA=3D0D=3D0AThe Netherlands
ADR;HOME:;;Meeuwstraat 6;Ten Boer;Groningen;9791 GE;The Netherlands
LABEL;HOME;ENCODING=3DQUOTED-PRINTABLE:Meeuwstraat 6=3D0D=3D0ATen Boer, =
Groningen 9791 GE=3D0D=3D0AThe Netherlands
EMAIL;PREF;INTERNET:F.Zwarts@KVI.nl
EMAIL;INTERNET:F.Zwarts@HetNet.nl
REV:20101202T121534Z
END:VCARD

------=_NextPart_000_04AD_01CB9223.01088F80--


From: Eric Leblond <eric@regit.org>
Subject: Re: ulogd.c:522 error during propagate_results
Date: Thu, 28 Jul 2016 15:18:40 +0200
Message-ID: <1469711920.2385.46.camel@regit.org>
References: <CALp86C6itcb69x=t8z-qAWzs=aZeK75mp_LVVe+X3r+nHGz70Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-c8xpQ4ApMwuHI+1JnJ87"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CALp86C6itcb69x=t8z-qAWzs=aZeK75mp_LVVe+X3r+nHGz70Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Saeed Abbassi <saeed144@gmail.com>, netfilter@vger.kernel.org


--=-c8xpQ4ApMwuHI+1JnJ87
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 2016-07-27 at 15:47 -0400, Saeed Abbassi wrote:
> Hello all
>=20
> I thank you for the great package you provided for logging of
> iptables
> flow/policy.

Thanks :)

> #Issue
> =A0I'm getting a lot of "ulogd.c:522 error during propagate_results" in
> the /var/log/ulogd/ulogd.log file.
> Which sometimes breaks the ulogd logging functionality.
>=20
> #Specs
> =A0 In my lab, I'm using ulogd-2.0.4-3.el7.lux.1.x86_64 on CentOS 7,
> 4.6.3-1.el7.elrepo.x86_64.
> Mostly, it works, and logs the packets into
> /var/log/ulogd/ulogd_syslogemu.log file.
> The command to enable NFLOG in iptables
> sudo ip netns exec namespace1 iptables -A FORWARD -j NFLOG
> --nflog-group 1 --nflog-prefix namespace1
>=20
> #Config
> Here's the configuration I'm using in
> /etc/netns/namespace1/ulogd.conf
> stack=3Dlog1:NFLOG,base1:BASE,ifi1:IFINDEX,ip2str1:IP2STR,mac2str1:HWHD
> R,print1:PRINTPKT,emu1:LOGEMU
>=20
> [log1]
> group=3D1
> netlink_socket_buffer_size=3D1736704
> netlink_socket_buffer_maxsize=3D1085440
> netlink_qthreshold=3D10
> netlink_qtimeout=3D5
>=20
> #Question
> Is there anything I'm missing, or is this a known bug?

That is looking a bit strange maybe there is something forwarded that
causes the error.

Is it possible for you to run it in debug ? For that set loglevel to 1
(line exist at start of ulogd.conf).

If nothing interesting comes out, it would be great if you have the
possibility to build a new version with the attached patch. And do the
same test.

BR,
--=20
Eric Leblond <eric@regit.org>
--=-c8xpQ4ApMwuHI+1JnJ87
Content-Disposition: attachment;
	filename="0001-ulogd-print-plugin-causing-propagation-error.patch"
Content-Type: text/x-patch;
	name="0001-ulogd-print-plugin-causing-propagation-error.patch";
	charset="ISO-8859-15"
Content-Transfer-Encoding: base64

RnJvbSA3ZTk4MzNjM2MyNGI1M2VkNTg2NjIxODg4NWUyNGFlOWE5ZTcyNmU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBFcmljIExlYmxvbmQgPGVyaWNAcmVnaXQub3JnPgpEYXRlOiBU
aHUsIDI4IEp1bCAyMDE2IDE1OjE2OjEzICswMjAwClN1YmplY3Q6IFtQQVRDSF0gdWxvZ2Q6IHBy
aW50IHBsdWdpbiBjYXVzaW5nIHByb3BhZ2F0aW9uIGVycm9yCgpTaWduZWQtb2ZmLWJ5OiBFcmlj
IExlYmxvbmQgPGVyaWNAcmVnaXQub3JnPgotLS0KIHNyYy91bG9nZC5jIHwgNCArKystCiAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
c3JjL3Vsb2dkLmMgYi9zcmMvdWxvZ2QuYwppbmRleCA1YjlhNTg2Li43NGYyZTNhIDEwMDY0NAot
LS0gYS9zcmMvdWxvZ2QuYworKysgYi9zcmMvdWxvZ2QuYwpAQCAtNjE2LDcgKzYxNiw5IEBAIHZv
aWQgdWxvZ2RfcHJvcGFnYXRlX3Jlc3VsdHMoc3RydWN0IHVsb2dkX3BsdWdpbnN0YW5jZSAqcGkp
CiAJCXN3aXRjaCAocmV0KSB7CiAJCWNhc2UgVUxPR0RfSVJFVF9FUlI6CiAJCQl1bG9nZF9sb2co
VUxPR0RfTk9USUNFLAotCQkJCSAgImVycm9yIGR1cmluZyBwcm9wYWdhdGVfcmVzdWx0c1xuIik7
CisJCQkJICAiZXJyb3IgZHVyaW5nIHByb3BhZ2F0ZV9yZXN1bHRzIGJ5IHBsdWdpbiAlc1xuIiwK
KwkJCQkgIGN1ci0+cGx1Z2luLT5uYW1lCisJCQkJICApOwogCQkJLyogZmFsbHRocm91Z2ggKi8K
IAkJY2FzZSBVTE9HRF9JUkVUX1NUT1A6CiAJCQkvKiB3ZSBzaGFsbCBhYm9ydCBmdXJ0aGVyIGl0
ZXJhdGlvbiBvZiB0aGUgc3RhY2sgKi8KLS0gCjIuOC4xCgo=


--=-c8xpQ4ApMwuHI+1JnJ87--


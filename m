From: Ludo Stellingwerff <ludo@protactive.nl>
Subject: Does anybody work on supporting SPD matching Netfilter MARKS?
Date: Wed, 19 Jan 2005 07:44:47 +0100
Message-ID: <41EE01DF.5040707@protactive.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ipsec tools mailing list <ipsec-tools-devel@lists.sourceforge.net>, netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi All,

I was wondering if someone has been working on and/or has a patch
which implement's the use of Netfilter Marks for ipsec spd matching
under the linux kernel 2.6. This would be similar to the NetBSD
"tagged" option of 'setkey':

spdadd tagged "ssh" -P out esp/transport//require

But then something like:

~     spdadd tagged 1 -P out esp/transport//require
or  spdadd mark 1 -P out esp/transport//require

Thank in advance,
greetings,

Ludo Stellingwerff.

- --
Ludo Stellingwerff

V&S B.V. The Netherlands
ProTactive firewall solution.
Tel: +31 172 416116
Fax: +31 172 416124

site: www.protactive.nl
demo: http://www.protactive.nl:81/netview.html
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFB7gHeOF3sCpZ+AJgRAvG/AKC6biVC6Z7SlCbUllNu7l6f26MURQCcC8V1
ZKprii65/iT8CwERNQR7UIc=
=KMrV
-----END PGP SIGNATURE-----



From: "James A. Pattie" <james@pcxperience.com>
Subject: Re: how to redirect certain IPs to specific url
Date: Wed, 30 Jun 2004 10:14:32 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40E2D8D8.6050201@pcxperience.com>
References: <a0f69e504063000446f514e22@mail.gmail.com> <200406300931.16812.Antony@Soft-Solutions.co.uk> <a0f69e5040630021311b0555d@mail.gmail.com> <200406301034.44072.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406301034.44072.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Antony Stone wrote:

| If www.abc.com resolves to more than one IP address, only one will get entered
| into the rule if you specify the name (and you would need to use multiple
| rules if you specify by IP), and therefore only some of the packets sent to
| ww.abc.com would match the rule.
|

I just tested and if you say use www.yahoo.com, which resolves to multiple
entries, you get that many iptables rules generated for each unique IP that
www.yahoo.com resolves to.  I've been relying on this feature for a long time. :)


- --
James A. Pattie
james@pcxperience.com

Linux -- SysAdmin / Programmer
Xperience, Inc.
http://www.pcxperience.com/
http://www.xperienceinc.com/
http://www.pcxperience.org/

GPG Key Available at http://www.pcxperience.com/gpgkeys/james.html
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFA4tjXtUXjwPIRLVERAvFyAKCe3AYePy69ry/RPYkfs1saIUqIRgCgttVp
HM6SXxZo+/hXeN/Hs7CnrR8=
=qy1L
-----END PGP SIGNATURE-----

-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.
MailScanner thanks transtec Computers for their support.



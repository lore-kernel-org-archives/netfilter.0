From: James Pattie <james@pcxperience.com>
Subject: Re: efficient source address filtering and logging?
Date: Tue, 28 Oct 2003 09:26:21 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F9E8A9D.4070708@pcxperience.com>
References: <Pine.LNX.4.44.0310280949080.22878-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0310280949080.22878-100000@localhost.localdomain>
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
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: iptables mailing list <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Robert P. J. Day wrote:
|   i'd like to find a short, efficient way to filter incoming packets with
| bogus source addresses, but i don't see an elegant way of doing it.
|
|   as we all know, there are a number of clearly bogus source addresses on
| incoming packets:
|
|   - broadcast
|   - your own IP address
|   - any of the private class A, B or C addresses
|   - class D addresses
|
| and on and on.  so it's natural to want to discard them and, just for fun,
| log them as well.
|
|   for elegance, i can create a user-defined chain called, say,
| "reject_bad_source_addresses" to which i jump with every incoming packet.
| this user-defined chain will test for all of the bad source addresses, one
| at a time, and DROP/REJECT each one.  however, if i want to log all of
| these rejections, i'd have to double the number of rules in this chain,
| so that each test would first LOG that packet, then be followed by a
| second rule to DROP it.  kind of a pain.
|
|   if i could rewrite the rules all backwards, i could have the
| user-defined chain full of ACCEPT rules, and only terminate the chain with
| a rule for LOG, followed by one for DROP.  but i don't see how that's
| possible.

you probably want to use RETURN instead of ACCEPT so that the packet can
continue to be processed instead of just accepting all packets that don't come
from a Bogus address. :)

|
|   so, is there a solution i'm missing that's clean, elegant and short?
|
| rday
|
|
|


- --
James A. Pattie
james@pcxperience.com

Linux  --  SysAdmin / Programmer
Xperience, Inc.
http://www.pcxperience.com/
http://www.xperienceinc.com/

GPG Key Available at http://www.pcxperience.com/gpgkeys/james.html
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQE/noqdtUXjwPIRLVERAgfEAKCeEBtW7EZ9GYsptVaGr80CBPFc1wCfSsd4
bTz9ZAeArjVNuiVFPk20FVs=
=7aXk
-----END PGP SIGNATURE-----


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.
MailScanner thanks transtec Computers for their support.



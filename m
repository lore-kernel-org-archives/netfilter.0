From: Emanoil Kotsev <emanuel@abc.at>
Subject: Re: Can't compile iptables 1.2.8. Please help me!
Date: Tue, 06 May 2003 01:04:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EB6EDF1.687DD2E7@abc.at>
References: <20030505045757.67027.qmail@web20310.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------C9DB137C9EFFC37F22B3C331"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: =?iso-8859-1?Q?=C4=3F=E1=BA=A1i=20Tu=E1=BA=A5n?= <vkdt7799@yahoo.com>
Cc: netfilter@lists.netfilter.org


--------------C9DB137C9EFFC37F22B3C331
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

$ make base pending [etc]
or in your case just
$ make pending

is fine
you are prompted for KERNEL_DIR=3D/usr/src/linux

apply the patches you need
-----------

"=C4?=E1=BA=A1i Tu=E1=BA=A5n" wrote:

> I tried a lot but I can't compile iptables 1.2.8 for
> linux-kernel 2.4.5!
>
> # make pending-patches KERNEL_DIR=3D/usr/src/linux
> make: *** No rule to make target `pending-patched`!
> Stop.
>
> Please help me!
>
> __________________________________
> Do you Yahoo!?
> The New Yahoo! Search - Faster. Easier. Bingo.
> http://search.yahoo.com

--
+ Emanoil Kotsev - - - - -+
| tel. 0043(1)9253175     |
| cel. --------------     |
+ E-Mail: emanuel@t2u.com +



--------------C9DB137C9EFFC37F22B3C331
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
$ make base pending [etc]
<br>or in your case just
<br>$ make pending
<p>is fine
<br>you are prompted for KERNEL_DIR=/usr/src/linux
<p>apply the patches you need
<br>-----------
<p>"&Auml;?&aacute;&ordm;&iexcl;i Tu&aacute;&ordm;&yen;n" wrote:
<blockquote TYPE=CITE>I tried a lot but I can't compile iptables 1.2.8
for
<br>linux-kernel 2.4.5!
<p># make pending-patches KERNEL_DIR=/usr/src/linux
<br>make: *** No rule to make target `pending-patched`!
<br>Stop.
<p>Please help me!
<p>__________________________________
<br>Do you Yahoo!?
<br>The New Yahoo! Search - Faster. Easier. Bingo.
<br><a href="http://search.yahoo.com">http://search.yahoo.com</a></blockquote>

<pre>--&nbsp;
+ Emanoil Kotsev - - - - -+
| tel. 0043(1)9253175&nbsp;&nbsp;&nbsp;&nbsp; |
| cel. --------------&nbsp;&nbsp;&nbsp;&nbsp; |
+ E-Mail: emanuel@t2u.com +</pre>
&nbsp;</html>

--------------C9DB137C9EFFC37F22B3C331--



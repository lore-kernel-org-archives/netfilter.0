From: "Jee J.Z." <jz105@york.ac.uk>
Subject: Re: problem with trying the example
Date: Mon, 1 Dec 2003 15:47:17 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000f01c3b822$66414be0$68892090@grouse>
References: <00a201c3b7ad$06b73100$cb0210ac@jz105> <1070265652.29823.3.camel@porky>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_000C_01C3B822.6630AA10"
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
To: Eric Leblond <eric@regit.org>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_000C_01C3B822.6630AA10
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit


------=_NextPart_000_000C_01C3B822.6630AA10
Content-Type: text/plain;
	name="ATT00008.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="ATT00008.txt"

=EF=BB=BFHi Eric,

Thank you very much. I went through the link process, but when I execute =
the program:

./test

The following occurs:

passer: Failed to send netlink message: Connection refused

Could you point out for me how I can solve it again? Cheers!

Regards,
Ji



Le lun 01/12/2003 =C3=A0 02:47, Jee J.Z. a =C3=A9crit :
> Hi all,
>=20
> I am new to netfilter and even linux. I just wish to try the example =
code in the man page of libipq (I saved it as test.c and have compiled =
it to test.o). But when I make it: #cc test.o -o test, the following =
errors showed up:
>=20
> [root@kite1 netfilter]# cc test.o -o test

you need to link with the libipq library :
=20
	cc test.o -o test -lipq


--=20
Eric Leblond
Nufw, Now User Filtering Works (http://www.nufw.org)

------=_NextPart_000_000C_01C3B822.6630AA10--



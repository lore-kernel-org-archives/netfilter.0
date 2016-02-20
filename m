From: Adel Belhouane <bugs.a.b@free.fr>
Subject: Re: debugging a libnetfilter_queue program and stdout
Date: Sat, 20 Feb 2016 21:42:17 +0100
Message-ID: <56C8CFA9.3030500@free.fr>
References: <0O2P00CI3HCLQG40@vms173025.mailsrvcs.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <0O2P00CI3HCLQG40@vms173025.mailsrvcs.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Michael D. Berger" <m.d.berger@ieee.org>
Cc: netfilter@vger.kernel.org

Le 17/02/2016 20:12, Michael D. Berger a =E9crit :
> I wrote a program using libnetfilter_queue. Call it "tst".=20
> It normally runs as a service, but when I am debugging it, I
> put some printf statements in it and run it in the foreground
> by typing:
>=20
>    tst
>=20
> and the printf results appear on the screen as expected. However,
> if I expect a long output, I would rather type:
>=20
>    tst > log
>=20
> hoping to see the results in the file "log".  However, "log" is
> always empty, even though I have other indications that "tst" is
> running.
>=20
> Why is this?  Is there anything I could do to get the printf
> results to appear in "log"?
>=20

	Not related to netfilter but only C, anyway... when the output is a
file, printf (to stdout) is block buffered instead of line buffered for
a terminal. You'd need more output to fill the first block. Check the
man pages of fflush(3) and setvbuf(3) to know how to have it as you exp=
ect.
	According to these man pages if you were using stderr (with fprintf() =
)
it would be already unbuffered and tst 2>log would "work".


> Thanks,
> Mike.
>=20
> --
> Michael D. Berger
> m.d.berger@ieee.org
> http://www.rosemike.net/
> =20

regards,
Adel Belhouane.


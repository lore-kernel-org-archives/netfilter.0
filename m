From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: i386 or i686.. which one?
Date: Mon, 9 Sep 2002 21:09:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020909200927.VEAS292.mta01-svc.ntlworld.com@there>
References: <A758C299015FD411887B0000E2131186C213E6@TRUVA> <3D7CDEAC.8010905@myrealbox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D7CDEAC.8010905@myrealbox.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Monday 09 September 2002 6:47 pm, Manikandan.P wrote:

> =DDhsan Turkmen wrote:

> > This is not the right place of asking that question, but i hope nobody
> > minds my asking:
> >
> > ----"How to understand if my kernel source is RedHat  i386 or i686. Is
> > there a shoert way of undersatnding it...?"

> uname -a
> will tell you

No, uname -a will tell you the type of processor fitted in your machine.   =
It=20
will not tell you which processor your kernel was compiled for.

eg you can compile a kernel for a 386 so it runs on anything, install it on=
=20
an AMD Athlon, and uname -a will tell you it's an i686.

Antony.

--=20

The first ninety percent of an engineering project takes ninety percent
of the time, and the last ten percent takes the remaining ninety percent.


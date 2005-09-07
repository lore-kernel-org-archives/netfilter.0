From: tedemo <tedemo@free.fr>
Subject: Re: ipset compilation fails on kernel 2.6.13
Date: Wed, 07 Sep 2005 19:35:23 +0200
Message-ID: <431F24DB.800@free.fr>
References: <431F10C7.7020009@free.fr>
	<876ef97a0509071003d9fe3c8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <876ef97a0509071003d9fe3c8@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Toby DiPasquale <codeslinger@gmail.com>
Cc: netfilter@lists.netfilter.org

Toby DiPasquale a =E9crit :

>It would appear that ipset was not cleaned up to remove use of the
>macros that were in include/linux/netfilter_ipv4/lockhelp.h, which was
>removed in the 2.6.13 release. Check out an old copy of lockhelp.h for
>help in converting the failing macros.
>
> =20
>
Thanx for your response,
adding an "include" for that file resolved the problem.


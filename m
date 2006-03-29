From: "Pablo Sanchez" <pablo@blueoakdb.com>
Subject: RE: PATCH-O-MATIC (installation issue)
Date: Wed, 29 Mar 2006 15:02:30 -0500
Message-ID: <NEBBLLCNFOFHMALJMDDEIEAMCCAB.pablo@blueoakdb.com>
References: <01ee01c6536a$a2e7b210$1b51200a@corporate.libgo>
Reply-To: pablo@blueoakdb.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <01ee01c6536a$a2e7b210$1b51200a@corporate.libgo>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org



> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Joshua C.
> Clark
> Sent: Wednesday, March 29, 2006 2:55 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: PATCH-O-MATIC (installation issue)
>=20
>=20
> I guess I am confused, when you say recompile do you mean the os =
kernel or
> just iptables?

[ Also, please stop top-posting, respond at the bottom if you'd like my =
response. ]

Okay, I believe I see the problem.  We're not communicating properly.

When you say can I 'download the vanilla kernel', what you _meant_ by =
that is (even though you didn't say it ... and possibly didn't know it!  =
<g>):

	1) You download the kernel _source_ from kernel.org
	2) You config the kernel on your box
	3) You compile it on your box
	4) You reboot your machine with the new kernel

What I was trying to say is I had to do the above before I could use =
POM, much less before I could compile IPTABLE's.

I hope that helps.
-pablo



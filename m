From: Thomas Jones <admin@buddhalinux.com>
Subject: Re: Request: Submission of Rulesets
Date: Wed, 24 Aug 2005 17:25:06 -0500
Message-ID: <200508241725.14260.admin@buddhalinux.com>
References: <200508241314.37034.admin@buddhalinux.com>
	<200508241607.43943.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508241607.43943.rob0@gmx.co.uk>
Content-Disposition: inline
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
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wednesday 24 August 2005 16:07, /dev/rob0 wrote:
> On Wednesday 2005-August-24 13:14, Thomas Jones wrote:
> > Abstract:
>
> I readily admit that this is not a good day for me. I am not operating
> at full capacity, so to speak. But I have to say that this post made no
> sense at all to me. Is it just me? Did anyone else understand it? If
> so, can you explain it?
>
>
> I once saw an online automated generator of scholarly papers. It was
> hilarious! It used language just like this.

Hehehe. Ok...lets make it simple for you. Various security documentation is
composed using a custom XML markup language. Depending on the content,
modules are included or excluded. Given that these document instances are
security in nature they can be secured by a digital signature, encryption, =
or=20
both.

>
> Okay, I think I see a little substance here. The poster wants something
> which lists every possible valid netfilter rule. Right?

Seemingly, you are the the person to do this feat? Realistically, I don't=20
expect you or anybody else to have knowledge of all the rules. I have alrea=
dy
developed the basic structure of the DTD. I just want to do some QA on vari=
ous
rulesets that I have not applied it to.

>
> Unfortunately, the list of valid rules is almost infinite. And what's
> valid may vary in context: what's available in the kernel, other rules
> in the chain, et c. "iptables I OUTPUT -j LOG" is a valid rule (rather
> unfortunate if the local syslogd is logging to a remote syslog server,
> as each packet generates another one ad infinitum), but only valid if
> the LOG target is available.
>

The scenario you describe is what is called a conditional statement. Pretty=
=20
self-explanatory with regards to an XML DTD(or many other disciplines for=20
that reason).

>
> It's not even possible.
>

This statement is rather benign. Going back to your conditional statement=20
scenario; the DTD is constructed like that of a programming language. It can
be developed by means of pseudo-functions. An element may contain another, =
so=20
on so forth. This is surely within the intended scope and capability.

>
> Perhaps the purpose and intent of the SDI Firewall Rule Subset project
> should be reevaluated.

Because you do no not fully understand does not make it wrong.=20


How do you know what I don't know? You are not me.
=2D ---Zhuang Zi - The Warring States Period


Cheers,
Thomas
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFDDPPHoR5cE1e/kEIRAkM0AJ9KGwqKuzMCJjsm8oQ3RXHK43MVJgCfaqR7
nuf6UbusppcBeD62jfqcmVY=3D
=3DqsSS
=2D----END PGP SIGNATURE-----


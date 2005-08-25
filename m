From: Thomas Jones <admin@buddhalinux.com>
Subject: Re: Request: Submission of Rulesets
Date: Thu, 25 Aug 2005 09:35:47 -0500
Message-ID: <200508250935.54479.admin@buddhalinux.com>
References: <E656E2CC1C5AEB42ACB00EB83122C7741FCF13@farmer.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E656E2CC1C5AEB42ACB00EB83122C7741FCF13@farmer.vikus.com>
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

On Thursday 25 August 2005 06:56, Derick Anderson wrote:
> Out of curiosity (and the lack of fully understanding your intent), how
> would this DTD validate a ruleset? I imagine you'd be trying to go
> beyond syntax since netfilter will tell you when you do something silly
> like a --dport without a -p tcp|udp anyway. If that's so, what is your
> standard for failure of a ruleset? Or success of a ruleset?


The DTD is simply the document model by which the rule and/or rulesets can =
be=20
applied against.=20

This project can in no way perform logical evaluation of the rules. By this=
 I=20
mean the following: say you want to rate-limit incoming type 8 ping message=
s.=20
To do so you would construct the following rules:

iptables -A INPUT -i eth0 -p icmp --icmp-type echo-request \
              -m limit --limit 1/second -j ACCEPT

iptables -A INPUT -i eth0 -p icmp --icmp-type echo-request -j DROP

Using logical evaluation of these rules, we can determine the following wit=
h=20
respect to the pair:

=2D - Utilization of one rule without the other results in a completely dif=
ferent=20
behavior.
=2D - They must be introduced to netfilter in the order they are given --=20
otherwise the same is true again.
=2D - Both rules should be introduced adjacently. Otherwise there is chance=
 for=20
another rule to intervene.

None of this can be performed by a DTD or an XML markup language. These=20
however can be evaluated as you say by use of an XSL stylesheet.

The DTD simply validates against a known and programmed structure. The=20
advantages of using XML and this approach are such:

=2D - Easy to develop according to the structured document model.
=2D - Anybody can construct new rules with a minimal effort of syntactical=
=20
correctness.
=2D - The netfiler rules can be processed with a custom stylesheet to produ=
ce=20
equivalent rules and/or rulesets in other forms for perimeter devices not=20
consistent with the netfilter syntax(other firewalls, routers, etc...).
=2D - The netfiler rules can be processed with a custom stylesheet to evalu=
ate the=20
logical structure/intent of a given ruleset.
=2D - The rules can be digitally signed and encrypted by the administrative=
 entity=20
to secure the content. This ensures that confidentiality and integrity of t=
he=20
resources are intact.
=2D - The XML Security function(s) are standards-based. So inclusion into=20
regulatory requirements can be easily introduced without complications. i.e=
=2E=20
SOX

> I can submit
> a working ruleset that isn't optimal (accepting RELATED,ESTABLISHED
> connections as the last rule, for example) or that checks src/dst IPs
> but not which interface...

I am not here to judge yourself or the logical purpose of your rules. I sim=
ply=20
want to contribute to the community. None of my projects are for profit.=20
However, I do think that it could be a good starting point for new users to=
=20
the netfilter framework to be able to construct valid rules and/or rulesets.

> Admittedly I don't know that much about XML and DTDs. I don't know how
> powerful DTDs can be, but it seems to me like you'd need a high-level
> programming language in order to test for more than syntactical
> correctness.=20

That is a totally different beast. This is where the XSL stylesheets come i=
nto=20
play.

> A simulation environment for Netfilter rules is something
> I'd really like to see.

Agreed. Construction of pseudo datagrams and testing for resultant outcomes=
=20
would be a very interesting project.=20

Cheers,
Thomas
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFDDddIoR5cE1e/kEIRAqn0AKDc0iJETnOHYDBWOQlekweswOj3sQCeIo/6
LhSsuJbNwjqcG9fSmV5Hw2U=3D
=3D0+PB
=2D----END PGP SIGNATURE-----


From: =?ISO-8859-2?Q?Pedro_Gon=E7alves?= <pedro.pandre@gmail.com>
Subject: Re: Policy targets...
Date: Fri, 11 May 2007 11:21:34 +0100
Message-ID: <464443AE.5020904@gmail.com>
References: <464441F7.3050808@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <464441F7.3050808@freemail.hu>
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
To: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: Netfilter IPtableMailinglist <netfilter@lists.netfilter.org>

G=E1sp=E1r Lajos wrote:
> Hi all,
>
> I was reading the iptables manual because I needed the correct=20
> arguments of the policy (-P) command.
> Here it is:
>
>       -P, --policy chain target
>              Set the policy for the chain to the given target.  See=20
> the section TARGETS for the legal targets.  Only built-in=20
> (non-user-defined) chains can
>              have policies, and neither built-in nor user-defined=20
> chains can be policy targets.
>
> So I checked the TARGETS.
>
> TARGETS
>       A  firewall rule specifies criteria for a packet, and a target. =20
> If the packet does not match, the next rule in the chain is the=20
> examined; if it does
>       match, then the next rule is specified by the value of the=20
> target, which can be the name of a user-defined chain or one of the=20
> special values ACCEPT,
>       DROP, QUEUE, or RETURN.
>
> My question is: What is the difference between the ACCEPT and the=20
> RETURN target in policy ??? :D

in http://node1.yo-linux.com/cgi-bin/man2html?cgi_command=3Diptables :

TARGETS
(...)

*ACCEPT means to let the packet through.*=09
DROP means to drop the on the floor. =20
QUEUE means to pass the packet to userspace  (if ported  by  the kernel).=
 =20
*RETURN means stop traversing this chain and
       resume at the next rule in the previous (calling) chain.	 If  the =
 end
       of a built-in chain is reached or a rule in a built-in chain with =
tar-
       get RETURN is matched, the target specified by the chain policy de=
ter-
       mines the fate of the packet.*

Best Regards
pandre




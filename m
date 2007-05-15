From: Petr Pisar <xpisar@fi.muni.cz>
Subject: Re: Policy targets...
Date: Tue, 15 May 2007 11:13:24 +0000 (UTC)
Message-ID: <slrnf4j5ek.ic3.xpisar@album.ics.muni.cz>
References: <464441F7.3050808@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On 2007-05-11, G=E1sp=E1r Lajos <swifty@freemail.hu> wrote:
> Hi all,
>
> I was reading the iptables manual because I needed the correct arguments =

> of the policy (-P) command.
> Here it is:
>
>        -P, --policy chain target
>               Set the policy for the chain to the given target.  See the =

> section TARGETS for the legal targets.  Only built-in (non-user-defined) =

> chains can
>               have policies, and neither built-in nor user-defined=20
> chains can be policy targets.
>
> So I checked the TARGETS.
>
> TARGETS
>        A  firewall rule specifies criteria for a packet, and a target. =20
> If the packet does not match, the next rule in the chain is the=20
> examined; if it does
>        match, then the next rule is specified by the value of the=20
> target, which can be the name of a user-defined chain or one of the=20
> special values ACCEPT,
>        DROP, QUEUE, or RETURN.
>
> My question is: What is the difference between the ACCEPT and the RETURN =

> target in policy ??? :D
>
I think this is missunderstadning in man page. If you read the TARGETS
section carefully you could see here is nothing about policy even if -P
paragraph referres to it.

My opinion is ACCEPT and DROP only are valid policies. I don't know
where I have this idea from but I'm pretty sure that other targets have
not sense in policy context.

-- Petr



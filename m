From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: SNAT in OUTPUT chain of the nat table question?
Date: Wed, 8 Jan 2003 21:36:02 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301082136.02090.netfilter@newkirk.us>
References: <20030109003721.GA26207@mit.edu>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030109003721.GA26207@mit.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: bauer@mit.edu, netfilter@lists.netfilter.org

On Wednesday 08 January 2003 07:37 pm, bauer@mit.edu wrote:
> Is there a good reason that I am unable to conceive of at the
> moment why SNAT is not a valid target in the OUTPUT chain of the
> nat table?

Turn this around somewhat.  Can you present a case where SNAT would need=20
to be done in the nat OUTPUT chain, that could not also be performed in=20
the nat POSTROUTING chain achieving the same effect?  Even if you're=20
going to localhost, packets don't go from OUTPUT straight to INPUT.

That said, connections originating on the local box addressed to any IP=20
of the box itself do NOT appear in the nat-PREROUTING chain. (If you try=20
to DNAT in PREROUTING it still comes back in INPUT instead of=20
forwarding) Obviously this is a case where DNAT would be required in nat=20
OUTPUT, where it is in fact a valid target.  This is the only way to=20
DNAT a connection from the box to itself and send it elsewhere.

> Thanks,
> Steve

j

(stealing someone else's apropos sig, I believe Antony Stone's :^)
--
Perfection in design is achieved not when there is nothing left to add,=20
but rather when there is nothing left to take away.

 - Antoine de Saint-Exupery



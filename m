From: "Carl Holtje ;021;vcsg6;" <cwh0803@cs.rit.edu>
Subject: Re: executing a firewall script!!
Date: Tue, 26 Jul 2005 08:23:47 -0400 (EDT)
Message-ID: <Pine.GSO.4.58.0507260820580.2331@newavalon.cs.rit.edu>
References: <42e607e9.6446401e.6174.46a7SMTPIN_ADDED@mx.gmail.com>
	<9927912d050726045775275c9b@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9927912d050726045775275c9b@mail.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Visham Ramsurrun <vishamr2000@gmail.com>
Cc: netfilter@lists.netfilter.org

On Tue, 26 Jul 2005, Visham Ramsurrun wrote:

> Hi to all,
>
> I would like to know how to execute a firewall script that contains an
> if-else statement on a per-packet basis. The if and else part each
> contain iptables rules that need to be executed on a packet basis? How
> can I do that?
>
> Any input will be most appreciated..

First guess is with two chains.. it's clear you have a test for the
'if (test) then X' sequence, so write a rule to check that test. Instead
of REJECTing or ACCEPTing the packet immediately, send it over to
different chain for additional testing, and ACCEPT or REJECT it there.

Does that make sense?

Perhaps a more detailed explaination of what you're trying to do would be
helpful...

HTH...

- --

"There are 10 types of people in the world: Those who understand binary
and those that don't."


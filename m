From: "Marius Mertens" <marius.mertens@gmx.de>
Subject: Re: SSH Brute Force not working (any longer)
Date: Thu, 28 Jul 2005 01:33:00 +0200
Message-ID: <005e01c59303$96da48c0$4206a8c0@loki>
References: <5d2f37910507270936737ad3d1@mail.gmail.com>
	<003601c592df$9f92fda0$4206a8c0@loki>
	<5d2f379105072715502f71e9b4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Netfilter User Mailing List <netfilter@lists.netfilter.org>

On Thursday, July 28, 2005 12:50 AM,
curby . wrote:

> 2 and 3 have --set during the rule in the INPUT chain that jumps to
> the custom chain.

Ooops, blind me, I completely overlooked that. But it should work anyway.

> If this is not the result of something dumb we're doing, there's
> probably a bug that should be squirreled out.  Intermittent problems
> in security software are bad. Still, iptables has been so stable that
> I'm thinking it's likely my fault. =P

Nope, guess it's not your fault ;-) I found something with google, and it 
looks relevant to our problem. It also explains why my reboot didn't seem to 
help first, but then it magically started working again:
http://patchwork.netfilter.org/netfilter-devel/patch.pl?id=2587

Marius 



From: Tobias DiPasquale <cbcgtt@gmail.com>
Subject: Re: FIB LPM algorithm
Date: Mon, 7 Jun 2004 08:11:00 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <9e3aacf4040607051129edfb01@mail.gmail.com>
References: <9e3aacf40406070423583216f@mail.gmail.com> <200406071302.15598.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406071302.15598.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

On Mon, 7 Jun 2004 13:02:15 +0100, Antony Stone
<antony@soft-solutions.co.uk> wrote:
> Er, what do LPM and FIB mean please?   I think I know netfilter quite well,
> and I've not come across these abbreviations so far...

LPM = Longest Prefix Match, the algorithm used to match an IP to a
particular route based on the route's destination network spefication.

FIB = Forwarding Information Base, the data structure used by the
kernel to hold packet routing information.

There are 3 or 4 files in net/ipv4/ devoted entirely to the FIB (which
are called in route.c in the same subdir). Thinking more about this,
though, it was probably a mistake posting this to the netfilter
list... it seems more of a question that should be asked of the
linux-net list.

As well, I just found a small section on the FIB in Chapter 18 of
Understanding the Linux Kernel (2nd Edition) but its not really as
specific as I would like with respect to the exact LPM algorithm used.

I will repost my original message to linux-net but will also be
amenable to any direction that may come from this list, as well.
Thanks again :)

--
Tobias DiPasquale
[ 0x63626367545440676d61696c2e636f6d ]


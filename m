From: Alex Feldman <alex@alexandrite.boisestate.edu>
Subject: Re: opening up an ipchain
Date: Wed, 15 Nov 2006 07:34:35 -0700
Message-ID: <200611151434.kAFEYZvn019639@alexandrite.boisestate.edu>
References: <200611142055.kAEKt2IY017525@alexandrite.boisestate.edu>
	<5950b335a1ae99d1fb0593c324f4b67b@former03.de>
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <5950b335a1ae99d1fb0593c324f4b67b@former03.de>
	(baltasar.cevc@former03.de)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: baltasar.cevc@former03.de
Cc: netfilter@lists.netfilter.org

Thanks very much, Baltasar - I will try what you said, particularly with
looking at the log file - the two computers are in different locations
(and different from the one I am in now), so it takes at least a day to
try anything, but I would greatly appreciate some elaboration on one of
the things you wrote:

:> I suspect you either have some more rules added somewhere (check that
:> using "iptables -L -v", look for REJECT and DROP targets), a typo in
:> the mac (you may try whether "arp" shows you an address for your
:> other computer) or an error unrelated to packet filtering.

This gets at the heart of my larger question, as opposed to simply "what
do I have to do to get this to work?"  What other rules would interfere
with this?  This is either the last or the second to last rule I add,
and the first rules I have are:

iptables --policy INPUT   DROP
iptables --policy OUTPUT  ACCEPT
iptables --policy FORWARD DROP

So I begin by dropping everything, and then pick up a few things I want,
like this mac address.  Could any rule I put in before the one that
accepts the mac address interfere with this one?  If so, how?  And is
this the kind of thing where it makes a difference if you use -A or -I?
I'm all but certain there are no other iptables rules around - if I
remove the file that has these in them, my computer appears to be open
to the whole world.

Thanks very much.

-- 
	--alex			alex@math.boisestate.edu

        <a href="http://math.boisestate.edu/~alex/">Alex Feldman</a>


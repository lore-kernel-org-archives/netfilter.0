From: Peteris Krumins <newsgroups@lf.lv>
Subject: Re[2]: Possible huge iptables memory leakage
Date: Thu, 31 Jul 2003 23:33:44 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <190268702674.20030731233344@lf.lv>
References: <200307311943.h6VJhjjX018060@discmail.com>
Reply-To: Peteris Krumins <newsgroups@lf.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200307311943.h6VJhjjX018060@discmail.com>
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
To: netfilter@lists.netfilter.org

Hello Aldo,

Thursday, July 31, 2003, 10:42:12 PM, you wrote:

ASL> I run many different Linux systems ranging in physical memory from 128M to
ASL> 5Gig (that's RAM!) both with and without iptables:

Yes, i have running lots of systems, but the most interesting part is
that i have a traffic accounting, shaping and real netfilter box.
w/ 2.4.20 base, iptables 1.2.7a - it eats only 190 of 512 not ever
more.

ASL> The funny thing about Linux is - if you give it RAM - it will use it....I am
ASL> sure someone more in tune with mem management will set me straight, but it
ASL> seems that Linux will always grab up 90% of all physical memory after it has
ASL> been running for a while...

Only if some interactive (not necessary user interacive) applications are running.

ASL> To make a short story long - unless you are tracking all connections (and
ASL> there are many dynamic connections) I would not be too quick to blame
ASL> iptables - I mean the amount of ram you are using in 30Meg - is this the
ASL> 80's???

Not 80's, but i have to get my project running w/ less than 59MB ram.

Yes, i am tracking connections - but its now night (23:30/11:30 pm),
the computer w/ connection tracking has 600 conntrack entries (its
1200 less than it was 5 hours ago) but it uses 10 more megabytes of
ram than then (5h ago) and still growing.

I hope it's just Linux - eating as much ram as possible and then
using. And it's not a memory leak..


P.Krumins



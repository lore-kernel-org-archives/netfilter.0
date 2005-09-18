From: Dino Klein <zagzag-lists@speakeasy.net>
Subject: Application order of match extensions
Date: Sat, 17 Sep 2005 21:25:00 -0400
Message-ID: <432CC1EC.20105@speakeasy.net>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

While creating some rules for slowing down SSH attacks, I've ran into an
interesting question - what is the order in which match extensions are
processed? namely,  does these two rules differ:

(1) -m tcp -m state -m recent --state NEW -p tcp --dport ssh --seconds
180 --hitcount 2 --update --name ssh -j REJECT

(2) -m tcp -m recent -m state --state NEW -p tcp --dport ssh --seconds
180 --hitcount 2 --update --name ssh -j REJECT

The only difference between the two is the order of the 'state' and
'recent' extensions.

The first one works as designed - reject new connections for IP
addresses that already have a hit-count of 2 and the last update
occurred no more than 180 seconds ago.

However, the second rule seems to apply the recent match first, and it
does so for any packet destined for port 22, so the '--update' takes
effect (assuming the hit count and time criteria are fulfilled). Only
then the state of the connection is examined. The effect of this is that
open connections end up affecting the count, and last-seen time in
respect to the 'recent' extension, and in essence the IP is blocked from
initiating any new connections.

So, is this how things are supposed to be, and always will? is the
application order of the match extensions determined by the order of how
they were specified on the command line?

I couldn't find info in the man page, so I was hoping someone could give
me an answer.

Thanks in advance.


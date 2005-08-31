From: Hose <subscriptions@bluemaggottowel.com>
Subject: difference between --rcheck and --update in recent
Date: Tue, 30 Aug 2005 20:33:33 -0500
Message-ID: <20050831013333.GA9794@bluemaggottowel.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I've set up a few simple rules to kill off annoying ssh brute force
attacks, however, I'm confued between the differences among "rcheck" and
"update".

From what I gather, they both do the same thing EXCEPT update also
updates an existing record, not just checking for its existence.  The
question is... what does it update?  Take the following two examples
(simplified for example purposes only).

Example 1:
-A INPUT -p tcp --dport 22 -m recent --rcheck \
--hitcount 3 --seconds 600 -j LOG --log-prefix "SSH attack: "

-A INPUT -p tcp --dport 22 -m recent --rcheck \
--hitcount 3 --seconds 600 -j DROP

-A INPUT -p tcp --dport 22 -m recent --set -j ACCEPT


Example 2:
-A INPUT -p tcp --dport 22 -i eth0 -m state --state NEW -m \
recent --set

-A INPUT -p tcp --dport 22 -i eth0 -m state --state NEW -m recent \
  --update --seconds 60 --hitcount 4 -j DROP

-A INPUT -p tcp --dport 22 -i eth0 -m state --state NEW -j ACCEPT 


The first one allows up to 3 SSH attempts within 600 seconds.  That's
pretty straightforward.  

The second one checks for new connections to sshd, inserts it into the
recents list (default) in the first line.  The second line drops the
packet if it's been seen more than 4 times in the last 60.  But since
it's an update, does it actually update the record in the list, ie
incrementing the hitcount? IOW, everytime a new connection comes in does
it actually climb TWO hitcounts instead of just one?

It doesn't seem to increment the hitcount two times, but I could be
readint /proc/net/ipt_recent wrong.

The crux of the matter is what exactly is the difference between update
and rcheck?

hose


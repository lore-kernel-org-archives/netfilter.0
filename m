From: Jeff Gordon <jeff.gordon@wellnow.com>
Subject: Best defense for syn-floods...?
Date: Thu, 3 Jun 2004 17:16:50 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040603211650.GO24398@wellnow.com>
References: <20040602190641.GQ18797@wellnow.com> <Pine.LNX.4.33.0406030949440.10743-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0406030949440.10743-100000@blackhole.kfki.hu>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Now that I've got ipt_recent installed and running, I'd be grateful for
comments or rule samples that could work best to ameliorate syn-floods.
(The site I'm working on has been the target of moderate-to-large-sized
syn-floods for a few months now, ongoing.)

I've been using this approach:

-N syn-flood
-A syn-flood -m limit --limit 6/s --limit-burst 10 -j RETURN
-A syn-flood -j LOG --log-prefix "SYN-FLOOD: "
-A syn-flood -j DROP

-A INPUT -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT

-A INPUT -i eth0 -p tcp --syn -j syn-flood

...and, on the high-traffic site involved, have had occasions when the
machine became unreachable, the server load too high.

Someone suggested ipt_recent could handle this matter more accurately. 
I found a rule on the web that someone was using, and tried that a few
minutes ago, with this approach:

-N syn-flood
-A syn-flood -j LOG --log-prefix "SYN-FLOOD: "
-A syn-flood -j DROP

-A INPUT -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT

-A INPUT -i eth0 -p tcp --syn -m recent --hitcount 10 --update \
   --seconds 60 -j syn-flood

...but very soon _no one_ could get a server connection, with that.

My 'mental model' of how ipt_recent is working must not be correct --
at least, I don't understand why the '--limit' ruleset seems to allow
normal traffic under most conditions but the '-m recent' rule kept
normal users from getting in, just a few minutes ago.

If anyone knows what I'm missing in my understanding of this, or has a
ruleset that works well to ameliorate syn-flooding, please let me know.

Thanks kindly,

-- 

 -- Jeff --   <http://www.wellnow.com>

 "There's nothing left in the world to prove.  All that's worth doing
  is to love one another, using whatever means are available to serve."


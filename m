From: Chris Wilson <chris@netservers.co.uk>
Subject: Re[2]: Interesting problems
Date: Wed, 6 Aug 2003 11:03:51 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0308061053420.21531-100000@localhost>
References: <16160478015.20030805225428@lf.lv>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <16160478015.20030805225428@lf.lv>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peteris Krumins <newsgroups@lf.lv>
Cc: Netfilter <netfilter@lists.netfilter.org>

Hi Peteris,

> 266 isnt that slow, that's only connection tracking, is it (too slow)?

For 20000 connections, I'd say it was too slow.

> Most of the entries taking up conntrack table are:
> tcp 6 419547 ESTABLISHED src=X dst=Y sport=A dport=B [UNREPLIED] src=Y
> dst=X sport=B dport=A use=1 mark=0
> 
> They would expire only after 419547 secs that is 4 days, but during those 4
> days the table grows 5 times that much entries..
> 
> Is there some trick to kill UNREPLIED tcp conntrack entires if there
> is no reply after NN seconds.

In theory they should be killed automatically to make room for real 
(ESTABLISHED) connections. So you may be able to reduce the size of the 
conntrack table without impacting user experience, and make your system 
run faster that way.

You could also try the patch that Daniel Chemko suggested,

> Also could it be done in software w/o much trouble? Monitoring
> conntrack table and removing dead entries like these.
> If it's not much trouble i can instruct our programmers instantly to
> work on such tool.

I believe that Harald is working on nfnetlink/ctnetlink which will allow 
you to do this, but I think it's still experimental. 

> I can instruct our programmers (I am the team leader) to do some work
> on iptables connection tracking code and after improvments i could
> send it as a patch for current iptables. So connection tracking would
> be as efficient as possible. I just need someone to tell me exactly
> what is inefficient in conntrack code.

Sorry, I'm really not the best person to ask about that, but Harald and
Rusty have some profiling and optimisations on their TODO lists which they
might be willing to hand off to your team.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |




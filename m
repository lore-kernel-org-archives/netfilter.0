From: Jani Averbach <jaa@cc.jyu.fi>
Subject: Using iptables with x86_64 static kernel (module problems)?
Date: Wed, 1 Oct 2003 19:11:36 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031001161136.GA13226@cc.jyu.fi>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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


Hello!

I am trying to use netfilter (iptables) with static (no module
support) x86_64 kernel (2.4.23-pre5-x86_64-1). However, iptables won't
work with that kernel because it try to do various modules related
task. If I compile a static i386 2.4.23-pre5 kernel that will work
like expected. 

It seems that the problem is that I don't have 64bit modutils at the
hand, and I don't like to have. So is there any way to tell iptables
"don't touch modutils stuff, they won't work"?

If this is a nontrivial problem, I could provide more detailed
information.

Thanks,
Jani
 
-- 
Jani Averbach



From: Atsushi Nakagawa <atnak@chejz.com>
Subject: Owner match no owner question
Date: Tue, 25 May 2004 23:05:45 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040525225811.BACC.ATNAK@chejz.com>
Reply-To: Atsushi Nakagawa <atnak@chejz.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hi,

This is an excerpt from the iptables manpage under owner MATCH:
"It is only valid in the OUTPUT chain, and even this some packets (such
as ICMP ping responses) may have no owner, and hence never match."

How do I match these packets that do not have an owner?  I have a drop
all policy where I only allow established and related packets and output
packets of certain owners.  With this configuration, I often see ICMP
and sometimes TCP resets as having been dropped.

Thanks,


-- 
Atsushi Nakagawa
<atnak@chejz.com>
Changes are made when there is inconvenience.



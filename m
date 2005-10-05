From: Daniel Wittenberg <daniel-wittenberg@starken.com>
Subject: something stupid
Date: Wed, 05 Oct 2005 01:21:08 -0500
Message-ID: <1128493268.31931.9.camel@tholian.starken.com>
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

I think it's late and I've got to be missing something here.  I have 2
interfaces to different ISP's.  The second interface, eth1, responds
just fine on the primary IP ".189".  I have an alias interface .188 that
when I apply an iptables rule to, gets no traffic at all.  Yet if I try
and apply rules to .189 it works great.  The rule I'm applying to .188
is right after flushing the tables, before any other rules, so it should
be catching it (right now just a logging rule).  Any clues to what I'm
missing?

Thanks,
Dan


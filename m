From: Phil Howard <phil-netfilter@ipal.net>
Subject: how to block 10000's of addresses?
Date: Sun, 13 Oct 2002 06:50:07 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021013065007.A15824@hamal.ipal.net>
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

I would like to know how best to block 10000's of addresses using
netfilter.  Clearly I do not want to be placing 10000's of individual
filter table entries in.  Is there some kind of means to set up the
equivalent of a routing table like lookup structure (which can be
added to and removed from separately) which a single netfilter rule
would reference to apply matches?

I want to block _incoming_ packets.  Null routing these addresses is
not sufficient, as the lame SYNs will continue to eat up resources.

-- 
-----------------------------------------------------------------
| Phil Howard - KA9WGN |   Dallas   | http://linuxhomepage.com/ |
| phil-nospam@ipal.net | Texas, USA | http://ka9wgn.ham.org/    |
-----------------------------------------------------------------


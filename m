From: seberino@spawar.navy.mil
Subject: Need diagram on *order* IP packet traverses iptables 'tables'
Date: Thu, 20 Jan 2005 16:04:39 -0800
Message-ID: <20050121000439.GA1626@spawar.navy.mil>
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

I am looking for a diagram to remind me of path
a NAT'ed IP packet takes thru all the iptables tables
when it goes from Internet to a private firewalled PC and vice versa.

e.g. What order does packet traverse INCOMING, FORWARD, PREROUTING,
POSTROUTING guys?

Chris


From: David Cary Hart <DCH@TQMcube.com>
Subject: Rule Set Size vs Performance Follow-up
Date: Thu, 29 Jul 2004 11:08:11 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1091113691.9879.9.camel@dchws.tqmcube.com>
Reply-To: NetFilter List <netfilter@lists.netfilter.org>
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
To: netfilter <netfilter@lists.netfilter.org>

The issue was a large number of dpt 80 rules that are added by a script
from Snort exploits.

The suggested solution was to move these to a new chain so that only
packets destined for httpd would have to traverse several hundred
(hopefully temporary) rules.

Not only does this make logical sense but I notice a definite
improvement in DNS (which is the most apparent performance issue).

Thanks.



From: Eduardo =?ISO-8859-1?Q?Fern=E1ndez?= <eduardo@cmusanjuan.com>
Subject: [OT] Traffic from ff:ff:ff:ff:ff:ff in switched environment
Date: Tue, 16 Nov 2004 22:45:54 +0100
Message-ID: <1100641554.1647.10.camel@laserite>
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

Hi all,

i know this is not strictly about netfilter, but here it goes:

While I was deploying my firewall script, I noticed some weird traffic
from mac ff:ff:ff:ff:ff:ff in my router's private interface. Later on I
noticed the same traffic in other computers within the network. The
traffic was arp who-has packets at a constant rate of about 35 kbytes/s.
It's a /16 network in a switched environment. 

Thank you very much in advance. Best regards,

Eduardo



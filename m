From: Payal Rathod <payal-netfilter@scriptkitchen.com>
Subject: dnatting
Date: Mon, 11 Jul 2005 11:18:30 -0400
Message-ID: <20050711151830.GA26670@tranquility.scriptkitchen.com>
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
To: Netfilter ML <netfilter@lists.netfilter.org>

Hi,
I have a rule on my friend's broadband connection to redirect traffic 
from outside to an internal machine like,

iptables -A PREROUTING -d 1.2.3.4 -p tcp -m tcp --dport 80 -j DNAT  \
--to-destination 192.168.10.10:80

But she complained that people from inside the network cannot do
http://1.2.3.4 in their browser and see the site. Is she correct?
What is wrong with my rule because I can see the site from outside?

Thanks in advance.
With warm regards,
-Payal




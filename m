From: Nathaniel Hall <nathaniel.d.hall@gmail.com>
Subject: Change outbound ICMP source
Date: Mon, 10 Apr 2006 13:02:12 -0500
Message-ID: <443A9DA4.30801@gmail.com>
Reply-To: nathaniel.d.hall@gmail.com
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I have been trying to figure out how to change the source IP address of 
an ICMP packet that originates from the firewall.  Here is my application.

Instead of dropping a packet I reject it with ICMP host unreachable 
messages.  I would like to make it appear that the firewall isn't there, 
so I would like to change the source IP address to be that of our 
upstream router.  How would I go about doing this?

-- 
Nathaniel Hall, GSEC GCFW GCIA



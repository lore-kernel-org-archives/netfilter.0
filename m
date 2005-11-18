From: Anthony Azzopardi <tazzopardi@camline.net.mt>
Subject: Could anyone, please, tell me what's wrong with this:
Date: Fri, 18 Nov 2005 11:54:52 +0100
Message-ID: <437DB2FC.7080000@camline.net.mt>
Reply-To: tazzopardi@camline.net.mt
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

|Hello ppl,

Could anyone, please, tell me what's wrong with this:

iptables -A FORWARD --match iprange --src-range 192.168.123.1 - 
192.168.123.99 -j DROP

It's giving me errors.

Thanks,
Anthony
|



From: Binish A R <binishar@poornam.com>
Subject: CONFIG_IP_NF_MATCH_OWNER
Date: Thu, 11 Aug 2005 21:47:00 +0530
Message-ID: <42FB79FC.4060000@poornam.com>
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

Hello,

Does anyone knows why CONFIG_IP_NF_MATCH_OWNER is missing  in 2.4.28 and later kernels?
Its used for matching owners of packets ...
I noticed this when the following rule wasn't recognizing in one of my 2.4.29 kernel ...
iptables -I OUTPUT -p tcp --dport 22 -m owner ! --uid-owner  root -j DROP

If we manually add the entry in .config and compile the kernel. it will work fine ... :-/

/binish/


Get Thunderbird <http://www.mozilla.org/products/thunderbird/>

From: Piotrek Kaczmarek <kaczorek@k.daleka.net>
Subject: accounting NAT-ed packets
Date: Sun, 19 Dec 2004 11:12:57 +0100
Message-ID: <20041219101257.GA16236@daleka.net>
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

Hello,

I want to account all traffic from the address assigned to the linux box
(including NAT, locally generated traffic), but i can't. The rule
iptables -t mangle -A POSTROUTING -s 213.25.213.42
seems not to ,,catch'' NAT-ed packets, only locally generated traffic.

Is there any method to ,,catch'' packets after NAT with netfilter?

Best Regards,

-- 
Piotr Kaczmarek


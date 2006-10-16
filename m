From: "Andrew Hall" <temp02@bluereef.com.au>
Subject: Conntrack entry removal with an iptables delete
Date: Mon, 16 Oct 2006 17:23:30 +1000
Message-ID: <00e201c6f0f3$fd1fb2b0$6401a8c0@bluereef.local>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Is it possible to add an option to iptables to allow an IP conntrack entry 
to be removed when a matching an iptables (-D) delete or flush occurs? In 
other words can we implement say a '-B' option to clear any matching 
conntrack entries before we remove the rule from the kernel? 



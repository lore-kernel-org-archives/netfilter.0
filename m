From: "Wennie V. Lagmay" <wlagmay@yanbulink.net>
Subject: Iptables as packet shaper
Date: Sat, 14 May 2005 14:51:55 +0300
Message-ID: <001901c5587b$53a2ff60$f00aa9c0@winxp>
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

Hi all,

Im using iptables to filter, translate IP address and forward traffic,  Im 
using squid delay_pool to limit client access per user and per network, but 
im having a limitation with the squid delay_pool. I want to have a packet 
shaper that can can allow my user to have 32 kbps during peer time and 256 
during off peek time. Delay_pool is not capable of that. Can IPTABLES do 
this kind of shaping?

Thank you very much,

wennie 



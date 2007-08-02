From: Juan Carlos Castro y Castro <jcastro@instant.com.br>
Subject: How to tarpit without loading conntrack modules?
Date: Wed, 01 Aug 2007 22:53:07 -0300
Message-ID: <46B13903.2060206@instant.com.br>
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

(Please CC me as I'm not on the list)

Is it possible to use the TARPIT module without auto-loading conntrack 
modules and still leaving the machine able to make outbound connections? 
I tried the following and it didn't work. Using -m state --state 
ESTABLISHED loads the conntrack modules and therefore leaves the machine 
open to resource waste by connections that get tarpitted. Is there a 
solution? Or will I have to separate a machine for the purpose, and 
leave it unable to make outbound TCP connections?

-A INPUT -s 127.0.0.0/8 -j ACCEPT
-A INPUT -s (some source) -p tcp -m tcp --dport (some port) -j ACCEPT
-A INPUT -s (other source) -p tcp -m tcp --dport (other port) -j ACCEPT
-A INPUT -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -j TARPIT
-A INPUT -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK ACK -j TARPIT



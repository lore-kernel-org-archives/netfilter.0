From: Miguel Amador <amador@puc.cl>
Subject: Balancing Web Traffic
Date: Tue, 29 Mar 2005 17:04:25 +0200
Message-ID: <1112108665.1136.48.camel@Knoppix>
Reply-To: amador@puc.cl
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

Hi all
				
I have:	
				      ___ WWW1 __
Inet <--> [Iptables/Netfilter Box ---|	         |- BD
				     |___ WWW2 __|
					
My question is, somebody know anyway to balanced the traffic to the
Webservers with iptables ?
 I know that if i repeat Nat's rules for different ip's (ip's of web
services) iptables does a primitive balanced... but anybody know other
way ?

thank all and sorry for my english
Regards
 Miguel Angel Amador L.





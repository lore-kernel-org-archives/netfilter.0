From: Guido Lorenzutti <guido@lorenzutti.com.ar>
Subject: drop msn file transfers
Date: Tue, 04 Jan 2005 21:12:11 -0300
Message-ID: <41DB30DB.3000801@lorenzutti.com.ar>
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

Hi people, im new on the list.

What I would like to do is to drop every "file transfer" in the msn. My 
current situation is that in mi firewall:

* im allowing the port 1863 on the FORWARD chain
* i don't allow 80 on the FORWARD chain
* every http packet goes thru the squid on the same machine.
* The policy by default is DROP on the FORWARD chain.

Any ideas? I think im going to have to sniff how the file transfer is 
made to use regex on the iptables or try the patch for the iptables on 
layer 7.

Im going to investigate a little further and i will post my advances.

PD: sorry for my english, i never study :)


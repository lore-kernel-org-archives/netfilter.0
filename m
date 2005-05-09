From: "Roberto Dud (listas)" <listas@dud.com.br>
Subject: port and adress forward
Date: Mon, 09 May 2005 14:36:04 +0000
Message-ID: <427F7554.4000107@dud.com.br>
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

Hi All,

I have a web and mail server in my local lan with ip 192.168.0.x and I 
have a firewall / gateway with valid address.  I have a policy a to 
redirect port 80 to my internal server. But I try to access my website 
inside my internal lan and doesn't access.

My chain is below:

  iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT 
--to-dest 192.168.0.X
  iptables -A FORWARD -p tcp -i eth0 --dport 80 -d 192.168.0.X -j ACCEPT

Anyone help me?

thanks,

Dud.



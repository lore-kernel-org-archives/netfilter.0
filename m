From: Julio Cesar Ody <julioody@bol.com.br>
Subject: making services invisible
Date: Thu, 10 Oct 2002 10:13:52 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DA57D10.8040904@bol.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello. I'm using Slackware 8.1, kernel 2.4.18 and iptables v1.2.7a. I 
blocked external acess to some services using the following rule:

iptables -A INPUT -i ! eth0 -p tcp -m multiport --destination-port 
<port1>,<port2>,<blablabla> -j REJECT

However, when I perform a stealth scan using nmap on my host, I still 
can see them running, but instead of "opened" I get them as "filtered". 
Is there a way to block these results, making the services literally 
invisible ? Appreciate any help, and also any technical information 
(links, docs) regarding the answer.



Julio Cesar Ody



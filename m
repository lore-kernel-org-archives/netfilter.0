From: alex syring <alex@asyring.homeip.net>
Subject: How to route all http trafic form intern to proxy
Date: Thu, 6 Mar 2003 19:38:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E18r0Fu-000307-00@kashyyyk.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi
I have the problem that all Computers from the internal net should use the 
proxy.

I've testet  
iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 
3128 

but after this i get a error of proxy and I don't know what's the problem.
Another problem is maybe that the version of iptables I use is the 
version 1.2.2

Thx for help
Alexander 

Answers could also be in german


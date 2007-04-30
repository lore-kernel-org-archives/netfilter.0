From: <sneak@ipnoc.co.za>
Subject: my DNAT not working...help
Date: Mon, 30 Apr 2007 16:40:15 +0200
Message-ID: <001a01c78b35$77917f20$648045ac@Sneak>
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

Hi my DNAT is no longer working?

 This used to work on kernel 2.6.10 FC3, i am now running kernel 2.6.18 on 
CentOS5 due to hardware upgrade

These are my nat rules  ..

 iptables -t nat -A POSTROUTING -o eth1 -s 10.22.200.25 -j SNAT --to 
172.15.0.15
 iptables -t nat -A PREROUTING -i eth1 -d 172.15.0.15 -j DNAT --to 
10.22.200.25

 I can see my traffic getting natted to 172.15.0.15 but though a tcpdump but 
not back to 10.22.200.25
 any ideas? 



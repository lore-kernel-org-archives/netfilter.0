From: Gianni Pucciani <gp.puccio@tin.it>
Subject: opening connection for Tomcat
Date: Thu, 08 Apr 2004 17:13:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40756C19.3010606@tin.it>
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

Hi all,
I was in trouble opening a port for services with tomcat:
Is this rule right? I'm behind an adsl router that forward every 
connection on port 8080 to <myprivateip>.

iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp -d <myprivateip> --dport 8080 -s 0.0.0.0 -m 
state --state NEW -j ACCEPT




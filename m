From: Michael Gale <mgale@utilitran.com>
Subject: default policies for the NAT chains
Date: Tue, 2 Dec 2003 18:03:02 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031202180302.32601c1d.mgale@utilitran.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

	Ok -- I had my firewall working perfectly with a default policy in affect:
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

It was also working great for the 22 virtual IP addresses.

I then though about the NAT chains (PREROUTING,OUTPUT and POSTROUTING) and figured they should have a default policy as well.

I added that to the list and not I can not start a out going connection from the firewall.

So my question is do I need default policies for the NAT chains ? If so it would seem like I need some rules added twice ? 

Any suggestions would be appreciated :)

-- 
Michael Gale
Network Administrator
Utilitran Corporation


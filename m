From: "Carlos Eduardo R. L. de Miranda" <cerlm@hotmail.com>
Subject: what I am doing wrong?
Date: Mon, 22 Jan 2007 15:11:59 -0300
Message-ID: <BAY110-DAV157444A1BAE5D5181484A8BAAE0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Message-ID: <004001c73e50$cf31ed50$7400a8c0@ws1>
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

I am trying to limit the number of tcp connections each IP can keep
ESTABLISHED at any given time. Checking ip_conntrack file, I notice that
connlimit is not working. All connlimit rules are before NAT rules. What I
am doing wrong?

Any help will be appreciated

-Carlos


modprobe iptable_nat
modprobe ip_conntrack
modprobe ip_conntrack_ftp
modprobe ip_nat_ftp
modprobe ipt_limit
modprobe ipt_state

iptables -t filter -P INPUT DROP
iptables -t filter -P FORWARD DROP
iptables -N CONNLIMIT

iptables -A FORWARD -p TCP -d 0/0 --dport 1024:1862 -j CONNLIMIT
iptables -A FORWARD -p TCP -d 0/0 --dport 1864:3127 -j CONNLIMIT
iptables -A FORWARD -p TCP -d 0/0 --dport 3129:5599 -j CONNLIMIT
iptables -A FORWARD -p TCP -d 0/0 --dport 5601:5899 -j CONNLIMIT
iptables -A FORWARD -p TCP -d 0/0 --dport 5901:7776 -j CONNLIMIT
iptables -A FORWARD -p TCP -d 0/0 --dport 7778:65535 -j CONNLIMIT
iptables -A CONNLIMIT -p TCP -m state ! --state RELATED -m connlimit
--connlimit-above 12 --connlimit-mask 32 -j DROP


# iptables -L
... deleted ...
CONNLIMIT  tcp  --  anywhere             anywhere            tcp
dpts:1024:techra-server
CONNLIMIT  tcp  --  anywhere             anywhere            tcp
dpts:paradym-31port:ctx-bridge
CONNLIMIT  tcp  --  anywhere             anywhere            tcp
dpts:netport-id:esinstall
CONNLIMIT  tcp  --  anywhere             anywhere            tcp
dpts:esmagent:5899
CONNLIMIT  tcp  --  anywhere             anywhere            tcp
dpts:5901:7776
CONNLIMIT  tcp  --  anywhere             anywhere            tcp
dpts:interwise:65535

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain CONNLIMIT (6 references)
target     prot opt source               destination
DROP       tcp  --  anywhere             anywhere            state
INVALID,NEW,ESTABLISHED,UNTRACKED #conn/32 > 12





  _____  

avast! Antivirus <http://www.avast.com> : Outbound message clean. 


Virus Database (VPS): 000704-1, 22/01/2007
Tested on: 22/1/2007 15:11:59
avast! - copyright (c) 2000-2007 ALWIL Software.





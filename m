From: Elvir Kuric <omasnjak@yahoo.com>
Subject: Question related to DROP target?
Date: Mon, 25 Sep 2006 12:31:56 -0700 (PDT)
Message-ID: <20060925193156.58922.qmail@web56215.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi people, I wrote some rules in my firewal like
bellow.
When I started it blocked my all connections, and I
realised that ( <#iptables -P INPUT DROP
#iptables -P OUTPUT DROP
#iptables -P FORWARD DROP ) blocking everything.So I
put in comment.  I am confused because this rule is at
beggining of firewal and I do not understand why rules
that comes after are not implemented. I want to block
all traffic first and theh allow specified trafic.
Please I need your opinions, I read many sources and I
understand what above rules means, but I can not
understand why rules after does not working.
Regards

PS : Links and other resources are welcome too

Thanks 

Elvir Kuric



iptables -F
iptables -t nat -F
iptables -t mangle -F



iptables -X
iptables -t nat -X
iptables -t mangle -X



#iptables -P INPUT DROP
#iptables -P OUTPUT DROP
#iptables -P FORWARD DROP


iptables -A INPUT -s 127.0.0.1/255.0.0.0 -j ACCEPT
iptables -A OUTPUT -d 127.0.0.1/255.0.0.0 -j ACCEPT



iptables -A INPUT -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT

iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
#iptables -t nat -A POSTROUTING -o eth1 -j SNAT
--to-source ip_adresa


iptables -A OUTPUT -p tcp --dport 22 -j ACCEPT





__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam
protection around 
http://mail.yahoo.com 

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 


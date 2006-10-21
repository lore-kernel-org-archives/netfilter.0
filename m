From: Adhi Laksono <wingback06@yahoo.com>
Subject: Why is my 443 port blocked
Date: Fri, 20 Oct 2006 23:06:51 -0700 (PDT)
Message-ID: <20061021060651.60312.qmail@web31001.mail.mud.yahoo.com>
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

Hello everyone,

I made a script for my firewall, one of the rules is

$IPTABLES -A LAN-Internet -p tcp -s $NET_LSN -d 0/0
--dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT

$IPTABLES -A LAN-Internet -p tcp -s 0/0 --sport 443 -d
$NET_LAN -m state --state ESTABLISHED -j ACCEPT

with my default policy DROP..

I can open http://www.yahoo.com, but how come I can't
open the mail.yahoo.com???

In my log list, it says that the packet for port 443
is blocked, and sometimes port 80 is blocked to???
what's wrong with my firewall??? why isn't it
stable...



__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 


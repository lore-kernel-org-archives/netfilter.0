From: Elvir Kuric <omasnjak@yahoo.com>
Subject: Redirecting ssh requests from external world to internal server.
Date: Fri, 29 Sep 2006 11:42:42 -0700 (PDT)
Message-ID: <20060929184242.18537.qmail@web56201.mail.re3.yahoo.com>
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

Hi people, 

I want to transfer all ssh requests to my firewall to
another computer in LAN. So I wrote a rule 
iptables -t nat -A PREROUTING -s any/0 -d
my_firewall_ip_address -p tcp --dport 22 -j DNAT
--to-destination 192.168.1.2:20

When I issue ssh elvir@my_firewall_ip_address I log to
firewall.

Similar rule to redirect http requests ti internal
host works fine. 
Is above possible? Does someone implemented this? 
Is only solution for this first log in to firewall and
then to host in internal network?

Regards 

Elvir Kuric

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam
protection around 
http://mail.yahoo.com 

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 


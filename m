From: CC commmunication <commdsl@yahoo.com>
Subject: iptables rule command help
Date: Tue, 30 Aug 2005 03:00:13 -0700 (PDT)
Message-ID: <20050830100014.75637.qmail@web30206.mail.mud.yahoo.com>
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

Hi
wt i want to do is just simple setup. I will be very
thankful for the help

              firewall/Gateway   
lan0---eth0-192.168.1.253/30--eth1-10.0.0.253/30-----Lan1

I want one to write the iptable rule for forwarding of
TCP traffic from Lan0 to lan1 on the server
10.0.0.254/30 port www, telnet, ssh, ftp 21,22 during
the office timeings 9 am to 5pm with syn bit set or
stateful option New, Established, Related and log the
packet field informations as well.

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 


From: tataacc<tataacc@tatanova.com>
Subject: NEWBIE with  NetFilters
Date: Sun, 23 Mar 2003 05:33:02 +0000 (UTC)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <24806.3394254588$1048397582@news.gmane.org>
Reply-To: tataacc<tataacc@tatanova.com>
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
Date: un, 23 Mar 2003	10:49:24 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org, netfilter@lists.netfilter.org

Hi Netfilter Gurus

iam newbie working with netfilters(IPTABLES) on RH 8.0
I have just started reading the Netfilter docs and iptables docs from 
http://iptables-tutorial.frozentux.net
Looks very good, i just had some of doubts by going this docs, still 
have some confusion
My setup now is

Local net----eth1(Firewall)eth0----Router--- Internet

1 )Take example i have itnernal IP ( 192.168.0.0)masquarading with 
iptables, how does the packets travel from internal IP to Internet
Where will be the NAT and Masqurade take Place ( INPUT or PREROUTING or 
POSTROUTING)
2) If i have FQDN IP, then how will the Public IP travel to Internet

here is the masquarading take Place or its just send the PACKETS, how 
will this packet travel

thanks
tataacc



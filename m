From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: Re: How to control the bandwidth
Date: Wed, 8 Dec 2004 13:15:19 -0000
Message-ID: <001501c4dd27$f9c5f660$0101a8c0@jorge>
References: <MDAEMON-F200412082053.AA5333898md50000000155@palettemm.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

i use shaperd

----- Original Message ----- 
From: "Bassam A. Al-Khaffaf" <bassam@palettemm.com>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, December 08, 2004 12:51 PM
Subject: How to control the bandwidth



Hi All,
   I have Internet sharing Linux box (Redhat 9, Kernel 2.4.27, iptables
1.2.11). All the traffic from the LAN side is MASQUERDED to the WAN side so
that everyone can get access the Internet.

My backbone bandwidth is 2 mbps, when some people on the LAN side try to use
streaming downloads or use VoIP they will reserve the bandwidth and will
deprive the others from accessing the Internet.

How can I use the iptables firewall rules to control the bandwidth??

Regards
Bassam

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.806 / Virus Database: 548 - Release Date: 12/5/2004






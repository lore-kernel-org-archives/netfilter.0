From: StarQuake <starquake@tiscali.nl>
Subject: Traffic Shaping with HTB for VPN's
Date: Mon, 17 Oct 2005 12:39:11 +0200
Message-ID: <divuts$jud$1@sea.gmane.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I have the following network config:



                     LAN A

                    Firewall
                       |
                       |
                   VPN router
                       |
                       |  (1500kb/s)
                       |
               /--------------\
               |              |
               |   Internet   |
               |              |
               \--------------/
  LAN B      /                  \       LAN C
           / (512kb/s)            \  (512kb/s)
         /                          \
     VPN router                   VPN router
      /                                \
    /                                    \
Firewall                              Firewall



1. LAN B and LAN C are browsing the internet using a proxy with 
content-filtering in LAN A
2. LAN B and LAN C connect to a Win2k server using RDP in LAN A

The traffic shaping in LAN A to the internet works perfectly. 
Downloading something and using RDP or telnet to internet works perfectly.

My question is, Can I start shaping traffic with HTB for LAN B and LAN C 
using the firewall on LAN A. Since everything going to internet passes 
the firewall on LAN A.

Right now it doesn't work right because I set the ceiling value to 1500 
which only applies to LAN A's internet connection.

I hope someone understands me and can help me :P

StarQuake

-- 
for some how-to's and rpms visit my site    : http://solid.bounceme.net
for commercially supported solutions visit  : http://www.robas.com



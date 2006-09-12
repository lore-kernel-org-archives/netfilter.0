From: "Yuriy Popyk" <fennister@gmail.com>
Subject: problems with SNAT
Date: Tue, 12 Sep 2006 12:47:56 +0300
Message-ID: <8a3f83490609120247t85facf9p3326b822fac2057f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hello


  We have a lan with ips in private range
 Problem is described with a following pic

 ----------      ----------
   |  PC2 |-----|  R2   |
   ----------      ----------
                    |
                    |
                  ----------         ----------
                  |   R1  |--------|  PC1 |
                  ----------         ----------
                      |
                  ----------
                   | ISP |
                   ----------

  R1 - router 1, linux
 R2 - router 2, ms windows 2000
  PC1 - pc 1, ms windows XP
  PC1 - pc 1, ms windows 2000

  when I'm trying to set SNAT on R1 for PC1
  # iptables -t nat -A POSTROUTING -s  $pc1 -j SNAT --to-source $ip_to_isp
 it works

  but when I'm trying to set SNAT for PC2
  # iptables -t nat -A POSTROUTING -s  $pc2 -j SNAT --to-source $ip_to_isp
 it fails

  tcpdump -nl -i $ISP_eth
  shows that R1 forwards packets from PC2 to outside world without NATing
  and in the same time packets from PC1 is NATed

 when i made
  # iptables -t filter -A FORWARD -s PC2 -j DROP
 it works, packets from PC2 is not going outside anymore

  i have tried to do SNAT with firewall rules flushed and policies set to ACCEPT
 the problem appeared again

 Thanks at advance


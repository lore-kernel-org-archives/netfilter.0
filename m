From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Bridge DNAT
Date: Thu, 21 Jul 2005 19:46:40 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507211846500.32348@yvahk01.tjqt.qr>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter User Mailing List <netfilter@lists.netfilter.org>

Hi,



I have a problem with DNAT on a bridged network. The setup is:

192.168.44.1 is the server (bridge host); interfaces on it:
  eth0 -- "the internet cloud"
  eth1 --
  eth2 --
  br0  -- Bridge interface; ports: eth1 eth2
192.168.44.2 a client on the eth1 segment
192.168.44.3 a client on the eth2 segment

Now when I try a dnat setup:
  iptables -t nat -A PREROUTING -p tcp --dport 9000 -j DNAT
    --to-dest 192.168.44.3:80

The redirection works as expected when someone from the internet<eth0> 
connects to the server.
But within the internal network, the following happens:
  .44.2 telnets to .44.1:9000
  .44.1 rewrites the destination and sends it to .44.3 (SYN)
  .44.3 replies with SYN ACK
  .44.2 replies with RST - it does not know the connection


What have I done wrong? Or is this just that the bridge code does not fully 
handle layer3 DNAT?


Jan Engelhardt
-- 


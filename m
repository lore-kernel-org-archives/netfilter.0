From: varun_saa@vsnl.net
Subject: port 80 to port 3128
Date: Thu, 16 Dec 2004 13:36:58 +0500
Message-ID: <8b9d168b968c.8b968c8b9d16@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-language: en
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,
      My server is on Mandrake 10.10ff.

eth0 is WAN with static IP connected to 512Kbps DSL.

eth1 is LAN.

Using webmin - networking - Linux firewall, I have done a NAT on eth0.

After I did NAT on eth0 I see that all clients can access straight away
the internet without any settings. Is it Ok ?

Next I would like to use packet filter and redirect all port 80
to port 3128. I have tried as follows :

accept - If protocol is TCP and input interface is eth1 and destination port is 3128  
         and source port is 80


Is it Ok ? 

Please correct me as I am a newbie to iptables.

Thanks

Varun





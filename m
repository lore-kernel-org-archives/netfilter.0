From: "cox" <cox@ieee.org>
Subject: Squid + iptables (different networks)
Date: Wed, 17 Nov 2004 13:07:11 -0200
Message-ID: <MCEJJKCAIMHFOKODABEICEDHMFAA.cox@ieee.org>
Reply-To: cox@ieee.org
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

Hi,

I've got my internal network (192.168.7.0/24, gw=192.168.7.1) and my
squid-cache server runs on my DMZ.

On my gateway I have:

iptables -t nat -A PREROUTING -s 192.168.7.0/24 -p tcp --dport 80  -j
DNAT --to <real-ip>:3128

And my squid-server was compiled with --linux-netfilter, etc.

It's working, but the log file (access.log) shows me that all connections
came from my gateway, and it's correct. I'd like to know if someone have a
way to change that, and in the logfile, and squid acl management I can
use/see my internal network ips. They are in different subnets.

regards, cox




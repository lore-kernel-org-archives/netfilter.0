From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: Squid + iptables (different networks)
Date: Thu, 18 Nov 2004 09:45:28 -0400
Message-ID: <004501c4cd74$dd0b1d10$49caa8c0@caris.priv>
References: <MCEJJKCAIMHFOKODABEICEDHMFAA.cox@ieee.org>
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
To: cox@ieee.org, netfilter@lists.netfilter.org

Get rid of your nat rule to the proxy.  Your proxy will change the IP from
your internal IP when it connects out to a webpage anyway.

Peter



----- Original Message ----- 
From: "cox" <cox@ieee.org>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, November 17, 2004 11:07 AM
Subject: Squid + iptables (different networks)


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





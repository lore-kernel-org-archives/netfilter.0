From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Debian 2.6.8/bridge/iptables/passive ftp
Date: Wed, 04 Apr 2007 19:37:04 +0200
Message-ID: <4613E240.3000608@rtij.nl>
References: <361462969@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <361462969@web.de>
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
To: spaminator@web.de
Cc: netfilter@lists.netfilter.org

spaminator@web.de wrote:
> Rebooting the bridge box left me again with an unloaded ip_conntrack_ftp. So I made an entry in /etc/modules which caters for the module to be loaded on (re)boot. Strange thing that, because other modules related to iptables are being loaded automatically, although they are not compiled into the kernel too. Are there other "surprise"-modules that have to be loaded via /etc/modules?
>   

All the ip_conntrack_* modules, so all the connection helpers. You could 
load them all, but I only load what I need.

These modules are what account for (most of the) -m state --state 
RELATED matches. Related in this case are all the data connections for 
ftp, so you don't need any rule for those data connections.

IOW to make ftp work you need:

- To load ip_conntrack_ftp
- Have a rule that allows ESTABLISHED,RELATED
- Have a rule that allows the initial SYN to port 21.


HTH,
M4



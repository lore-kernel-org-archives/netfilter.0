From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: speed connection problem
Date: Mon, 26 Jul 2004 21:41:25 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <SERVER7RQXPAhp6R47w00000001@server7.bandwidthco.com>
References: <41051990.9070208@yahoo.fr>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <41051990.9070208@yahoo.fr>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: 'stephane durieux' <durieux42@yahoo.fr>, netfilter@lists.netfilter.org

 

How can I solve this problem. Is it due to my heavy configuration ?
I am afraid it will be worse if I install DMZ servers (http, ftp, postfix,
dns)

Have you got any suggestion ?

Thanks a lot.


Here is my (heavy) configuration

This is not what I would call a heavy load Stephane. Your rig should handle
this without a blink. My netfilter/iptables firewall is also directly
connected to the internet via dsl (albeit with a static IP), with five
subnets behind it, including a DMZ with a mail relay, DNS server, web
server, squid proxy, etc, etc, blah, blah. My rule set stands at
approximately 2000 and my machine does not blink. So I suggest the slow down
might be something else. Suggestions and questions:

1. Run your firewall (temporarily of course) with no rules loaded and all
your default policies set to default so you can make some rate comparisons:

set_default_policy()
{
	$IPT -F
   	$IPT -X
	$IPT -P INPUT ACCEPT
	$IPT -P FORWARD ACCEPT
	$IPT -P OUTPUT ACCEPT
}

2. Your FTP rules need a little tuning. I can see these giving you some
problems with your ftp communication. Are you using ip_conntrack_ftp?

3. I notice you seem to favor source port 1024 on you output rules. I find
this a little hard to understand. Is there a reason for this?





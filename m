From: Sergio Basurto Juarez <sbasurtoj@yahoo.com>
Subject: Re: block ssh and ping
Date: Tue, 8 Feb 2005 07:17:19 -0800 (PST)
Message-ID: <20050208151719.31684.qmail@web41606.mail.yahoo.com>
References: <5e36ca5e45b4.5e45b45e36ca@vsnl.net>
Mime-Version: 1.0
In-Reply-To: <5e36ca5e45b4.5e45b45e36ca@vsnl.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


--- varun_saa@vsnl.net wrote:

> Hello,
>       My server is Mandrake 10.1
> eth0 is WAN with static IP connected to 512k DSL
> eth1 is LAN.
> 
> 1. I would like to block ping to my external static
> IP
> 
> 2. I would like to block ssh to my external static
> IP
> 
> Howto to do that ?
> 
> Thanks
> 
> Varun
> 
This is easy to block

$UNIVERSE=0.0.0.0/0
$EXTIP=[whatever external ip you have]

iptables -A INPUT -p tcp -s $UNIVERSE -d $EXTIP
--dport 22 -j REJECT
iptables -A INPUT -p ICMP -s $UNIVERSE -d $EXTIP -j
REJECT

Also check the documentation for iptables, there is a
predefine firewall and for me works ok, nevertheless I
should modify it to fit my needs.


Regards.


=====
-- 
Sergio Basurto J.

If I have seen further it is by standing on the 
shoulders of giants. (Isaac Newton)
--


		
__________________________________ 
Do you Yahoo!? 
Yahoo! Mail - 250MB free storage. Do more. Manage less. 
http://info.mail.yahoo.com/mail_250


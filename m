From: Frank Gruellich <frank@der-frank.org>
Subject: Re: Blocking Netranges Based on IP-to-Country CSV
Date: Thu, 16 Sep 2004 02:54:00 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040916005400.GO12986@der-frank.org>
References: <1095291700.2828.3.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1095291700.2828.3.camel@localhost.localdomain>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,

* Gary & Mic McFall <nutbrownhares@tds.net> 15. Sep 04:
> To be proactive, we want to automate that process via iptables & the
> CSV available at <http://ip-to-country.webhosting.info>.

I am very suspicious to configure packet filters with external
(untrusted) data.

> We have created a C program (IPCheck) in the /bin directory

Maybe it should go to /usr/local/bin/... anyway.

> We want to process the packet based on that return.

Make it to return 0 for bad and !0 for 'good' IP#s.

> I'm a relative newbie with iptables & scripts.

<URL:http://iptables-tutorial.frozentux.net/iptables-tutorial.html>

> Listed below is some very crude code,

Aah... yes.

> Any suggestions on how to shore this up so that it will work?

# You need to create the userdefined chain bevor using it:
$IPT -N INBADIPS

> #    ***** DROP BAD IPS *****
> /bin/IPCheck `grep -w "SRC =" | cut -d = -f 2`

# What are you going to use as input?  This grep needs a source to
# parse.  Will it result in a list of IP#s?  I assume a single $IP.

> if return = "Bad IP"
> $IPT -A INPUT -$ETH0 $RATELIMIT -j INBADIPS

# This will not work. Use:
if /usr/local/bin/IPCheck $IP
then
	$IPT -A INPUT -i eth0 -s $IP -j INBADIPS
fi
# What do you mean with $RATELIMIT?  Are you looking for
# <URL:http://iptables-tutorial.frozentux.net/iptables-tutorial.html#TABLE.LIMITMATCH>?

>       ***** RULES - DROP  BAD IPS *****
> #    ***** REVIEW LOG AT /var/log/iptables.log *****
> $IPT -A  INBADIPS -j LOG --log-level debug --log-prefix "BADIP:  " -j DROP

# You can't have to targets in a rule.  Split it:
$IPT -A INBADIPS -j LOG --log-level debug --log-prefix="BADIP: "
$IPT -A INBADIPS -j DROP

Some questions you should ask yourself:
 + Is this a gateway?  Should it go to FORWARD?
 + Will IP#s stay for ever at blacklist?  How and when to remove them?
 + Is this really what you want?

Hope I understood you,
 regards, Frank.
-- 
Sigmentation fault


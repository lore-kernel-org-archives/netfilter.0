From: Philip Craig <philipc@snapgear.com>
Subject: Re: raw table and NOTRACK target
Date: Fri, 26 Jun 2009 17:53:45 +1000
Message-ID: <4A447E89.7020700@snapgear.com>
References: <20090625130555.GB9856@openoffice.lt> <1246000121.3985.5.camel@casper.meteor.dp.ua> <20090626074317.GA11753@openoffice.lt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090626074317.GA11753@openoffice.lt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ramunas Vabolis <ramuva@openoffice.lt>
Cc: netfilter@vger.kernel.org

Ramunas Vabolis wrote:
> running lynx http://any.host.com from real.ip
> 
> running tcpdump on inner interface:
> tcpdump -i ethlocal -n host real.ip and port 80 
> 
> does show connection attempts while 
> tcpdump -i ethoutside -n host real.ip and port 80 
> is silent.
> 
> iptables -t raw -vxnL shows that first rule is hit couple times, the
> second rule is never hit.

Then the problem is not in the raw table.  Something else is dropping
the first syn packet after it has been through the raw table.
You should see an outgoing syn packet before you start worrying
about the second rule being hit.


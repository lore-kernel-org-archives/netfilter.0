From: Frank Gruellich <frank@home.manuelm.org>
Subject: Re: 2 WAN port,, 1 LAN port on one machine
Date: Thu, 26 Feb 2004 15:22:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040226142243.GL844@home.manuelm.org>
References: <3100.202.171.14.2.1077798799.squirrel@jkt.pearlenergy.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3100.202.171.14.2.1077798799.squirrel@jkt.pearlenergy.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

* -iYung- <iyung@ibs.ath.cx> 26. Feb 04:
> a. 172.16.30.0/24
> b. 172.16.40.0/24
> c. 159.163.123.0/24
> 
> What i wanted to do is, I would like to have 2 WAN port and 1 LAN port.
> 
>              -----------
>             |           |---eth0 (a.a.a.a)
>     eth1 ---|           |
>             |           |---eth1 (b.b.b.b)
>              -----------
> 
> all segments connected to one router, and the router will route everthing
> to 0.0.0.0/0.0.0.0 to eth1 (c.c.c.c)
> 
> My question is, was it possible if:
> 
> a. all internet traffic request coming from segment 172.16.30.0/24 and
> 159.163.123.0/24 will go out from eth0

First, this ist not the matter of netfilter.  Second, I don't understand
this: you want to send requests from .30.0/24 back to .30.0/24 (eth0)?
Why?  AFAICS this is very foolish and will break you network.  Anyway:

# ip rule add from 172.16.30.0/24 table 100
# ip rule add from 159.163.123.0/24 table 100
# ip route add default dev eth0 table 100
# ip route flush cache

should do the trick.

> b. all internet traffic request coming from segment 172.16.40.0/24 will go
> out from eth1

The same way:

# ip rule add from 172.16.40.0/24 table 101
# ip route add defalut dev eth1 table 101
# ip route flush cache

<URL:http://www.tldp.org/HOWTO/Adv-Routing-HOWTO/index.html>

HTH,
 regards, Frank.
-- 
Sigmentation fault


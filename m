From: Tomasz Wrona <lartc@eter.tym.pl>
Subject: Re: fwmarks
Date: Sun, 2 Mar 2003 00:13:37 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.30.0303020011020.24077-100000@king.klan.gda.pl>
References: <1046551463.804.39.camel@debian>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1046551463.804.39.camel@debian>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Esteban <eribicic@sinectis.com>
Cc: netfilter@lists.netfilter.org

On 1 Mar 2003, Esteban wrote:

> and then
> echo 201 www.out >> /etc/iproute2/rt_tables
> ip rule add fwmark 2 table www.out
> ip route add default gw via 1.1.1.1 dev ppp0
> ip route flush cache
>
> and does not work!.
> if i create a rule like
> ip rule add to 2.2.2.2 table www.out
> ip route flush cache
>
> that does work!..

Set [I guess location but key is to turn of rpfilter when using
policyrouting via fwmark]:
echo "0" > /proc/sys/net/ipv4/conf/ppp0/rp_filter

Regards
tw
-- 

----------------
 ck.eter.tym.pl

"Never let shooling disturb Your education"



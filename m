From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DNAT NOT WORKING
Date: Wed, 24 Dec 2003 10:33:46 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312241033.46912.Antony@Soft-Solutions.co.uk>
References: <20031224102405.67307.qmail@web10105.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031224102405.67307.qmail@web10105.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

On Wednesday 24 December 2003 10:24 am, madhav bhasin wrote:

> Hi,
>
> 	I installed latest vesion of iptables and pom from
> www.netfilter.org . They were installed and kernel was
> compiled sucessfully. all modules are loading
> properly. I just added three rules in nat table
> prerouting chain .and i am getting same error
> iptables: Invalid argument 3 times.
> rules are as follows
>
> $IT -t nat -A PREROUTING -p TCP -i $INET_IFACE -d
> &INET_HTTP  --dport 80 -j DNAT --to $DMZ_HTTP
>
> $IT -t nat -A PREROUTING -p TCP -i $INET_IFACE -d
> &INET_DNS  --dport 53 -j DNAT --to-destinaion $DMZ_DNS
> $IT -t nat -A PREROUTING -p UDP -i $INET_IFACE -d
> &INET_DNS  --dport 53 -j DNAT --to-destinaion $DMZ_DNS

Try changing & to $ in the above rules :)

Antony.

-- 
In Heaven, the police are British, the chefs are Italian, the beer is Belgian, 
the mechanics are German, the lovers are French, the entertainment is 
American, and everything is organised by the Swiss.

In Hell, the police are German, the chefs are British, the beer is American, 
the mechanics are French, the lovers are Swiss, the entertainment is Belgian, 
and everything is organised by the Italians.

                                                     Please reply to the list;
                                                           please don't CC me.



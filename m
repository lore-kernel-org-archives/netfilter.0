From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables acting as a TCP proxy
Date: Mon, 15 Mar 2004 11:28:20 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403151128.20474.Antony@Soft-Solutions.co.uk>
References: <1079349033.10231.14.camel@gdh.walshsimmons.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1079349033.10231.14.camel@gdh.walshsimmons.co.uk>
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

On Monday 15 March 2004 11:10 am, Gavin Hamill wrote:

> Basically, we're moving a webserver from hosting in-house to a data
> centre, so whilst the DNS is propogating, I'd like to use our firewall
> to proxy port 80 requests destined for the now-defunct old IP, to the
> new external IP.
>
> I know this means wasting a lot of bandwidth, but there should be plenty
> left over once the webserver is no longer in the building.
>
> I seem to remember the solution was a pair of rules using the mangle
> table and SNAT / DNAT, but try as I might, I can't find it with Google.
>
> Can anyone help?

iptables -A PREROUTING -p tcp --dport 80 -d old.ip.add.ress -j DNAT --to 
new.ip.add.ress
iptables -A FORWARD -p tcp --dport 80 -d new.ip.add.ress -j ACCEPT
iptables -A POSTROUTING -p tcp --dport 80 -d new.ip.add.ress -j SNAT --to 
my.ip.add.ress

Where old.ip.add.ress is the old IP, routed towards the machine running these 
rules, new.ip.add.ress is the new IP, somewhere out in the Internet, and 
my.ip.add.ress is the address of the Firewall itself.

What these rules mean is:
1. Anything sent to the old address should go to the new address instead.
2. Make sure it gets there through the FORWARD chain.
3. Set the source address to be this machine so the replies come back this way 
and get reverse-natted.

Note that whilst you are using this rule, all accesses to the remote webserver 
will appear to come from your firewall (you can't tell where the real clients 
are), but since this is only a temporary arrangement I guess you're happy 
with that.

Regards,

Antony.

-- 
There are two possible outcomes:

 If the result confirms the hypothesis, then you've made a measurement.
 If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi

                                                     Please reply to the list;
                                                           please don't CC me.



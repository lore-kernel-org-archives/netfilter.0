From: Frank Gruellich <frank@home.manuelm.org>
Subject: Re: Filtering multiple networks
Date: Mon, 31 May 2004 12:08:04 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040531100803.GZ26731@home.manuelm.org>
References: <E1BUjWm-0005kj-GQ@vishnu.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <E1BUjWm-0005kj-GQ@vishnu.netfilter.org>
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
To: netfilter <netfilter@lists.netfilter.org>

* Markus Zeilinger <mz@sea.uni-linz.ac.at> 31. May 04:
> Hi all,

Hello,

> sorry if this is a stupid question, I am just a newbie with iptables.

Okay.

> Now I would like to drop

Drop is considered to be bad.  Maybe you should prefer REJECT.

> all packets coming on the Internet interface on the firewall with
> source address out of the private IP address ranges (10.0.0.0/8,
> 192.168.0.0/16, 172.16.0.0/12 and 169.254.0.0/16).

You have to split it.

> I use the following syntax in my script:
> 
> ...
> WAN_IFACE="eth0"
> PRIV_IP="10.0.0.0/8,192.168.0.0/16,172.16.0.0/12,169.254.0.0/16"

PRIV_IP="10.0.0.0/8 192.168.0.0/16 172.16.0.0/12 169.254.0.0/16"

> iptables -A INPUT -i $WAN_IFACE -s $PRIV_IP -j DROP

Well, INPUT isn't very appropriated, but:

for ip in $PRIV_IP; do iptables -A INPUT -i $WAN_IFACE -s $ip -j DROP; done

Maybe you should have something like this in your FORWARD, too.

HTH,
 regards, Frank.
-- 
Sigmentation fault


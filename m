From: "Markus Zeilinger" <mz@sea.uni-linz.ac.at>
Subject: FW: Filtering multiple networks
Date: Mon, 31 May 2004 12:32:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1BUk4b-0006Wv-Cf@vishnu.netfilter.org>
Reply-To: <mz@sea.uni-linz.ac.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter <netfilter@lists.netfilter.org>

Hi Frank,

thx for you prompt answer! Two questions on your comments:

- Thy is DROP bad here? As I see REJECT would send an error message back to
the source, but this would not make any sense on packets coming on the WAN
interface with private IP addresses, or am I wrong?

- Why is INPUT not appropriated here? Should I do the dropping earlier
perhaps in the mangle table?

And yes I will do something similiar in the FORWARD chain :-)

Thx again!

Cheers,
Markus

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Frank Gruellich
Sent: Monday, May 31, 2004 12:08 PM
To: netfilter
Subject: Re: Filtering multiple networks

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



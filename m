From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: Default policy
Date: Sat, 21 Dec 2002 14:28:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GOEDLKDBKHLHGAKAGFGKMELBLLAA.rsterenborg@xs4all.nl>
References: <001501c2a8f3$40be2e40$1a01a8c0@vishal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001501c2a8f3$40be2e40$1a01a8c0@vishal>
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
To: iptables <netfilter@lists.netfilter.org>

> Following is the policy that my firewall generation script
> gives, but my system hangs when i execute this, I am using
> ssh to execute this script. I am opening all other required
> ports. When I comment the last two lines my script works fine.
>
> ******Script*******
>
> #Set default policies to DROP
>
> $IPTABLES -F INPUT
> $IPTABLES -F OUTPUT
> $IPTABLES -F FORWARD
> $IPTABLES -P INPUT DROP
> $IPTABLES -P OUTPUT DROP
> $IPTABLES -P FORWARD DROP
>

This ok.
This will drop everything you didn't ACCEPT or REJECT or something.

> # Rejecting all Packets
>
> #$IPTABLES -A INPUT -s 0/0 -d 0/0 -p udp -j DROP
> #$IPTABLES -A INPUT -s 0/0 -d 0/0 -p tcp -j DROP

If you have this in front of the other rules, nothing will reach the
other rules and you just killed (not only) your ssh connection. Not
even on lo (127.0.0.1).
You already have default policy DROP : just put in the ACCEPT and
other rules you need.


Rob



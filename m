From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: limiting ssh access to router/firewall
Date: Thu, 8 Sep 2005 14:59:04 +0200 (CEST)
Message-ID: <61724.193.173.147.3.1126184344.squirrel@193.173.147.3>
References: <200509080850.39611.glenn@webcat.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200509080850.39611.glenn@webcat.no>
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
To: netfilter@lists.netfilter.org

> Hi,
> Im having problems with limiting ssh access to my router, it acts like =
a
> router and a firewall, and i need only my office ip able to connect to =
the
> router.
> All my other rules works just fine(FORWARD).. im probarly just got the
> INPUT
> command messed up..
>
> This is some of my firewall script.
>
> iptables -F
> iptables -X
> iptables -Z
>
> iptables -P INPUT ACCEPT
> iptables -P OUTPUT ACCEPT
> iptables -P FORWARD DROP
>
> iptables -A INPUT -i lo -p all -j ACCEPT
> iptables -A OUTPUT -o lo -p all -j ACCEPT

The policy for both chains is already ACCEPT. Why do it again ?

> # SSH access router
> iptables -A INPUT -i eth0 -s ! "my office ip" -d "router ip"
> -p tcp --dport 22 -j DROP

Try this :


# This drops anything you don't allow.
$IPT -P INPUT DROP

# You want to allow RELATED and ESTABLISHED packets.
$IPT -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# You want to allow the initial ssh connection (the rest
# is handled by the previous rule).
$IPT -A INPUT -m state --state NEW -i eth0 -s <office_ip> \
  -d <router_ip> -p tcp --dport 22 -j ACCEPT


This should do what you want and is clearer I think.


Gr,
Rob




From: rob@sterenborg.info
Subject: Re: LAN Proxy - iptables gateway
Date: Fri, 10 Sep 2004 11:52:00 +0200 (CEST)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <14251.145.7.91.126.1094809920.squirrel@145.7.91.126>
References: <20040910053625.B167137CD@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040910053625.B167137CD@sterenborg.info>
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
To: netfilter@lists.netfilter.org

> I have a local LAN (10.35.50.0/24) which is connected to my linux
> firewall/gateway running iptables for internet access using an
> internet
> link. My LAN is connected to other subnets using a leased line.
>
> I had to add a few routes in my linux gateway (running iptables) to
> enable my LAN clients to access servers in other subnets and
> networks which are in the range of 10.0.0.0/8 and 97.0.0.0/8.
>
> Everything seems to be working fine. But recently I found that one
> of my LAN clients is running an Analog proxy. Few users sitting in
> other networks are using this proxy and able to access internet.

Can't you uninstall this proxy ?? IMHO users shouldn't have a proxy
installed.

> My firewall is configured to allow traffic to internet from LAN only
> (10.35.50.0/24). As the proxy is inside this network, firewall allows
> the traffic.
>
> How do I stop this? I don't want users in other network to access
> internet
> through my iptables. Please help me. Thanks in advance.

I'm assuming you are using multiple interfaces to connect these 2
networks. (Do you have more remote networks ?)

So, you have to find out on which port the proxy is listening and
block access for traffic from the remote network to that port on your
local network.
This is not an ideal situation, because the portnumber can likely be
changed on the proxy and your solution to the problem will then be
rendered useless : the best way is to have the proxy uninstalled and
make sure they cannot install it again.

Lets say the proxy is listening on ports 3128/tcp or 8080/tcp as these
are quite common.

# "default" settings
iptables -P FORWARD DROP
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

# block remote access to proxy
iptables -A FORWARD -i <if_remote_lan> -o <if_local_lan> -d
10.35.50.0/24 -p tcp --dport 3128,8080 -j DROP

# accept local access to internet
iptables -A FORWARD -i <if_local_lan> -o <if_inet> -s 10.35.50.0/24 -j
ACCEPT


Gr,
Rob




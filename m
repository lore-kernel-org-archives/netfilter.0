From: Jason Opperisano <opie@817west.com>
Subject: Re: advanced routing with iptables
Date: Wed, 25 May 2005 08:29:56 -0400
Message-ID: <20050525122956.GA16644@bender.817west.com>
References: <20050525114039.GA5238@www.wegener-net.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050525114039.GA5238@www.wegener-net.de>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, May 25, 2005 at 01:40:39PM +0200, Norbert Wegener wrote:
> Hello,
> I have a linux gateway with two network cards.
> The default route is set via eth0.
> When an http request from an arbitrary ipaddres arrives on eth1, the gateway sends the answer out to eth0, as expected.
> Is it possible to mark those incoming http requests via iptables or other tools in a way, that the answer gets out via eth1?

one time:
  echo alt01 >> /etc/iproute2/rt_tables

scripted:

  ip route add default via $ETH1_GW_IP dev eth1 table alt01
  ip rule add fwmark 1 table alt01

  iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark
  iptables -t mangle -A PREROUTING -i eth1 -m state --state NEW \
    -j MARK --set-mark 1
  iptables -t mangle -A PREROUTING -j CONNMARK --save-mark

-j

--
"Peter: Oh, you people can kiss the fattest part of my ass."
        --Family Guy


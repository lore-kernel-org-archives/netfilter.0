From: Ciaran Deignan <ciaran.deignan@netcelo.com>
Subject: Re: snat and ICMP question
Date: Thu, 03 Oct 2002 14:36:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D9C39D8.6D1EBD2C@netcelo.com>
References: <3D9C1A07.B4A0C23C@netcelo.com>
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
To: netfilter@lists.netfilter.org, Matthieu Marc <matthieu.marc@netcelo.com>


Hi again,

> I'm using iptables v1.2.5. I've noticed that there is
> a DNAT / ICMP correction in 1.2.7a. I'm going to download
> and test this new version, but I suspect that the behaviour
> will be the same.

I tried with the latest version, but there is no difference.

I still can't see any way of configuring iptables to do
what I need. Even if the original source address was
known, how could I specifically tell iptables to mangle
the address inside the ICMP packet? Maybe its a bug?

Thanks for any advice,
Ciaran

-- 
+---------------------------------------------------------+
Ciaran Deignan                              04 38 49 87 27

Netcelo SA - IPsec VPN Solutions    http://www.netcelo.com/
18-20 rue Henri Barbusse - BP 2501, 38035 Grenoble Cedex 2
+---------------------------------------------------------+


From: alucard@kanux.com
Subject: Re: forwarding
Date: Tue, 18 May 2004 10:49:20 -0400 (VET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <34002.200.44.170.105.1084891760.squirrel@200.44.170.105>
References: <33934.200.44.170.105.1084890127.squirrel@200.44.170.105>
    <1084891180.6410.18.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1084891180.6410.18.camel@localhost>
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


> [JAS - isn't the packet coming in on 10.73.219.156? In other words, your
> NAT rule should be:
> iptables -t nat -A PREREOUTING -d 10.73.219.156 -p 6 --dport 8080 -j
> DNAT --to-destination 192.168.0.2:80]

-p 6? I've never seen this before, what is that rule trying to do?

Thnax for your help pal

Juan


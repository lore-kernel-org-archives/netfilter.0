From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: forwarding
Date: Tue, 18 May 2004 15:56:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405181556.15769.Antony@Soft-Solutions.co.uk>
References: <33934.200.44.170.105.1084890127.squirrel@200.44.170.105> <1084891180.6410.18.camel@localhost> <34002.200.44.170.105.1084891760.squirrel@200.44.170.105>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <34002.200.44.170.105.1084891760.squirrel@200.44.170.105>
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

On Tuesday 18 May 2004 3:49 pm, alucard@kanux.com wrote:

> > [JAS - isn't the packet coming in on 10.73.219.156? In other words, your
> > NAT rule should be:
> > iptables -t nat -A PREREOUTING -d 10.73.219.156 -p 6 --dport 8080 -j
> > DNAT --to-destination 192.168.0.2:80]
>
> -p 6? I've never seen this before, what is that rule trying to do?

It's a slightly unconventional way to specify TCP :)

Protocols have numbers (after all, *everything* has numbers when a computer 
gets involved...), and TCP happens to be protocol number 6; UDP is protocol 
number 17, and ICMP is protocol number 1.

See /etc/protocols on your own machine for more examples.

Regards,

Antony.

-- 
There are two possible outcomes:

 If the result confirms the hypothesis, then you've made a measurement.
 If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi

                                                     Please reply to the list;
                                                           please don't CC me.



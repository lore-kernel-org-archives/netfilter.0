From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: traceroute
Date: Wed, 30 Jun 2004 23:39:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406302339.02075.Antony@Soft-Solutions.co.uk>
References: <00df01c45ea2$f5dc1290$49caa8c0@caris.priv> <200406302252.10870.Antony@Soft-Solutions.co.uk> <40E34062.90505@web.de>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40E34062.90505@web.de>
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

On Wednesday 30 June 2004 11:36 pm, Florian Boelstler wrote:

> Hi,
>
> Antony Stone wrote:
> > Tell us how you handle NEW packets leaving the machine.
>
> Well, I just realized by looking at your reply that I only have set:
>
> $IPTABLES -A OUTPUT -p ICMP --icmp-type echo-request -j ACCEPT
>
> Which of the icmp-type displayed "iptables -p icmp -h" do I need to make
> traceroute work?
>
> By looking at other posts in this thread I've learned that traceroutes
> are done with echo-requests. Is this true for Linux 2.6.6 ?

No, that's true for Windows systems.   Unix machines (Linux included) uses 
high-port numbered UDP packets.

Therefore you need to allow UDP packets to leave your machine for you to be 
able to run traceroute from it.

Regards,

Antony.

-- 
There's no such thing as bad weather - only the wrong clothes.

 - Billy Connolly

                                                     Please reply to the list;
                                                           please don't CC me.



From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: PPTP connection tracking and Poptop on same box
Date: Sun, 18 Jan 2004 23:38:36 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401182338.36334.Antony@Soft-Solutions.co.uk>
References: <739652C2AFA4834AAB5986A215F68CEC4976@svr1.home.compsup.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <739652C2AFA4834AAB5986A215F68CEC4976@svr1.home.compsup.net>
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

On Sunday 18 January 2004 11:00 pm, Carl Farrington wrote:

> Does anybody know if there is a workaround for this problem? As soon as
> I insmod ip_nat_pptp , poptop cannot accept any incoming pptp
> connections.

Why do you want to use both of these on the same box?

ip_nat_pptp is only needed for PPTP connections being routed *through* the 
machine.

poptop is only needed for PPTP connections terminating *on* the machine.

I can quite easily imagine that these two functions would not work together, 
because of the unhelpful way in which PPTP embeds IP addresses inside the 
protocol.   If you load ip_nat_pptp then the packets are going to get mangled 
(correctly for routing, but not for terminating here), and if you don't load 
it then you can't route across a NATted connection (but you can run PPTP on 
the box itself).

Seems to me like you need to choose whether you're routing or terminating the 
PPTP connections, and use the correct solution for whichever it is.

Antony.

-- 
I'm pink, therefore I'm Spam.

                                                     Please reply to the list;
                                                           please don't CC me.



From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Masqureading issues... packets go over wrong link
Date: Fri, 13 Aug 2004 17:51:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408131751.15880.Antony@Soft-Solutions.co.uk>
References: <200408131642.i7DGgUwE021467@webmail2.magma.ca>
Reply-To: Netfilter mailing list <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408131642.i7DGgUwE021467@webmail2.magma.ca>
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
To: Netfilter mailing list <netfilter@lists.netfilter.org>

On Friday 13 August 2004 5:42 pm, dravya wrote:

> Hello all,
>
> I have a system setup with two phones/interfaces (ppp0 and ppp1). I access
> the internet via these two interfaces only.
>
> I have the following rules in my iptables:
>
> iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
> iptables -t nat -A POSTROUTING -o ppp1 -j MASQUERADE
>
> and yet when a machine on my network uses my machine as the gateway to ping
> outside, packets travel on the wrong link causing change of ip address of
> the phones. I have tested this using ethereal and it clearly shows a ppp0
> packet (src add of ppp0) outgoing on ppp1, as I was capturing on ppp1.
> Also, iptables is masquerading as it shows the number of packets it
> masqueraded.

I agree with you that the above rules ought to ensure that packets going out 
of each interface have the appropriate source address.

What does your routing table look like (presumably you are using iproute2 to 
balance traffic, or route based on source etc, to share the two links)?

Antony.

-- 
I think, therefore I am.
I'm pink, therefore I'm Spam.
I drink, therefore I think I am.

                                                     Please reply to the list;
                                                           please don't CC me.



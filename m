From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Help: Iptables rules
Date: Thu, 15 Jan 2004 01:24:58 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401150124.58475.Antony@Soft-Solutions.co.uk>
References: <OF22A0643A.09EB3DB8-ON88256E1C.00058296-88256E1C.0005DD77@statsus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OF22A0643A.09EB3DB8-ON88256E1C.00058296-88256E1C.0005DD77@statsus.com>
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

On Thursday 15 January 2004 1:04 am, Minh Cao wrote:

> Hi,
>
> I am new to iptables.
> Please help me to create a rules, which allows everything in and out both
> interfaces.

I wonder why you want this - because it is an open router - there is no point 
in using netfilter (which is used to block things) if you want to allow 
everything....

> What I have but not worked:
> iptables -A FORWARD -i $EXTIF -o $INTIF -j ACCEPT
> iptables -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
>
> iptables -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

What you have shown above looks as though it will do what you want (it is, of 
course just a router, very insecure, and does not qualify as a firewall, but 
it meets your specification).

Some questions:

1. Do you have packet forwarding turned on in the kernel (cat 
/proc/sys/net/ipv4/ip_forward)?

2. What are the default policies on your netfilter chains (iptables -L)?

3. You say the above has not worked - how have you tested it?

4. Do packets get across the router in either direction (internal to external? 
external to internal)?

5. Have you read Oskar Andreasson's netfilter tutorial at 
http://iptables-tutorial.frozentux.net, referenced on the netfilter home page 
http://www.netfilter.org/documentation/index.html#documentation-tutorials?

6. Did the machine work as a simple router before you tried adding netfilter 
rules?

Regards,

Antony.

-- 
Software development can be quick, high quality, or low cost.

The customer gets to pick any two out of three.

                                                     Please reply to the list;
                                                           please don't CC me.



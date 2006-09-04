From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: matching -d to a given interface without specifying ip address
Date: Mon, 4 Sep 2006 07:05:39 +0200
Message-ID: <009601c6cfdf$c4406910$0101000a@tanjian>
References: <44FA068C.1000202@nth.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44FA068C.1000202@nth.ca>
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

> Hello,
> 
> Is there a way to define a condition "those packets whose destination
> is the IP address of the given interface" without specifying the
> actual IP address? (it changes, thus needs to be detected and updated)

No. -d expects an IP address.

> I want to be able to distinguish those packets addressed to
> the box, to be forwarded, from those just passing through it. (-i
> matches both)

Netfilter either does DNAT or not.

Let's take http traffic as an example.
A packet arrives at the external NIC on port 80/tcp of the firewall. If
there is a DNAT rule that matches, the packets gets a new destination IP
and enters the FORWARD chain. If there's no rule that matches, it enters
the INPUT chain.

So you cannot, for example, distinguish http traffic arriving on port
80/tcp for the local box from http traffic also arriving on port 80/tcp
for your DMZ/LAN (if the firewall has only 1 external IP address).
To distinguish that traffic, you'd need to look at the http hostheader
to decide if you should forward it to the local webserver or the
webserver in your LAN/DMZ. Netfilter cannot do that.

What is it exactly what you want to accomplish?

> Such packets can be discovered in the INPUT chains, after the "routing
> decision", but by then it's too late to do DNAT.

I don't understand how you would be able to discover such packets in the
INPUT chain, because when they're there then those packets are already
accepted for your local box. But I could be wrong.



Gr,
Rob



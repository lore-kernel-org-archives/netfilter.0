From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SRC and DST
Date: Sat, 31 Jul 2004 09:01:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407310901.12827.Antony@Soft-Solutions.co.uk>
References: <20040731074242.71441.qmail@web25207.mail.ukl.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040731074242.71441.qmail@web25207.mail.ukl.yahoo.com>
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

On Saturday 31 July 2004 8:42 am, dee3lmo wrote:

> Hello,
>
> I'm quite new to netfilter and I'm using iptables for a short time and till
> now I'm loving it. But I have a question about the SRC and DST addresses.
>
> I know you can filter on the source and destination addresses. On my box I
> receive a packet with the following addresses: SRC=62.234.65.26
> DST=62.234.111.0
>
> The strange thing is that both the addresses are not mine! I always thought
> that either the SRC or DST address must be the IP of my box or am I missing
> something.

Imagine the following setup:

You are sitting at home with your computer connected to your ISP.
Your ISP is running a firewall to protect you and all its customers from nasty 
things on the Internet.
You connect to a website, through your connection to the ISP.

Then the ISPs firewall system sees a packet where the source address = your 
computer; destination address = remote web server; neither of these = ISPs 
firewall.

Similarly the reply packet comes back from the web server: source address = 
remote web server; destination address = your computer; neither of these = 
firewall.

> An other strange thing is that the DST ip address is a network
> address?

How do you know that?   Just because it ends in .0?   That is not necessarily 
a rule for a network address.

For example, if you have a small 8-IP address block range from the DSL 
provider, the network address might be a.b.c.24, usable addresses a.b.c.25 to 
a.b.c.30, broadcast address a.b.c.31

Similarly a big organisation with a full Class B range might have a network 
address a.b.0.0, usable addresses a.b.0.1 to a.b.255.254, broadcast address 
a.b.255.255.   The usable range includes a.b.5.0 and a.b.100.0 for example, 
as well as a.b.5.255 and other things whcih might look at first glance like 
netowkr or broadcast addresses, but aren't.

The onyl way to know whether an address is a network address or a broadcast 
address is to know the netmask, and that is inaccessible to all machines 
except the ones on the local destination subnet.

> Isn't this quite strange? A network address is not a computer so
> how to know where package is send to?

Once you start playing with firewalls you will see quite a lot of packets 
which can never get to a sensible destination - it's surprising what is out 
there on a network when you really start looking.

Therefore it's possible that the above address *is* a network address - but 
that doesn't stop somebody using it as the destination IP of a packet if they 
want to.

Hope this helps,

Regards,

Antony.

-- 
If at first you don't succeed, destroy all the evidence that you tried.

                                                     Please reply to the list;
                                                           please don't CC me.



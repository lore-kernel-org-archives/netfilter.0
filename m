From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Is Linux based Gateway/Firewall feasible
Date: Thu, 8 Jul 2004 13:55:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407081355.12309.Antony@Soft-Solutions.co.uk>
References: <40ED39B9.30608@svw.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40ED39B9.30608@svw.com>
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

On Thursday 08 July 2004 1:10 pm, Sudheer Divakaran wrote:

> Hi,
>
> I've a local LAN consisting of about 150 machines.  I'm using a machine
> with Linux + IPTables  as the gateway machine which inturn connects to
> two different ISPs.  My question is can a Linux based machine match the
> performance of a hardware based routers provided by Cisco,... OR is my
> decision to go for a Linux based solution is a wrong one?

Are we talking about routing performance, or firewall capabilities here?

Cisco is well known as a high-cost supplier of router hardware, which (at the 
highest costs) is very high performance.

Netfilter is a high-reliability, high-security and flexible firewall solution 
(with zero cost for the software, but non-zero cost for the hardware and the 
configuration expertise).

150 machines is not many - however the important question is how much traffic 
they generate through the firewall.

> Is there so much difference between these two solutions?

There are many differences - cost, performance, flexibility, support, bug 
fixes, warranty, brand-name....

You have to decide which of these you want, and which you don't, before the 
choice becomes clear.

I would say, if you want a firewall with low cost, good performance, high 
flexibility, widespread technical support, rapid bug fixes, no warranty, and 
the "netfilter / Linux" brand name, then choose netfilter.

If you want a high cost router, especially for very high performance (or 
medium cost for surprisingly low performance), less flexibility, single-point 
support, slower bug-fixes, hardware warranty, and the "Cisco" brand name, 
then choose Cisco.

> Can I achieve the same performance using a high end PC and Linux?

Same as what?

> I'm asking this because one guy told me that my decision to go for a
> Linux based solution is a wrong one and it can never match the
> performance of hardware based Routers.

Well, what do you want to do with it?   Do you have an Internet connection 
faster than 100 Mbps?   If not, then Linux / netfilter will easily do what 
you want.   If yes, then you will need to pay a fair amount of money for the 
hardware to run Linux / netfilter on, but you can still do it (and I'll bet 
the cost of the hardware is still less than the equivalent system from 
Cisco).

So, you can point at a $50k Cisco fireweall / router and say "your P4 Linux 
box with 512Mbytes RAM can't do what that can do", and you'd be right.

However, you can point at a $1k or $2k P4 Linux box with 512Mbytes RAM and say 
"this can outperform your Cisco PIX 501".

The important question is always "what do you want to do with it?", and the 
next question is "what features are important to you (technical and 
non-technical)?"

Also, if you're interested in security, check the warranties / guarantees / 
promises made about the security of any products from a commercial vendor - 
you might be surprised at how little they differ from netfilter (which 
doesn't have a warranty or guarantee).

Hope this helps,

Antony.

-- 
Bill Gates has personally assured the Spanish Academy that he will never allow 
the upside-down question mark to disappear from Microsoft word-processing 
programs, which must be reassuring for millions of Spanish-speaking people, 
though just a piddling afterthought as far as he's concerned.

 - Lynne Truss, "Eats, Shoots and Leaves"

                                                     Please reply to the list;
                                                           please don't CC me.



From: "Gerry Weaver" <gerryw@objectivedomain.com>
Subject: RE: iptables bridge filter question
Date: Thu, 18 Mar 2004 17:09:32 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <ILECICAFAJIIMPBBLMEAGELNCPAA.gerryw@objectivedomain.com>
References: <200403182040.03659.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403182040.03659.Antony@Soft-Solutions.co.uk>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

Hi,

I understand what your suggesting. Perhaps I still didn't explain well
enough. Here's an example:

[NodeA 10.10.10.1]<==>[Firewall 10.10.10.2]<==>[Router 10.10.10.254]

If the router is setup as the default gateway for NodeA then wouldn't it be
sending packets with a source address on the 10.10.10.0 network through the
external interface of the bridge. If I created a rule which dropped any
packets that arrived at the external Firewall interface, with a source
address on the 10.10.10.0 network, would that be a problem? I'm not saying
your wrong. I'm just trying to understand my misunderstanding.

Thanks,
Gerry

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Antony Stone
Sent: Thursday, March 18, 2004 2:40 PM
To: netfilter@lists.netfilter.org
Subject: Re: iptables bridge filter question


On Thursday 18 March 2004 8:12 pm, Gerry Weaver wrote:

> Hi,
>
> Firstly, thanks for the suggestions. Please let me explain further. I want
> to setup an anti-spoofing rule that will block packets coming in on the
> external interface, which have a source address of my internal net. The
> problem is that I have a router that sits in the external side of the
> bridge. I need to stop spoofed packets while still allowing my router.

Question:

Why are you expecting to see packets coming from your router which have the
source address of the router's internal interface?

I agree that any packets *originating* from the router (including replies to
any packets you send to it) will have this address, but are you really
expecting such traffic?

Most of the packets you see coming from your router will have source
addresses
out on the Internet (that, after all, is what the router is for), so it may
be that you don't have the "unique address" problem after all?

Regards,

Antony.

--
The first fifty percent of an engineering project takes ninety percent of
the
time, and the remaining fifty percent takes another ninety percent of the
time.

                                                     Please reply to the
list;
                                                           please don't CC
me.



---
Incoming mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.576 / Virus Database: 365 - Release Date: 1/30/2004

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.576 / Virus Database: 365 - Release Date: 1/30/2004



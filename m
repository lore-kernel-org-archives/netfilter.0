From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables bridge filter question
Date: Thu, 18 Mar 2004 20:40:03 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403182040.03659.Antony@Soft-Solutions.co.uk>
References: <ILECICAFAJIIMPBBLMEAKELJCPAA.gerryw@objectivedomain.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <ILECICAFAJIIMPBBLMEAKELJCPAA.gerryw@objectivedomain.com>
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

Most of the packets you see coming from your router will have source addresses 
out on the Internet (that, after all, is what the router is for), so it may 
be that you don't have the "unique address" problem after all?

Regards,

Antony.

-- 
The first fifty percent of an engineering project takes ninety percent of the 
time, and the remaining fifty percent takes another ninety percent of the 
time.

                                                     Please reply to the list;
                                                           please don't CC me.



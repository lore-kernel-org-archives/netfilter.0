From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: TTL target
Date: Sat, 24 Jul 2004 12:39:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407241239.52659.Antony@Soft-Solutions.co.uk>
References: <D5C9032B2B09C64EA2409D6214E91AC90511EB@asimail2.alphanumeric.com> <1090613367.28446.3.camel@dchws.tqmcube.com> <41024706.8060603@polbox.com>
Reply-To: NetFilter List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <41024706.8060603@polbox.com>
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
To: NetFilter List <netfilter@lists.netfilter.org>

On Saturday 24 July 2004 12:24 pm, adderek wrote:

> David Cary Hart wrote:
> > I must ask a dumb question. Why would one want to mangle TTL or filter
> > on TTL?
>
> For example if you want to make little network with your frends where
> everyone pay their part of internet-connection price and you don't want
> anyone to connect more than one computer into it so they can't make
> their own subnetworks to pay less than others.

What stops them doing the same thing with the TTL value in their packets, 
before they reach you?

Or just using a proxy which creates its own packets anyway?

Or using an SSH tunnel to forward the other traffic?

Or using a different O/S which sets a different initial TTL value than you're 
assuming, when it sends packets?

Antony.

-- 
The words "e pluribus unum" on the Great Seal of the United States are from a 
poem by Virgil entitled "Moretum", which is about cheese and garlic salad 
dressing.

                                                     Please reply to the list;
                                                           please don't CC me.



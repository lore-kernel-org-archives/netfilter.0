From: adderek <adderek@polbox.com>
Subject: Re: TTL target
Date: Sat, 24 Jul 2004 15:36:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <410265C6.4080100@polbox.com>
References: <D5C9032B2B09C64EA2409D6214E91AC90511EB@asimail2.alphanumeric.com> <1090613367.28446.3.camel@dchws.tqmcube.com> <41024706.8060603@polbox.com> <200407241239.52659.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407241239.52659.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: NetFilter List <netfilter@lists.netfilter.org>

Antony Stone wrote:
> What stops them doing the same thing with the TTL value in their packets, 
> before they reach you?
> 
> Or just using a proxy which creates its own packets anyway?
> 
> Or using an SSH tunnel to forward the other traffic?
> 
> Or using a different O/S which sets a different initial TTL value than you're 
> assuming, when it sends packets?

Nothing. If they know what they are doing then there is no way to detect 
or to stop such incidents. But people who have enough knowledge to do 
something like this..... there are only few of them :)

Only a couple people will know what is proxy and how to set it up.
Only a few of them will know how to set up an SSH tunell and how to usae it.
And people who know how to use TTL.... There will be only about 5 people 
of a thousand....


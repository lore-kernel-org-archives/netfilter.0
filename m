From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Setting and Routing on the TOS Source (SRC) and Destination (DST) Bits
Date: Sun, 22 Sep 2002 09:21:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020922082118.EQR13996.mta05-svc.ntlworld.com@there>
References: <Pine.LNX.4.44.0209202140330.2337-100000@laptop1.agatha> <20020921215923.PLBQ27185.mta03-svc.ntlworld.com@there> <0a9401c261c4$bc771400$c6b22543@repligate>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <0a9401c261c4$bc771400$c6b22543@repligate>
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

On Sunday 22 September 2002 12:15 am, Jim Fleming wrote:

> IPv4 has a 0100 in the first four bits of the 160 bits that come screaming
> at you down the wire... ...correct ?

Yes.   Otherwise you wouldn't know it's IPv4.

> Have you ever set the 16 bits of the Identification Field ?....and used
> those for Extended Addressing ?

No, I haven't.   That would be using part of the IPv4 header in a manner 
different from the standard specification, which is not what I was talking 
about.   I was talking about which bits of the standard IPv4 header you can 
use to make routing decisions.

It sounds to me as though you're talking about finding parts of the header 
which you can get away with using for a different purpose than originally 
intended, and then claim that they're routing bits.

If that's the case then sure, feel free to do whatever you like at both ends 
of a link, but don't expect compatibility with a standard IPv4 stack.

On the other hand, if we're discussing which bits in a genuine IPv4 header it 
makes sense to read and base routing decisions on, then I still say that 83 
of them make sense, 28 are doubtful, and 49 are useless.

Either way I think this thread has got sufficiently off-topic for netfilter 
that we may as well end the discussion on the list.

By the way, I was not advocating IPv6 per se - I was simply commenting on the 
confusion which would ensure if this thing called IPv8 became at all well 
known in the time between IPv4, which we all use now, and IPv6, which we're 
all supposed to be using sometime soon.

Antony.

-- 

Having been asked to provide a reference for this man,
I can confidently state that you will be very lucky indeed
if you can get him to work for you.


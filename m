From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Ipv6 array ORDER
Date: Mon, 19 Jul 2004 15:39:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407191539.15333.Antony@Soft-Solutions.co.uk>
References: <20040719142833.GA26461@darkalpt>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040719142833.GA26461@darkalpt>
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

On Monday 19 July 2004 3:28 pm, Alpt wrote:

> Hi there,
> What's the ipv6 array ORDER in the in6_addr struct?
> In other words what's the word order of  "__u32           u6_addr32[4];" ?
> Is it "most significant word first" or "least significant first"?
>
> And each word is in network byte order right?

This sort of question is probably better suited to the netfilter developers' 
mailing list rather than the netfilter users' list.   Somebody here might 
know, but I wouldn't bet on it.   Somebody on the developers' list really 
should know.

Regards,

Antony.

-- 
"When you talk about Linux versus Windows, you're talking about which 
operating system is the best value for money and fit for purpose. That's a 
very basic decision customers can make if they have the information available 
to them. Quite frankly if we lose to Linux because our customers say it's 
better value for money, tough luck for us."

 - Steve Vamos, MD of Microsoft Australia

                                                     Please reply to the list;
                                                           please don't CC me.



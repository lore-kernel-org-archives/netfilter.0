From: Matthias Hopf <Matthias.Hopf@informatik.uni-stuttgart.de>
Subject: Re: Strange paket loss on trivial NAT configuration...
Date: Wed, 28 May 2003 00:33:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030527223354.GA13962@vismail.informatik.uni-stuttgart.de>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D11@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D11@wardrive.citadelcomputer.com.au>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On May 28, 03 08:19:40 +1000, George Vieira wrote:
> OK. iptables isn't the blame here but it can help.
> 
> I believe the problem you MAY be experiencing is an MTU problem.. you can lower it's value and it'll probably fix your problem.

Uh, ah, as you mention it, a bell rings. I remember that I have read
something about MTUs and broken ISPs. Though I must admit that I do not
completely understand why this affects incoming pakets, not outgoing...
Negotiation?

> A client of mine had this problem with getting mail from some servers and browsing some sites. It appears that the ISP has a low MTU (probbly below 1400) and some packets get badly fragmented or something and causes loss of packets.. something like that.

Yes, something like that ;)))
At least, there are more people having similar problems, I searched the web
and groups for about an hour, but found nothing...

> There is a rule which you can add to iptables which tells it that any packets leaving the OUTPUT table or POSTROUTING table to make the MTU fixed at 1400 or something.. can anybody provide it, I've seem millions of hits on google.com for this...

Thanks, I think I'll find it in the HowTos and man pages.

> Then, I can be totally wrong but it may be something you might need to investigate incase you spend hours on something it's not..

Point taken. I'll try and let you know.
Ah, and I just checked my interfaces - eth0 has a MTU of 1500, ppp0 of 1490...
I'll go and try fixing it at 1400. Just to make sure.

Many thanks for the quick answer

Matthias

-- 
Matthias Hopf - Visualization and Interactive Systems Group    \  |  |  /--
                  University of Stuttgart,                      \ |  |   \
       Universitaetsstr. 38, 70569 Stuttgart, Germany            \|  |  --/
Phone +49-711-7816-404    Fax -340          mat@mshopf.de     www.mshopf.de


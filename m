From: Askar <askarali@gmail.com>
Subject: Re: what is --set-mes 128
Date: Thu, 13 Jan 2005 11:13:56 +0500
Message-ID: <a0f69e50501122213291aa355@mail.gmail.com>
References: <a0f69e505011220501c9284b@mail.gmail.com>
	<1105593361.8185.10.camel@hubcap.ljm.dom>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1105593361.8185.10.camel@hubcap.ljm.dom>
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

Thank you very much simpson ..ooops imean jason :)


On Thu, 13 Jan 2005 00:16:01 -0500, Jason Opperisano <opie@817west.com> wrote:
> On Wed, 2005-01-12 at 23:50, Askar wrote:
> > Hello,
> >
> > can someone help mevto understand these rules...
> >
> > $iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --set-mss 128
> > $iptables -t nat -A PREROUTING -p tcp --tcp-flags SYN,RST SYN -j
> > TCPMSS --set-mss 128
> >
> 
> MSS == Maximum Segment Size
> 
> in english--it's the maximum amount of data that can be contained in a
> TCP packet.
> 
> normal MSS calculation is:
> 
> MSS = MTU - 40
> 
> so--for example on an ethernet interface; where MTU = 1500, the MSS
> would be 1460.
> 
> a common reason to mess around with "-j TCPMSS --set-mss" is when you're
> tunneling your traffic over IPsec, and/or when PMTU discovery is broken.
> 
> maybe i'm missing something, but 128 seems like an *awfully* low value
> to be forcing your MSS to.
> 
> > Secondly is there any benefit of changing TOS of packets going out i-e...
> >
> > $iptables -A OUTPUT -t mangle -p tcp --dport http -j TOS --set-tos
> > Maximize-throughput
> 
> i doubt it.
> 
> -j
> 
> --
> "We only get thirty sweet noggy days.  Then the government takes it
>  away again."
>         --The Simpsons
> 
> 


-- 
(after bouncing head on desk for days trying to get mine working, I'll make
your life a little easier)


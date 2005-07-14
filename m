From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Re: h323 over nat firewall - queries
Date: Thu, 14 Jul 2005 15:47:57 +0800
Message-ID: <016601c58848$5ab54860$1280a8c0@newlife>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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


From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>


> 
> I have a case where I have H323 VoIP equipments located behind
> Linux nat-box running ip_h323_nat and ip_conntrack_h323.
> 
> We have various combination of traffic and some of them deemed
> successful and some of them I experience some weird problems 
> such as not able to hear to voice and/or chopping voice.
> 
> Upon troubleshooting and narrowing down the problem, I suspect 
> that the modules might have some limitation and so I am posting 
> here to see if anyone enlighten me on this subject.
> 
> I remember certain conntrack modules only allow one client to be
> behind nat, so I am asking :-
> 
> If I have one H323 VoIP equipment going to multiple H323 counter 
> parts on the internet at the same time, via the Linux nat conntrack 
> module, if it is going to work correctly ? ie I have one source private 
> IP, but going to multiple destination public IPs via the H323 conntrack 
> module, is this a supported configuration ?
> 

I did not get any comments on this ?

Upon further checking I found the 2.6 kernel has a difference source
from the 2.4 kernel and my problem was seen on 2.4 kernel. By any
chance, this "suspected limitation" has been fixed in 2.6 kernel ?

Is it worthwhile testing it on 2.6 kernel ?







From: Richard Feng <rfeng@wurldtech.com>
Subject: Re: conntrack-tools 0.9.14 can not block the connection
Date: Fri, 7 May 2010 09:17:27 -0700
Message-ID: <201005070917.27301.rfeng@wurldtech.com>
References: <201005061651.40203.rfeng@wurldtech.com> <alpine.LSU.2.01.1005070954230.32277@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1005070954230.32277@obet.zrqbmnf.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


Thanks Jan for your answer - I still got some questions in the following.

On May 7, 2010 12:55:44 am Jan Engelhardt wrote:
> On Friday 2010-05-07 01:51, Richard Feng wrote:
> 
> >Hi,
> >
> 
> >However, the connection is still active - is this the correct behaviour? 
> 
> Yes.
So 'conntrack -D' can not really cut current connections?  It can only delete 
entry from the state table? I just want to make sure - from the 
document "http://conntrack-tools.netfilter.org/manual.html#conntrack". It 
clearly said "Delete on entry, this can be used to block traffic (you have to 
set /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal to zero)".
> >>From the documentation (from conntrack-tools.netfilter.org), somewhere it 
says 
> >that "have to set /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal 
to 
> >zero".There is simply no 'netfilter' folder under my 
> >folder '/proc/sys/net/ipv4'. Is this the problem? How could I fix it?
>
> Upgrading to a newer kernel (you're probably running some stoneage 
> thing).
Thank you for your pointer at a later reply - I found it now 
at /proc/sys/net/netfilter/nf_conntrack_tcp_be_liberal. And it was set "0".

Regards,
Richard
 


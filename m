From: Dennis Jacobfeuerborn <dennisml@conversis.de>
Subject: Re: intermittent nat issue
Date: Fri, 20 Jan 2017 11:36:45 +0100
Message-ID: <14ec9b85-d18b-db28-b0a1-3459835da78e@conversis.de>
References: <6a6cc500-9c8a-4075-f856-fb5d90f0571b@pkfnet.co.za>
 <1e5b43088d9a493faee12f3027ce8aa5@aalto.fi>
 <64c68c3a-9397-a93b-4cc4-8e6db25e02c6@pkfnet.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <64c68c3a-9397-a93b-4cc4-8e6db25e02c6@pkfnet.co.za>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mark Coetser <mark@pkfnet.co.za>, Llorente Santos Jesus <jesus.llorente.santos@aalto.fi>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 20.01.2017 10:47, Mark Coetser wrote:
> Hi Llorente
> 
> I did run conntrack -F to check that but still had the unnatted packets
> traversing the interface.
> 

Hi, I'm seeing this as well on our systems. One thing I notice is that
all packets either the RST of FIN flag set. Could this be some sort of
race condition where Conntrack removes the connection from the table
because of the flags and as a result the final packet will not get
masqueraded/nat'ed?

Regards,
  Dennis


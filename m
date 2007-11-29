From: James Lay <jlay@slave-tothe-box.net>
Subject: Re: Blocking web-based proxy traffic
Date: Thu, 29 Nov 2007 07:24:53 -0700
Message-ID: <C37419C5.22F8%jlay@slave-tothe-box.net>
References: <m3bq9d722z.fsf@ursa.amorsen.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <m3bq9d722z.fsf@ursa.amorsen.dk>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Benny Amorsen <benny+usenet@amorsen.dk>, netfilter@vger.kernel.org




On 11/29/07 3:55 AM, "Benny Amorsen" <benny+usenet@amorsen.dk> wrote:

>>>>>> "GT" == Grant Taylor <gtaylor@riverviewtech.net> writes:
> 
> GT> The preferred option would be to DNAT (redirect) the traffic to a
> GT> mini web server that will serve up a generic web page indicating
> GT> that the access has been blocked.
> 
> The GET request only gets transmitted once the three-way TCP handshake
> is done. By then it's way too late to DNAT anything -- the mini web
> server wouldn't get a SYN, so it would throw away the packet.
> 
> 
> /Benny
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


Thanks to all who responded to this...looks like I'll have to use a
multi-layered approach.

Thanks again,
James



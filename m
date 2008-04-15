From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: NAT Port Forward problem in a not so simple network
Date: Tue, 15 Apr 2008 10:01:42 -0500
Message-ID: <4804C356.3040405@riverviewtech.net>
References: <480479E8.3040904@naxe.it> <48049C5D.8040104@bofhland.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48049C5D.8040104@bofhland.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 04/15/08 07:15, whiplash wrote:
> Of course. A possible solution is to SNAT packets exiting from 
> 192.168.0.11 with destination 192.168.0.2.

*nod*

However, SNATing will have the possibly undesirable side effect of 
making the traffic appear to be from the machine that is doing the SNATing.



Grant. . . .

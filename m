From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: "DNAT" w/o changing source address?
Date: Wed, 03 Oct 2007 18:35:04 -0500
Message-ID: <47042728.1060508@riverviewtech.net>
References: <1191424890.25752.27.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1191424890.25752.27.camel@localhost.localdomain>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/3/2007 10:21 AM, John Madden wrote:
> I've got the typical DNAT configuration working fine, but I'm 
> wondering if there's a way to "port forward" without changing the 
> source address of the packets so that the destination sees the actual 
> client's IP?

Um, correct me if I'm wrong, but Destination NATing should not alter the 
source IP address of the packet that is being NATed.

Honestly, I wonder how you are doing your DNATing and if you are not 
also possibly unknowingly SNATing as well.



Grant. . . .

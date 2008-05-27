From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Site-specific filter rules problem
Date: Tue, 27 May 2008 09:29:02 -0500
Message-ID: <483C1AAE.1010709@riverviewtech.net>
References: <1211702139.7164.22.camel@u804mbr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1211702139.7164.22.camel@u804mbr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 05/25/08 02:55, Mark Baker wrote:
> I have packet captures from connections to this site, with and 
> without firewall rules installed.  I don't see anything that should 
> be blocked based on these rules - the only thing odd is that when the 
> problem occurs I get a ton of retransmissions from the server. 
> Another oddity in both cases is that virtually every packet coming 
> from the server is fragmented; but from what I've read, connection 
> tracking (which is running on this machine) should completely 
> reassemble fragmented packets before delivery to the filter table. 
> Still, could fragmentation be the problem?

Based on the retransmissions, it sounds like something is expecting to 
get something through and have it acknowledged that is not.

I'd look at what is being re-transmitted and see if it needs to get 
through and / or if there is an unacknowledged reply that is being blocked.



Grant. . . .

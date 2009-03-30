From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd and counters
Date: Mon, 30 Mar 2009 20:19:47 +0200
Message-ID: <49D10D43.9090506@netfilter.org>
References: <49D0D597.50007@dbamsystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49D0D597.50007@dbamsystems.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sam Gardner <sgardner@dbamsystems.com>
Cc: netfilter@vger.kernel.org

Hi Sam,

I'm cc'ing netfilter user to keep this message for the record.

Sam Gardner wrote:
> Hi Pablo,
> 
> I have just started using the conntrack tools. In particular, I am 
> running conntrackd to support failover. When I perform a conntrackd -c I 
> can see the connections I am expecting on the backup machine. However, 
> the packet and byte counts seem to have been reset. Is it possible to 
> synchronise the packet and byte counts too? Do you already have code 
> that can do this?

This is not be feasible since every packet would require one 
synchronization message containing the counter update. However, I can 
add it this in an approximate way (losing some precision). However, I'm 
not sure how useful this would be.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers

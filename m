From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: netfilter_queue performance benchmark
Date: Fri, 16 Mar 2012 01:16:37 +0100
Message-ID: <20120316001637.GA17518@1984>
References: <BLU162-W18A5D39B5935F35F508118F6580@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BLU162-W18A5D39B5935F35F508118F6580@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andres Velasco Garcia <telecom.andresvelasco@hotmail.com>
Cc: netfilter@vger.kernel.org

On Tue, Mar 13, 2012 at 08:39:52AM +0100, Andres Velasco Garcia wrote:
> 
> Do you know if a performance benchmark exists about netfilter_queue? (packets per second supported on a certain platform).
> Maybe just receiving and accepting the packet right away, as reference.

It depends on the platform that you use. You also may want to enable
several tweaks to improve performance described in the doxygen
documentation. Check also the load sharing approach that NFQUEUE
provides (see --queue-balance).

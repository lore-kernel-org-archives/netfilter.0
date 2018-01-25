From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: How to get conntrack statics from proc system?
Date: Thu, 25 Jan 2018 12:49:37 +0100
Message-ID: <20180125114937.bn3foi2dqpllszlb@salvia>
References: <da49e7e6-14ae-5aca-a8f1-118fbcae6df9@metu.edu.tr>
 <3b80c103-dacf-3244-a387-87e468392c84@metu.edu.tr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3b80c103-dacf-3244-a387-87e468392c84@metu.edu.tr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hdemir <hdemir@metu.edu.tr>
Cc: netfilter@vger.kernel.org

On Thu, Jan 25, 2018 at 10:11:56AM +0300, hdemir wrote:
> Hi All Again,
> 
> Infact I just want to get conntrack stats? New, established, invalid,
> etc. "conntrack -S" is not working, as procfs.
> 
> 
> Any clue? Any simple way, tool?

A number of stat has been declared obsolete:

https://patchwork.ozlabs.org/patch/674759/

Is that what you're missing?

Thanks.

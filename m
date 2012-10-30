From: Ed W <lists@wildgooses.com>
Subject: Re: Packets marked by iptables only sent to the correct routing table
 sometimes
Date: Tue, 30 Oct 2012 23:45:25 +0000
Message-ID: <50906695.605@wildgooses.com>
References: <50900C7D.2010300@deserettechnology.com> <20121030191034.GA21096@1984> <20121030191610.GA23663@1984> <509061DC.3090606@deserettechnology.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <509061DC.3090606@deserettechnology.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jeff@deserettechnology.com
Cc: netfilter@vger.kernel.org

On 30/10/2012 23:25, Jeff Cook wrote:


>>>>      0.0.0.0/1 via 10.8.0.5 dev tun0


> Apologies for asking a naive question, but could you please inform me
> where 128.0.0.0/1 comes from and why it's ANDed against external IP
> addresses?

Haven't you got it backwards?  Your route is 0.0.0.0/1, ie anything 
0-127.x.x.x is routed, but 128.x.x.x isn't in the 0.0.0.0/1 net, hence 
it isn't?

Ed W

From: Eric Leblond <eric@regit.org>
Subject: Re: Timestamping in nfqueue
Date: Fri, 13 May 2011 16:43:42 +0200
Message-ID: <1305297833.2013.16.camel@tiger.regit.org>
References: <1305297156.9902.41.camel@compot-mob>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1305297156.9902.41.camel@compot-mob>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: nowhere <nowhere@hakkenden.ath.cx>
Cc: netfilter@vger.kernel.org

Hello,

On Fri, 2011-05-13 at 18:32 +0400, nowhere wrote:
> Hello,
> 
> What is the purpose of nfq_get_timestamp() in libnfnetlink_queue if
> skbs, entering nfnetlink_queue, are not timestamped?

If I remember correctly, skb are timestamped when catch in the FORWARD
chain. This is not the case in some other chains.

BR,
--
Eric Leblond



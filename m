From: Stephen Hemminger <shemminger@vyatta.com>
Subject: Re: which traffic scheduler can achieve SP QoS effect, using TC
Date: Fri, 19 Nov 2010 09:17:39 -0800
Message-ID: <20101119091739.7e4d6b54@nehalam>
References: <201011192242182505082@5bamboos.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201011192242182505082@5bamboos.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: liu <liu@5bamboos.com>
Cc: netfilter <netfilter@vger.kernel.org>

On Fri, 19 Nov 2010 22:42:18 +0800
"liu" <liu@5bamboos.com> wrote:

> For example, 8 queues is configed in a router, q1 have the highest priority to xmit packet, and q2 can get chance to xmit packet just when q1 has no packet to send, and q3 can get chance to xmit packet when q1 and q2 have no packet to send, the rest of other queues is simily.
> 
> Can TC achieve this effect, and how could I configure my router, which is using kernel 2.6.30.
> 
> Thanks for any help!

Use 'prio' qdisc and add classifiers to assign packets to slots

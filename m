From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: Dual WAN set-up
Date: Mon, 16 Jan 2012 14:28:14 -0600
Message-ID: <op.v761tcwhx1lyi3@debiandesk2.net>
References: <201201121651.18887.dyioulos@onpointfc.com>
 <201201131017.22019.dyioulos@onpointfc.com>
 <201201131022.05220.dyioulos@onpointfc.com>
 <201201160956.23955.dyioulos@onpointfc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201201160956.23955.dyioulos@onpointfc.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, Dimitri Yioulos <dyioulos@onpointfc.com>

On Mon, 16 Jan 2012 08:56:23 -0600, Dimitri Yioulos <dyioulos@onpointfc.com> wrote:

> Before I commit this new set-up, I'd like to post the ste-by-step
> instructions I wrote up for your kind review:

I don't quite understand your network configuration, but the ideas we provided on split-access to uplinks should adaptable to any situation.

> Under this set-up, don't I need to add POSTROUTING AND FORWARDING
> rules?  Sorry for my stupidity, but I set the original up a long
> time ago, and certainly don't know all there is to know.  Your
> continued patience and support are greatly appreciated.
>

The PREROUTING chain of the mangle table will handle the marking of new connection packets as well as recovery of the connection mark to the packet mark.  There should be no other iptables stuff required to mark the packets, and "ip rule add fwmark..." will handle sending the marked packets to the right routing table.

I think you are doing SNAT, which uses POSTROUTING chain.  You you will want to keep that.

Others here are much more knowledgeable and may have more comments.
-- 
Lloyd

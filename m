From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Mystics of packet forwarding
Date: Wed, 07 Jan 2009 16:07:58 +0100
Message-ID: <4964C54E.8090607@chello.at>
References: <4963B3EB.6090806@arturaz.net> <496475AB.9040303@arturaz.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <496475AB.9040303@arturaz.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

netfilter-owner@vger.kernel.org wrote:
> Ok, it seems that really - someone in LAN is attacking the internet.
>
> If I turn on forwarding for few users like me, some other 
> computer-literate friends - digg.com still works :))
>
> Now it's the question how do I catch bad guys? What should I look 
> into? Packet bursts? Lot's of new connections? Etc?
>

quick ways could be:
iptraf (you could apply filters for specific traffic)
iptstate (shows conntrack table)
tcpdump (i.e. simple rule: tcpdump -n -i your_ext_iface tcp dst port 80)

any of those tools could give you a quick picture of current connections 
(attempts).

greets

mart

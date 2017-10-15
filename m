From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: conntrack and NAT rules behaviour on return path
Date: Mon, 16 Oct 2017 00:14:01 +0200
Message-ID: <443832ee-1ba2-7a30-edab-d28e60c28455@plouf.fr.eu.org>
References: <20171015110540.GA8513@naoned.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20171015110540.GA8513@naoned.it>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LB <netfilter@naoned.it>
Cc: netfilter@vger.kernel.org

Le 15/10/2017 à 13:05, LB a écrit :
> 
> My question is there : the return flow of this connection , as per the netfilter diagrams I see, will reach conntrack first , in the PREROUTING, go into FORWARD, and then POSTROUTING. But here, in postrouting, the flow IS matching my SNAT rule, isn't it ? So why the return flow is not SNAT'ed to 10.10.10.2 (I can see in tcpdump it is not)
> I was under the feeling that once a conntrack entry is "matched" (sorry for the lack of precision), it would somehow "bypass" the SNAT (or DNAT) rewriting.

Sort of.

The nat table is special. Only the first packet of a NEW connection goes 
through the chains and rules of the nat table. All subsequent packets 
belonging or related to the same connection are processed according to 
which rules were applied to the first packet.

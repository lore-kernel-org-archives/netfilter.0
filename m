From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: conntrack and ICMP echo replies not showing as ESTABLISHED
Date: Wed, 3 Jan 2018 00:46:12 +0100
Message-ID: <beedcf8c-c307-a983-81f8-aee8b164a7dc@plouf.fr.eu.org>
References: <CAMOPTEw27JqkKn1b5Y7-i79SRWn3pX+RNNEh3kvpLQBXzOR27A@mail.gmail.com>
 <28c711a6f49a42059d3cf6b47b486f8d@CCDEX023.corp.corpcommon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <28c711a6f49a42059d3cf6b47b486f8d@CCDEX023.corp.corpcommon.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?Q?Andr=c3=a9_Paulsberg-Csibi_=28IBM_Consultant=29?= <Andre.Paulsberg-Csibi@evry.com>, 'Oliver O'Boyle' <oliver.oboyle@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Le 02/01/2018 à 22:56, André Paulsberg-Csibi (IBM Consultant) a écrit :
> As far as I can tell - ESTABLISHED - is only for session based protocols like TCP .
> You will not see that for UDP or ICMP , as far as CONNTRACK is concerned .
> 
> IN the ruleset it will fall under the STATE of ESTABLISHED , as IPTABLES understands that this is direct return traffic .
> However , like UDP it has no real "IP state" outside of IPTABLES and my guess this is why it not refered to in that state in CONNTRACK .

You could not be more wrong. Connection tracking handles state for UDP 
and ICMP. Iptables just checks the packet states assigned by conntrack.

> -----Original Message-----
> 
> I'm sure I'm missing something obvious but I am not seeing echo replies showing as ESTABLISHED when running:
> 
> sudo conntrack -E

Do not confuse packet state and connection state.
conntrack -E shows connection tracking events, not packet states.

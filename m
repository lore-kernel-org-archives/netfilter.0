From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: why can't I DNAT SIP?
Date: Thu, 08 May 2008 14:31:13 -0500
Message-ID: <48235501.4030608@riverviewtech.net>
References: <fvtjuu$7i1$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <fvtjuu$7i1$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 05/07/08 20:10, sean darcy wrote:
> On my outside box I trying to route sip ( port 5060 ) and iax ( 4659 ) 
> packets to an internal asterisk server. I use DNAT, which works fine for 
> iax, but doesn't for SIP. I'm using identical DNAT statments.

No you are not.

> $IPT -t nat -A PREROUTING -i external -p udp --dport 4569 -j DNAT --to 
> 10.10.10.180:4569

(verses)

> $IPT -t nat -A PREROUTING -s ext-box  -p udp --dport 5060 -j DNAT --to 
> 10.10.10.180:5060

Note that you have "-i external" on the first (IAX) rule and "-s 
ext-box" on the second (SIP) rule.

I don't know if you have taken this in to account or not, but remember 
that SIP is not really NAT friendly.



Grant. . . .

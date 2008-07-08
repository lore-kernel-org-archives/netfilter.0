From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Port Forwarding .
Date: Mon, 07 Jul 2008 21:23:32 -0500
Message-ID: <4872CFA4.4030406@riverviewtech.net>
References: <5078d3df0807071449k730a33cxe31e0b34078f5794@mail.gmail.com>	 <4872943B.2060309@riverviewtech.net>	 <5078d3df0807071532w4ab76fe4vcf4e60a8980525ba@mail.gmail.com>	 <5078d3df0807071533k47a5dd16i254b3ae3592d7a77@mail.gmail.com>	 <5078d3df0807071610m5b47a81qc5d830a8b7bd0cff@mail.gmail.com> <5078d3df0807071658p73a25291v8522a9645fa8b8f9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5078d3df0807071658p73a25291v8522a9645fa8b8f9@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 7/7/2008 6:58 PM, Charles Romestant wrote:
> ok a little more info, for debugs sake...

Ok!  You have not been clearing your IPTables before adding additional 
rules.  Please run the following commands and re-try what I submitted 
earlier.

iptables -t filter -F
iptables -t nat -F

> again it seems only the first rulein the PREROUTING is executing as 
> consecutive looks at this while trying to browse to the page show 
> increment in pckts.

*nod*

Your first DNAT rule, which is incorrect, is being matched before the 
rule(s) that I provided.  You need to flush your IP tables and chains.

> again, thank you for your patience.

*nod*

You are welcome.



Grant. . . .

From: Mark Coetser <mark@pkfnet.co.za>
Subject: Re: IPv6: unknown packet logged ...
Date: Tue, 22 Aug 2017 16:47:32 +0200
Message-ID: <3c69b7a5-7e01-de66-02be-acd6029be63a@pkfnet.co.za>
References: <f1a8f3cdd11c6f2fa7a5946a0cf4c66f.1503412939@squirrel.mail>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <f1a8f3cdd11c6f2fa7a5946a0cf4c66f.1503412939@squirrel.mail>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Walter H." <walter.h@mathemainzel.info>, netfilter@vger.kernel.org

On 22/08/2017 16:42, Walter H. wrote:
> Hello,
> 
> I have these rules at the beginning of /etc/sysconfig/ip6tables
> 
> # Filter all packets with state INVALID
> -A INPUT -m state --state INVALID -j DROP
> -A FORWARD -m state --state INVALID -j DROP
> -A OUTPUT -m state --state INVALID -j DROP
> 
> and on bottom these rules:
> 
> # Log all other
> -A INPUT -j LOG --log-prefix "IPv6[IN]: " --log-level 7
> -A FORWARD -j LOG --log-prefix "IPv6[FWD]: " --log-level 7
> -A OUTPUT -j LOG --log-prefix "IPv6[OUT]: " --log-level 7
> 
> which rule would have catched these logged packets:
> 
> [70223.386265] IPv6[FWD]: IN=sit1 OUT=br0
> SRC=2a00:1450:4001:081a:0000:0000:0000:200e DST=myipv6addr LEN=123 TC=0
> HOPLIMIT=60 FLOWLBL=617912 PROTO=TCP SPT=443 DPT=59073 WINDOW=1171
> RES=0x00 ACK PSH URGP=0
> [70232.150311] IPv6[FWD]: IN=sit1 OUT=br0
> SRC=2a00:1450:4001:081a:0000:0000:0000:200e DST=myipv6addr LEN=123 TC=0
> HOPLIMIT=60 FLOWLBL=949795 PROTO=TCP SPT=443 DPT=59073 WINDOW=1171
> RES=0x00 ACK PSH URGP=0
> [70249.740932] IPv6[FWD]: IN=sit1 OUT=br0
> SRC=2a00:1450:4001:081a:0000:0000:0000:200e DST=myipv6addr LEN=123 TC=0
> HOPLIMIT=60 FLOWLBL=811062 PROTO=TCP SPT=443 DPT=59073 WINDOW=1171
> RES=0x00 ACK PSH URGP=0

those logged packets are from packets traversing your filter FORWARD 
chain obviously no rule is matching which is why its triggering the last 
rule which is

-A FORWARD -j LOG --log-prefix "IPv6[FWD]: " --log-level 7


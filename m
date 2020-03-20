From: Florian Westphal <fw@strlen.de>
Subject: Re: nftables 0.9.3, sets with concatentation
Date: Fri, 20 Mar 2020 17:37:58 +0100
Message-ID: <20200320163758.GB3305@breakpoint.cc>
References: <10a01f25-84fa-fa19-c10f-7c530ef9f10c@hafenthal.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <10a01f25-84fa-fa19-c10f-7c530ef9f10c@hafenthal.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Hartmann <stefanh@hafenthal.de>
Cc: "netfilter.org" <netfilter@vger.kernel.org>

Stefan Hartmann <stefanh@hafenthal.de> wrote:
> I have successfully migrated from a cisco IOS router to a new GNU/Linux
> Debian box with nftables 0.9.3.
> 
> At now I am trying to simplify the configuration with sets.
> E.g.
> table ip FILTER4 {
> 	set s4_ICMP-RELATED {
> 		type icmp_type
> 		elements = { destination-unreachable,
> 			     time-exceeded }
> 
> and using this set
> ...
> chain ACL4-IN_IF2 {
> 		ct state invalid log prefix "NFT: FILTER4/ACL4-IN_IF2: ct invalid: " drop
> 		ct state established,related accept
> 		icmp type @s4_ICMP-RELATED accept
> 		...
> 
> This works perfectly with sets without concatenation.
> 
> 
> For the sake of a well-arranged ruleset,
> it would be nice to have a concatenated set like
> 	set s4_MISC-SERVICES {
> 		type inet_proto . inet_service
> 		elements = { udp . 69, tcp . 23 ]
> 
> and then use this set like
> 	ip daddr $IP4_IF2 . dport @s4_MISC-SERVICES accept

try
 ... IF2 . th dport ..

(th == transport header).

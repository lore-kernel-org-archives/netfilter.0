From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: UDP stream load balancing across multiple uplinks
Date: Fri, 25 Jul 2008 10:09:45 -0500
Message-ID: <4889ECB9.3090206@riverviewtech.net>
References: <000501c8edf5$19903230$4cb09690$@com> <a43edf1b0807241837n7e6dceb4id5a16dd56c6344a9@mail.gmail.com> <000001c8ee61$67e4b7a0$37ae26e0$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <000001c8ee61$67e4b7a0$37ae26e0$@com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 07/25/08 09:19, Barry A Rich wrote:
> Bonding is not required in this case. The system that receives the 
> UDP stream does not care if the UDP packets have different source IP 
> addresses. NAT would not be required in this case, but the ISP might 
> drop packets if the source address does not match the uplink address.
> 
> Given those assumptions, what's the best way to load balance across 
> the uplinks? If netfilter cannot be configured to do this, can I 
> change ip_conntrack to ignore UDP packets?

Given that the source IP of your packets can change mid stream, you 
could use the "nth" match extension.  Using "nth" you would match 
packets to decide how to mark them and then use the mark to determine 
what routing table to use which would ultimately decide which outbound 
path to use.



Grant. . . .

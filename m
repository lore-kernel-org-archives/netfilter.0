From: Srinivasa T N <seenutn@linux.vnet.ibm.com>
Subject: Re: Double rules for using NETFLOW?
Date: Fri, 04 Feb 2011 10:32:39 +0530
Message-ID: <4D4B886F.70705@linux.vnet.ibm.com>
References: <4D492B87.5050008@linux.vnet.ibm.com> <4D499ACA.2040603@riverviewtech.net> <4D4A3A04.20505@linux.vnet.ibm.com> <4D4B0CAE.5000105@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D4B0CAE.5000105@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On Friday 04 February 2011 01:44 AM, Grant Taylor wrote:
> On 02/02/11 23:15, Srinivasa T N wrote:
>> But how will I have access to the counters from my user land app?
>
> I'd be extremely surprised if there were APIs that you can use to query
> the kernel. - Though, I don't work on programming (like that) so I don't
> know first hand.
>
> At the very least, you can find the counters via the output of the
> iptables command. I.e. I can issue the following command:
>
> iptables -t filter -L FORWARD -n -v -x
>
> This will give me a packet / byte count (-v) that is exact (-x) that
> have match various rules. I.e. the above command produced the following
> output:
>
> Chain FORWARD (policy DROP 0 packets, 0 bytes)
> pkts bytes target prot opt in out source destination
> 3783934 4488563274 ACCEPT all -- eth0 eth1 0.0.0.0/0 0.0.0.0/0 state
> RELATED,ESTABLISHED
> 2632183 290464220 ACCEPT all -- eth1 eth0 0.0.0.0/0 0.0.0.0/0
>
> If you are worried about knowing which rule you want to read the
> counters on, use the comment match extension that will allow you to put
> a comment / string to flag on in the output. This will allow you to grep
> for that line of output.
>
> There might even be some way via /proc or /sys to find what you are
> asking, but I don't know.
>
>
>
> Grant. . . .
> --
I was interested in knowing programmatic way as the performance is of 
utmost importance to me.

Seenu.

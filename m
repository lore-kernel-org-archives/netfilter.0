From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: More ethernet port same ip address
Date: Tue, 22 Jul 2008 10:06:44 -0500
Message-ID: <4885F784.1050906@riverviewtech.net>
References: <48819901.6030604@unipex.it> <4884D160.7060701@unipex.it> <38db14850807220603p15221841g4fcfb72a2d91ddf0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <38db14850807220603p15221841g4fcfb72a2d91ddf0@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 07/22/08 08:03, Anatoly Muliarski wrote:
> I have just now the next working configuration:

<snip>

> arp_proxy is set on.
> Also you need to set up forwarding:
> echo 1 > /proc/sys/net/ipv4/ip_forward

*nod*

> + I recommend to clear firewall rules for testing purpose:
> iptables -F
> iptables -P INPUT ACCEPT
> iptables -P OUTPUT ACCEPT
> iptables -P FORWARD ACCEPT

Based on experience (shooting my self in the foot) I *strongly* 
recommend that you set the chain policies *BEFORE* flushing the table / 
chains.  Just think what will happen if the chain policy is DENY and you 
are trying to do this via an SSH connection.



Grant. . . .

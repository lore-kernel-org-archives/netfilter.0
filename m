From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: More ethernet port same ip address
Date: Tue, 22 Jul 2008 17:20:13 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0807221719400.23410@fbirervta.pbzchgretzou.qr>
References: <48819901.6030604@unipex.it> <4884D160.7060701@unipex.it> <38db14850807220603p15221841g4fcfb72a2d91ddf0@mail.gmail.com> <4885F784.1050906@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4885F784.1050906@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>


On Tuesday 2008-07-22 17:06, Grant Taylor wrote:
>> + I recommend to clear firewall rules for testing purpose:
>> iptables -F
>> iptables -P INPUT ACCEPT
>> iptables -P OUTPUT ACCEPT
>> iptables -P FORWARD ACCEPT
>
> Based on experience (shooting my self in the foot) I *strongly*
> recommend that you set the chain policies *BEFORE* flushing the
> table / chains.  Just think what will happen if the chain policy is
> DENY and you are trying to do this via an SSH connection.

I strongly recommend you set the policies WHILE flushing the table.

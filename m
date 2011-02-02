From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Double rules for using NETFLOW?
Date: Wed, 02 Feb 2011 11:56:26 -0600
Message-ID: <4D499ACA.2040603@riverviewtech.net>
References: <4D492B87.5050008@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D492B87.5050008@linux.vnet.ibm.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 2/2/2011 4:01 AM, Srinivasa T N wrote:
> I am using ipt_NETFLOW 1.7 on my RHEL 6 (2.6.32) box. Now if I want to
> accept packet destined for some port and at the same time I want it to
> be accounted also, then I have to use the following rules:

I take it that the accounting you want is more than the simple packet / 
byte counters that already exist.

> iptables -A INPUT --dport <portnum> -j NETFLOW
> iptables -A INPUT --dport <portnum> -j ACCEPT
>
> This makes that every packet that I accept should have two rules (one
> for accepting and one for accounting). Don't you people think that it
> will increase the number of rules a packet has to traverse? Or is my
> understanding wrong?

You could do something like this:

iptables -N myChain
iptables -A myChain -j NETFLOW
iptables -A myChain -j ACCEPT

iptables -A INPUT --dport <portnum> -j myChain

Doing this will reduce the number of matches that have to be performed 
and allow the (sub)chain to simply apply actions to the packets.

This might seem like over kill with your simple example, but when you 
start putting multiple matches on each rule, or have more actions in 
sequence (i.e. LOG) you start gaining more quickly.  Further if you have 
other rules that are matching other packets, they will not have to 
traverse the condition that they will not match more than one time.

IPTables gives you a skeleton that you can do a lot of different things 
in.  It's really up to you how you put it together and how you optimize 
rule traversal.

In some ways I could liken IPTables (and brethren) to a simple 
programming language.  As such, it's not the language its self that is 
the limitation, just your imagination on how you use said language.  :-)



Grant. . . .

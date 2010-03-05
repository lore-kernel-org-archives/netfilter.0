From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: iptable rule addition has no effect .
Date: Fri, 05 Mar 2010 10:32:51 +0100
Message-ID: <4B90CFC3.7070409@chello.at>
References: <cfeab66d1003042133r1ed729b4rfe6569e000643bc4@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cfeab66d1003042133r1ed729b4rfe6569e000643bc4@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 05.03.2010 06:33, netfilter-owner@vger.kernel.org wrote:
> i m  flooding  an interface using hping with UDP packets .
> 
> I have a rule
> 
>     iptables -A INPUT -p udp -j DROP
> 
> I can see all packets are getting dropped . i can see processor
> utilization is high using "top" command and system becomes slow .
> 
> But while flooding , if  i add rule
> 
> iptables -I INPUT -j ACCEPT .
> 
> still packets gets dropped .
> 
>  But if i  stop flooding and start hping again { with same rules }  ,
> packets are accepted .
> 
> Note : I am working on an embedded enviornement  with 128kB of RAM .
> 
> any hints is really appreciated .

> 

guessing:
could it be you use conntrack, and nf_conntrack_max is reached?


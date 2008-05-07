From: lists+netfilter@roth.lu
Subject: Re: viewing rules and traffic while inserting/removing rules
Date: Wed, 07 May 2008 23:29:28 +0200
Message-ID: <48221F38.9080800@roth.lu>
References: <4821E655.4010504@roth.lu> <090801c8b07c$fa084b60$5000040a@skathlaptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <090801c8b07c$fa084b60$5000040a@skathlaptop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Steven Kath wrote:
> Have you considered using netfilter's ip sets for this?  Sounds like it
> might be perfect for your needs. 
>
> http://www.netfilter.org/projects/ipset/ 
>   
Yes, if it was right in the kernel (without patch-o-matic) I agree it 
would be the way to go ;)

Jan Engelhardt wrote:
> Each invocation of iptables retrieves and writes the rule table back
> into the kernel, which is very antiperformant. You want to be using
> iptables-restore here to minimize any delays.
You mean building a file and then using 'iptables-restore -n < file' ? I 
will take a look at it. Thanks.

From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: NAT on the same network
Date: Wed, 28 May 2008 20:04:39 -0500
Message-ID: <483E0127.4070301@riverviewtech.net>
References: <1212005433.483dbc39ef035@www.versateladsl.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1212005433.483dbc39ef035@www.versateladsl.be>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 05/28/08 15:10, Matton wrote:
> I ave an mail server who can only receive mail from mail-relay for 
> adresses rewriting. Then I build rules to forward connection to the 
> mail-relay if the source is not the mail-relay.

<snip>

> From proxy2 y ave the connection on the mail-server, fine. for other 
> machine I ave a log for the PREROUTING the log for the POSTROUTING 
> but the connection c'ant be up to the mail-relay ( proxy2 )

Let me see if I understand what you are wanting to do correctly or not. 
  It sounds like you are wanting to DNAT any traffic to any SMTP server 
to a specific SMTP server with in your network with the exception of the 
target SMTP server in your network.

In other words redirect any SMTP traffic over to "Bob" unless the source 
is "Bob" and then let "Bob" send to who ever he wants to.

> What can I do ?

You are close with your DNATing rules except for the fact that when 
"Bob" replies to "Tom" (who is on your network) "Bob's" reply will not 
pass through the system that did the redirecting.  This means that "Tom" 
will see a packet from "Bob" that he has no idea where it came from and 
as such hang up on "Bob".

To make this work, you need to SNAT the traffic that is being redirected 
to "Bob" as well as DNATing to "Bob".  This will make "Bob" think the 
traffic came from the system that did the redirecting and as such reply 
to the system that did the redirecting.  When the system that did the 
redirecting gets "Bob's" reply, it will send it back to "Tom" who sent 
the original request that got redirected.

> Thanks for your help

*nod*



Grant. . . .

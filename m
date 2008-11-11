From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: using iptables to deny ipsec connections
Date: Mon, 10 Nov 2008 19:10:37 -0600
Message-ID: <4918DB8D.8010503@riverviewtech.net>
References: <S1752377AbYKKAIu/20081111000850Z+3277@vger.kernel.org> <D50E2D13-F2E8-4830-883A-9495D904A96D@nd.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <D50E2D13-F2E8-4830-883A-9495D904A96D@nd.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/10/2008 6:22 PM, Eric Lease Morgan wrote:
> How do I use iptables to deny IPSEC connections?

I'm not 100% sure, but I think you can block ESP, IP protocol 50.

> I am running iptables v1.3.8 on Fedora 5. On a regular basis a remote 
> host connects to my machine and gobbles up more than 3 MB/sec of 
> bandwidth, makes my swap space almost full, and always seems to be 
> associated with a second, remote machine. Not only is this irritating 
> but it is also embarrassing. I'm not sure, but I think remote machine 
> one is talking to remote machine two.

Do you have any thing IPSec related installed or in kernel?  (I don't 
use Fedora so I don't know what the default is.)

I find it very unlikely that one (or more) unknown system(s) are 
successfully negotiating an IPSec connection to your system with out 
your knowledge and help.  About the only way that I can see this 
happening is if your security has been breached and someone else with 
knowledge of IPSec set it up.

> I have a rule in /etc/sysconfig/iptables that looks like this (with IP 
> changed to protect the guilty):
> 
>   -A RH-Firewall-1-INPUT -s 123.456.789.109 -j REJECT
> 
> I believe this rule says, "Reject any connections coming from 
> 123.456.789.109", but after I restart iptables the connections persist.

Well, the simple act of matching based on the source and rejecting is 
correct.  However, like I said above, I don't know any thing about 
Fedora so I can't say any thing to the RH-Firewall-1-INPUT chain being 
referenced.

Also, does the rule persist after you restart your firewall, or is it 
getting flushed out when you restart the firewall?

> Using ntop as my diagnostic tool, I see that 0% of the connections from 
> 123.456.789.109 are IP-based but rather IPSEC-based. (Does such a thing 
> make sense?)

Well, IPSec's ESP rides on top of IP, so, I'm not quite sure why this is 
worded the way that it is.

> How do I either: 1) deny any access to my machine from 123.456.789.109, 
> or 2) deny any connections that are IPSEC-based because I have no such 
> need for IPSEC, I think. What is host 123.456.789.109 exploiting?

A simple IPTables rule like above /should/ do what you are wanting.  I 
have a feeling that something else here is in play here with out your 
knowledge.

Do you have a capture of any of the traffic?



Grant. . . .

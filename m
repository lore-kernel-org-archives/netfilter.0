From: Bill Chappell <chappewr@critical.com>
Subject: Re: using iptables to deny ipsec connections
Date: Thu, 13 Nov 2008 12:49:49 -0500
Message-ID: <491C68BD.7050107@critical.com>
References: <S1752377AbYKKAIu/20081111000850Z+3277@vger.kernel.org> <D50E2D13-F2E8-4830-883A-9495D904A96D@nd.edu> <4918DB8D.8010503@riverviewtech.net> <3BF8F7DB-146E-4B24-9323-967DD9AC153E@nd.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3BF8F7DB-146E-4B24-9323-967DD9AC153E@nd.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Addition to previous response:

Besides INPUT (and OUTPUT), put your rules
in FORWARD.
If an internal box is involved, too, traffic
to and from it will be in the FORWARD chain.

Bill Chappell


Eric Lease Morgan wrote:
> 
> On Nov 10, 2008, at 8:10 PM, Grant Taylor wrote:
> 
>>> How do I use iptables to deny IPSEC connections?
>>
>> I'm not 100% sure, but I think you can block ESP, IP protocol 50.
> 
> 
> Thank you for the prompt reply, but I have not been able to resolve my 
> problem. I still have a remote host that seems to be connecting to my 
> machine, doing something, and communicating with another machine. I am 
> unable to determine what port they are using, nor what application they 
> are running. Frustrating and embarrassing.
> 
> I believe I have turned off IP protocol 50:
> 
>   -A RH-Firewall-1-INPUT -p 50 -j REJECT
> 
> 
>>> I am running iptables v1.3.8 on Fedora 5. On a regular basis a remote 
>>> host connects to my machine and gobbles up more than 3 MB/sec of 
>>> bandwidth, makes my swap space almost full, and always seems to be 
>>> associated with a second, remote machine. Not only is this irritating 
>>> but it is also embarrassing. I'm not sure, but I think remote machine 
>>> one is talking to remote machine two.
>>
>> Do you have any thing IPSec related installed or in kernel?  (I don't 
>> use Fedora so I don't know what the default is.)
> 
> I'm sorry, but I do not know how to check whether or not anything 
> related to IPSec is installed or in kernel.
> 
> 
> 
>>> I have a rule in /etc/sysconfig/iptables that looks like this (with 
>>> IP changed to protect the guilty):
>>>  -A RH-Firewall-1-INPUT -s 123.456.789.109 -j REJECT
>>> I believe this rule says, "Reject any connections coming from 
>>> 123.456.789.109", but after I restart iptables the connections persist.
>>
>> Well, the simple act of matching based on the source and rejecting is 
>> correct.  However, like I said above, I don't know any thing about 
>> Fedora so I can't say any thing to the RH-Firewall-1-INPUT chain being 
>> referenced.
>>
>> Also, does the rule persist after you restart your firewall, or is it 
>> getting flushed out when you restart the firewall?
> 
> The offending host seems to go by three identities, a name and two IP 
> addresses:
> 
>   * host-50-65-23-65.ussignalcom.net
>   * 65.23.65.50
>   * 208.69.36.132
> 
> At the beginning of my /etc/sysconfig/iptables file I have put the 
> following, and restarted iptables, but the diagnostic tool I am using 
> (ntop) still reports connections from the host:
> 
>   -A RH-Firewall-1-INPUT -s 65.23.65.50 -j REJECT
>   -A RH-Firewall-1-INPUT -s 208.69.36.132 -j REJECT
> 
> Ironically, when I use netstat (netstat -a) I do not see any of the 
> three hosts, above, listed. Yes, when I do something like iptables 
> --list the hosts are listed as being rejected, but the IP addresses are 
> being translated into domain names:
> 
>   REJECT all -- host-50-65-23-65.ussignalcom.net anywhere reject-with 
> icmp-port-unreachable
> 
> 
>> Do you have a capture of any of the traffic?
> 
> I'm sorry, but I do not know how to capture the traffic. Can you tell me 
> how to do this?
> 
> In short, I seem to have some host (host-50-65-23-65.ussignalcom.net) 
> connecting to my computer, running an unknown process, and sending 
> output to a second host (artemis49.hitherward.info). How can I see more 
> directly what is going on here and stop it?
> 

-- 
William Chappell, Software Engineer, Critical Technologies Inc.
* Creativity * Diversity * Expertise * Flexibility * Integrity *
Suite 400 Technology Center, 4th Floor 1001 Broad St, Utica NY 13501
315-793-0248 x148 FAX -9710 <bill.chappell@critical.com> www.critical.com

From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: iptables - Trying to understand "no longer support implicit source
 local NAT"
Date: Mon, 06 Apr 2009 23:51:30 +0200
Message-ID: <49DA7962.6050600@chello.at>
References: <BLU149-W20F12BA9B98E9D4E82C7CBA3960@phx.gbl> <49C2A535.1040700@kis.keele.ac.uk>    <BLU149-W849B5068E4BA2E436CB5E8A3960@phx.gbl>   <BLU149-W19F71A94268C5665748337A3910@phx.gbl>  <BLU149-W50503F474EE1377D0A838A3840@phx.gbl> <BLU149-W698B4E09B730ADF7B6660A3840@phx.gbl>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BLU149-W698B4E09B730ADF7B6660A3840@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

netfilter-owner@vger.kernel.org wrote:
>> * bump *
>>
>> There must be someone out there who knows why this message is written out. Have I sent this inquiry to the correct list? Should I send this to the devel list instead?
>>
>> Perhaps I should submit this as a bug.
>>     
>  
>  
> My apologies.  It would appear that I either goofed my e-mail somehow or threads don't survive the transition from one month to the next (this question is 2.5 weeks old now).
>  
> Here is the content of my original question:
>  
>  
> -----
> List:       netfilter
> Subject:    iptables - Trying to understand "no longer support implicit source
> From:       Data Shock 
> Date:       2009-03-19 19:43:03
> Message-ID: BLU149-W20F12BA9B98E9D4E82C7CBA3960 () phx ! gbl
> -----
>  
> Hello,
>  
> I have been trying to understand a new error message I've been seeing
> since I updated to a new version of Linux.  The message is:  "kernel:
> NAT: no longer support implicit source local NAT".  It shows up once in
> /var/log/messages, and on my console screen, when the offending rule is
> used for the first time.
>  
> I've had a heck of a time trying to
> find any information at all about this change.  I can't seem to find
> any definitive post/thread about the reason for the change and what to
> do about the message.  I've searched the mail archives, the
> documentation, and googled for hours.
>  
> Here is my situation:
>  
> My linux box has a finicky program (let's call it the "Sender") on it that
> refuses to send to 127.0.0.1.  However, I have another program running
> on that same box that needs to receive the UDP traffic from the
> Sender.  We'll call that one the "Receiver".  These two programs must
> reside on the same device.
>  
> So to get around this software quirk,
> the Sender is configured with a bogus destination address.  I then have
> the following iptables NAT rules to dnat the UDP packets to the local
> address:
>  
> *nat
> -A POSTROUTING -d 127.0.0.1 -p udp -m udp --dport 1234 -j SNAT --to-source 127.0.0.1
> -A OUTPUT -p udp -m udp --dport 1234 -j sendtolocal
> -A sendtolocal -d 10.1.2.3 -j DNAT --to-destination 127.0.0.1
>  
>  
> A few notes:
> 1) The "sendtolocal" chain was made for ease of modifying the DNAT rule
> programatically since the bogus address can change at any time.  (The
> whole chain can be cleared and a new rule added in its place).
> 2) I am explicitly SNAT-ing the packet to 127.0.0.1 (it gets discarded otherwise)
> 3) The bogus address in this example is 10.1.2.3
> 4) The communication is one way, so the Sender does not expect replies from the Receiver.
>  
>  
> This set up worked fine previously, and curiously, still seems to work fine despite the error message.
>  
> >From what I've read, I'm guessing that iptables complains when the source
> address of the original packet doesn't match the address that will be
> used to route the packet to its new destination.  That's fine, but I'm
> SNAT-ing it myself.  Is it really necessary to spit out a message like
> that when no actual error occured?  I'm sure I'm missing something here.
>  
> So the questions are:
> 1) What the heck was the actual reason and impact of the change?
> 2) What can I do to stop the error message?
> 3) Am I actually doing anything wrong with my rules?
>  
> I sure hope someone can help me.
>  
>  
> Many thanks,
>  
> Frank
>
>   
Hello,

I'm not 100% sure, but maybe the REDIRECT target is of use for that 
particular case:

from `man iptables':

   REDIRECT
       This  target  is  only  valid  in the nat table, in the 
PREROUTING and OUTPUT chains, and user-defined chains which are only 
called from those chains.  It
       redirects the packet to the machine itself by changing the 
destination IP to the primary address of the incoming interface 
(locally-generated packets  are
       mapped to the 127.0.0.1 address).  It takes one option:

       --to-ports port[-port]
              This  specifies  a  destination port or range of ports to 
use: without this, the destination port is never altered.  This is only 
valid if the rule
              also specifies -p tcp or -p udp.


Greets

Mart

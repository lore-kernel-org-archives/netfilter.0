From: Data Shock <datashock@hotmail.com>
Subject: RE: iptables - Trying to understand "no longer support implicit
 source local NAT"
Date: Mon, 6 Apr 2009 17:52:09 -0400
Message-ID: <BLU149-W292E6B73061694354D1B53A3840@phx.gbl>
References: <BLU149-W20F12BA9B98E9D4E82C7CBA3960@phx.gbl>
 <49C2A535.1040700@kis.keele.ac.uk>
    <BLU149-W849B5068E4BA2E436CB5E8A3960@phx.gbl>
   <BLU149-W19F71A94268C5665748337A3910@phx.gbl>
  <BLU149-W50503F474EE1377D0A838A3840@phx.gbl>
 <BLU149-W698B4E09B730ADF7B6660A3840@phx.gbl>
 <49DA5AEE.5010902@mailinator.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49DA5AEE.5010902@mailinator.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hi Mike,

Thank you for the reply.  I have added my comments into your message.


>
> I'm not certain about the meaning of "implicit source local NAT" but the
> second rule may be the culprit. Rather than imply 127.1 perhaps the
> rule needs to specifically mention the source IP: e.g.
>
> -A OUTPUT -s 127.0.0.1 -p udp -mudp --dport 1234 -j sendtolocal


Unfortunately, that won't work because the source address at this point in the chain is not actually 127.0.0.1, but an outside interface, so it won't match the rule.  I did try replacing "127.0.0.1" in your suggested rule with the external interface, and that did function.  However I still see the message "NAT: no longer support implicit source local NAT" in /var/log/messages.


That error message (warning, friendly reminder, nagging pain in the fanny?) actually seems to happen the first time the "sendtolocal" chain is traversed.  It doesn't seem to be about matching the source address.  It seems to be complaining about changing the destination address without changing the source address.  However, I have a POSTROUTING rule that does the SNAT.  If I could SNAT from an OUTPUT chain I would, but that's not allowed.  SNAT has to be in the POSTROUTING chain.

I believe it is complaining about something a later chain is about to do anyway.  It's like a preemptive nag, assuming you are going to mess up.  Since you can't SNAT in the OUTPUT chain, how the heck can I get around this?


>
> Out of curiosity, does the following work and not produce an error?
>
> *nat
> -A PREROUTING -p udp --dport 1234 -j DNAT --to-destination 127.0.0.1
> -A POSTROUTING -p udp --sport 1234 -j SNAT --to-source 10.1.2.3


The first PREROUTING rule won't match because the packets are generated locally, and thus don't traverse the PREROUTING chain.  It must be a rule on the OUTPUT chain.

The second rule doesn't really make a difference.  I get this error message if that rule is there, not there at all, or if there is one like my original (which SNATed to 127.0.0.1).



I really appreciate the response Mike.  I'm beginning to lean towards entering a bug for this.

Perhaps our comments will help to get the conversation going.  :)


-Frank


_________________________________________________________________
Quick access to your favorite MSN content and Windows Live with Internet Explorer 8. 
http://ie8.msn.com/microsoft/internet-explorer-8/en-us/ie8.aspx?ocid=B037MSN55C0701A
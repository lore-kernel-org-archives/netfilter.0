From: <tsh@mrc-lmb.cam.ac.uk>
Subject: Re: Port Scanner
Date: Wed, 5 Nov 2003 16:38:10 +0000 (GMT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311051638.hA5GcAI48932@alf1.lmb.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Not particularly packets of this type, but e.g. to put a rate-limit
on incoming NEW connections, in order to help prevent a DoS attack
on, say, a webserver or mailhub. 
It would be nice if the limit module was adaptive, and only flagged
ips which were exceeding the rate, otherwise it seems to me that
the same effect as a DoS attack can be achieved simply by sending
packets at a sufficient rate to trigger the limit cut-off, which
would then block *all* packets until the flow reduced.
Even with a seperate rule for each server, all NEW connections
to that server would still be blocked if the limit was exceeded.

Cheers,
T.


>> I was thinking about just this the other night, and is seems to me that
>> such a rule should be rejecting stuff which exceeds the rate limit rather
>> than accepting stuff which doesnt exceed it, since the -j ACCEPT will mean
>> that any subsequent rules in a FORWARD table wont be tested.
>>
>> Something like
>>
>> iptables -A FORWARD -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit ! limit
>> 1/s -j DROP
>
>Why do people want to ACCEPT any packets of this type at all?   If a packet 
>is part of an ESTABLISHED connection then it is going to pass through your 
>FORWARD chain on the connection tracking rule; if a packet is not part of an 
>ESTABLISHED connection, then it's either a valid new connection (in which 
>case you ACCEPT it), or else it isn't (in which case you don't ACCEPT it).
>
>I can't quite see why you would want to accept even a slow rate of such 
>>packets.
>
>Regards,
>
>Antony.

-- 

This email is intended for the use of the individual addressee(s) named above 
and may contain information that is confidential, privileged or unsuitable 
for overly sensitive persons with low self-esteem, no sense of humour, or 
irrational religious beliefs.

If you have received this email in error, you are required to shred it 
immediately, add some nutmeg, three egg whites and a dessertspoonful of 
caster sugar. _ Whisk until soft peaks form, then place in a warm oven for 40 
minutes. _ Remove promptly and let stand for 2 hours before adding some 
decorative kiwi fruit and cream. _ Then notify me immediately by return email 
and eat the original message.
                                                     Please reply to the list;
                                                           please don't CC me.


----- End of forwarded message from Antony Stone -----


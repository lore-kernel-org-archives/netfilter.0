From: <tsh@mrc-lmb.cam.ac.uk>
Subject: Re: Port Scanner
Date: Wed, 5 Nov 2003 15:06:55 +0000 (GMT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311051507.hA5F74O37678@alf1.lmb.internal>
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

I was thinking about just this the other night, and is seems
to me that such a rule should be rejecting stuff which exceeds the rate
limit rather than accepting stuff which doesnt exceed it,
since the -j ACCEPT will mean that any subsequent rules in
a FORWARD table wont be tested.

Something like

iptables -A FORWARD -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit ! limit 1/s -j DROP

Cheers,
Terry





>> On Wednesday 05 November 2003 2:14 pm, Leandro Takashi Hirano wrote:
>>
>>> How does this rule work?
>>>
>>> iptables -A FORWARD -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit
>>> ?limit 1/s -j ACCEPT
>>
>> It means that any packets which have the RST flag set, and the SYN, ACK,
>> FIN  flags cleared, will only be allowed *through* the firewall at a
>> maximum rate  of one packet per second.
>>
>>> Is it safe to use only this rule to avoid port scanners?
>>
>> Depends what you mean by "safe" and "avoid" :)
>>
>> Here are some observations on the above rule:
>>
>> 1. It is in the FORWARD chain, therefore it has no effect on people port
>>  scanning the firewall itself (it would need to be in the INPUT chain to
>>  affect that).
>>
>> 2. One packet per second will be ACCEPTed.   What happens to the other
>> packets (and whether anything gets returned to the scanner) depends on
>> the  other rules following this one in the chain.
>
>
>OK, one packet per second will be ACCEPTed, but aren_t the other packets
>going to be DROPed?
>
>
>
>>
>> 3. The rule only applies to packets with RST set, and SYN, ACK, FIN
>> clear.    Therefore it will incfluence the outcome of a RST port scan,
>> but have no  effect on a FIN scan, or a SYN scan.
>>
>
>Do I have also to create a rule for FIN scan and SYN scan?
>Do you have some port scanners rules to show me? (and other protection
>rules too)
>
>And thanks very much for the help!!!
>
>> I think in order to answer your question we first need to know:
>>
>>  - what response do you want someone to get when they attempt to port
>> scan
>> your system?
>>
>
>no answer....
>
>> Regards,
>>
>> Antony.
>>
>>
>> --
>>
>> "It is not the strongest of the species that survive, nor the most
>> intelligent, but the ones most responsive to change."
>>
>>  - Charles Darwin
>>                                                      Please reply to the
>> list;
>>                                                            please don't
>> CC me.
>




----- End of forwarded message from Leandro Takashi Hirano -----


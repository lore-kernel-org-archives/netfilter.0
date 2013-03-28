From: Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: Re: [libvirt] [PATCH v3] nwfilter: probe for inverted ctdir
Date: Thu, 28 Mar 2013 13:55:09 -0400
Message-ID: <515483FD.9060608@linux.vnet.ibm.com>
References: <514CC114.8090508@linux.vnet.ibm.com> <51518DB3.7070505@linux.vnet.ibm.com> <51531EB2.4070102@laine.org> <515333F3.4020001@redhat.com> <51539861.1000209@linux.vnet.ibm.com> <51542545.2050301@linux.vnet.ibm.com> <5154556D.5050008@laine.org> <51545989.6050908@linux.vnet.ibm.com> <20130328171732.GB8859@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20130328171732.GB8859@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Laine Stump <laine@laine.org>, Eric Blake <eblake@redhat.com>, libvirt <libvir-list@redhat.com>, netfilter@vger.kernel.org

On 03/28/2013 01:17 PM, Pablo Neira Ayuso wrote:
> On Thu, Mar 28, 2013 at 10:54:01AM -0400, Stefan Berger wrote:
>> On 03/28/2013 10:36 AM, Laine Stump wrote:
>>> For reference of people new to this thread, here is the start of the thread:
>>>
>>>    https://www.redhat.com/archives/libvir-list/2013-March/msg01403.html
>>>
>>> This concerns changes to libvirt to cope with the newly discovered (by
>>> us :-) difference in interpretation of ctdir by different versions of
>>> netfilter.
>>>
>>> On 03/28/2013 07:11 AM, Stefan Berger wrote:
>>>> On 03/27/2013 09:09 PM, Stefan Berger wrote:
>>>>> On 03/27/2013 02:01 PM, Eric Blake wrote:
>>>>>> On 03/27/2013 10:30 AM, Laine Stump wrote:
>>>>>>> My opinion is that the patch we should apply should be a simple patch
>>>>>>> that just removes use of --ctdir. According to the netfilter developer
>>>>>>> who responded to the thread on libvirt-users, it doesn't add any extra
>>>>>>> security not already provided by conntrack:
>>>>>>>
>>>>>>> https://www.redhat.com/archives/libvirt-users/2013-March/msg00121.html
>>>>>>> https://www.redhat.com/archives/libvirt-users/2013-March/msg00128.html
>>>>>>>
>>>>>>> Not being an expert on netfilter internals, I can't dispute his claim.
>>>>>>>
>>>>>>> Does anyone else have an opinion?
>>>>>> What filters specifically caused the use of --ctdir, and are they
>>>>>> broken
>>>>>> if we omit the use of --ctdir?
>>>>> It depends on how you write the filters that the --ctdir is being used.
>>>>>
>>>>> iirc: The effect of the --ctdir usage is that if one has an incoming
>>>>> rule and and outgoing rule with the same IP address on the 'other'
>>>>> side the check for an ESTABLISHED state is not enough to ACCEPT the
>>>>> traffic, if one was to remove one of the rules while communication in
>>>>> both directions was occurring and an immediate cut of the traffic in
>>>>> one way was expected. The effect so far was that if the rule for the
>>>>> incoming rule was removed it would cut the incoming traffic
>>>>> immediately while the traffic in outgoing direction was
>>>>> uninterrupted. I think that if we remove this now the traffic in both
>>>>> directions will continue. I will verify tomorrow.
>>>> Verified. I have a ping running from the VM to destination 'A' and
>>> >from 'A' to the VM. The --ctdir enforces the direction of the traffic
>>>> and if one of the following rules is removed, the ping is immediately
>>>> cut.
>>>>
>>>>    <rule action='accept' direction='out' priority='500'>
>>>>      <icmp/>
>>>>    </rule>
>>>>    <rule action='accept' direction='in' priority='500'>
>>>>      <icmp/>
>>>>    </rule>
>>>>
>>>> The ping is not cut anymore upon removal of one of the above rules if
>>>> --ctdir was to be removed entirely.
>>> Okay, as I understand from your description, the difference is that when
>>> a ping in one direction is already in action, and you remove the rule
>>> allowing that ping, that existing ping "session" will continue to be
>>> allowed *if* there is still a rule allowing pings in the other
>>> direction. Is that correct? I'm guessing that *new* attempts to ping in
>>> that direction will no longer be allowed though, is that also correct?
>>>
>>> For the benefit of Pablo and the other netfilter developers, can you
>>> paste the iptables commands that are generated for the two rules above?
>>> Possibly they can suggest alternative rules that have the desired effect.
>>
>> First off, there are multiple ways one can write the filtering rules
>> in nwfilter, either stateless or stateful:
>>
>> http://libvirt.org/formatnwfilter.html#nwfwrite
>>
>>
>> Thus the filter here is only one example how one can write a
>> stateful filter for traffic from/to a VM:
>>
>> <filter name='ctdirtest' chain='ipv4' priority='-700'>
>> <uuid>582c2fe6-569a-f366-58fb-f995f1a559ce</uuid>
>>    <rule action='accept' direction='out' priority='500'>
>>      <icmp/>
>>    </rule>
>>    <rule action='accept' direction='in' priority='500'>
>>      <icmp/>
>>    </rule>
>>    <rule action='drop' direction='inout' priority='500'>
>>      <all/>
>>    </rule>
>> </filter>
>>
>> The filter above creates the following types of rules -- some rules
>> are omitted that goto into these user-defined rules.
>>
>> Chain FI-vnet0 (1 references)
>>   pkts bytes target     prot opt in     out source
>> destination
>>      6   504 RETURN     icmp --  *      * 0.0.0.0/0
>> 0.0.0.0/0            state NEW,ESTABLISHED ctdir ORIGINAL
>>      0     0 RETURN     icmp --  *      * 0.0.0.0/0
>> 0.0.0.0/0            state ESTABLISHED ctdir REPLY
>>      0     0 DROP       all  --  *      * 0.0.0.0/0            0.0.0.0/0
> Conntrack is already internally validating that directions are correct
> for you, so no need for those --ctdir. Let me explain why:
>
> If conntrack gets an ICMP echo reply entering through the NEW state,
> it will consider it invalid since it is not coming as reply to an ICMP
> echo request.
[...]
>
> In sum: The --ctdir is not providing more security. We did not have it
> originally in the `state' match, it was a late extension to the
> conntrack match.
>
> My advice here: Just rely on conntrack states and drop invalid
> traffic, it will do the direction validation that you're trying to
> achieve with that rule-set.

I don't see that removing a filtering rule, as can be done by an 
nwfilter user, invalidates the connection tracking state so that a rule 
dropping upon INVALID state would then kick in. IMO the connection is 
still in ESTABLISHED state and thus will act on a rule checking on 
ESTABLISHED state. A simple test here:

iptables -I INPUT 1 -m state --state INVALID -j DROP
iptables -I INPUT 2 -p icmp -m state --state ESTABLISHED -j ACCEPT
iptables -I INPUT 3 -p icmp -j ACCEPT

Now ping that machine. Pings should work now

Following what you said

iptables -D INPUT -p icmp -j ACCEPT

should now cause the first rule to kick in for that ICMP stream now that 
the rule is gone. This is not the case with my machine and the ping 
simply continues -- in this case I have used a RHEL 6 installation with 
2.6.32 kernel.

IMO we still need --ctdir.

     Stefan


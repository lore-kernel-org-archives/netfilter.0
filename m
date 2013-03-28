From: Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: Re: [libvirt] [PATCH v3] nwfilter: probe for inverted ctdir
Date: Thu, 28 Mar 2013 10:54:01 -0400
Message-ID: <51545989.6050908@linux.vnet.ibm.com>
References: <514CC114.8090508@linux.vnet.ibm.com> <51518DB3.7070505@linux.vnet.ibm.com>	<51531EB2.4070102@laine.org> <515333F3.4020001@redhat.com> <51539861.1000209@linux.vnet.ibm.com> <51542545.2050301@linux.vnet.ibm.com> <5154556D.5050008@laine.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5154556D.5050008@laine.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Laine Stump <laine@laine.org>
Cc: Eric Blake <eblake@redhat.com>, libvirt <libvir-list@redhat.com>, Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

On 03/28/2013 10:36 AM, Laine Stump wrote:
> For reference of people new to this thread, here is the start of the thread:
>
>    https://www.redhat.com/archives/libvir-list/2013-March/msg01403.html
>
> This concerns changes to libvirt to cope with the newly discovered (by
> us :-) difference in interpretation of ctdir by different versions of
> netfilter.
>
> On 03/28/2013 07:11 AM, Stefan Berger wrote:
>> On 03/27/2013 09:09 PM, Stefan Berger wrote:
>>> On 03/27/2013 02:01 PM, Eric Blake wrote:
>>>> On 03/27/2013 10:30 AM, Laine Stump wrote:
>>>>> My opinion is that the patch we should apply should be a simple patch
>>>>> that just removes use of --ctdir. According to the netfilter developer
>>>>> who responded to the thread on libvirt-users, it doesn't add any extra
>>>>> security not already provided by conntrack:
>>>>>
>>>>> https://www.redhat.com/archives/libvirt-users/2013-March/msg00121.html
>>>>> https://www.redhat.com/archives/libvirt-users/2013-March/msg00128.html
>>>>>
>>>>> Not being an expert on netfilter internals, I can't dispute his claim.
>>>>>
>>>>> Does anyone else have an opinion?
>>>> What filters specifically caused the use of --ctdir, and are they
>>>> broken
>>>> if we omit the use of --ctdir?
>>> It depends on how you write the filters that the --ctdir is being used.
>>>
>>> iirc: The effect of the --ctdir usage is that if one has an incoming
>>> rule and and outgoing rule with the same IP address on the 'other'
>>> side the check for an ESTABLISHED state is not enough to ACCEPT the
>>> traffic, if one was to remove one of the rules while communication in
>>> both directions was occurring and an immediate cut of the traffic in
>>> one way was expected. The effect so far was that if the rule for the
>>> incoming rule was removed it would cut the incoming traffic
>>> immediately while the traffic in outgoing direction was
>>> uninterrupted. I think that if we remove this now the traffic in both
>>> directions will continue. I will verify tomorrow.
>> Verified. I have a ping running from the VM to destination 'A' and
>> from 'A' to the VM. The --ctdir enforces the direction of the traffic
>> and if one of the following rules is removed, the ping is immediately
>> cut.
>>
>>    <rule action='accept' direction='out' priority='500'>
>>      <icmp/>
>>    </rule>
>>    <rule action='accept' direction='in' priority='500'>
>>      <icmp/>
>>    </rule>
>>
>> The ping is not cut anymore upon removal of one of the above rules if
>> --ctdir was to be removed entirely.
> Okay, as I understand from your description, the difference is that when
> a ping in one direction is already in action, and you remove the rule
> allowing that ping, that existing ping "session" will continue to be
> allowed *if* there is still a rule allowing pings in the other
> direction. Is that correct? I'm guessing that *new* attempts to ping in
> that direction will no longer be allowed though, is that also correct?
>
> For the benefit of Pablo and the other netfilter developers, can you
> paste the iptables commands that are generated for the two rules above?
> Possibly they can suggest alternative rules that have the desired effect.


First off, there are multiple ways one can write the filtering rules in 
nwfilter, either stateless or stateful:

http://libvirt.org/formatnwfilter.html#nwfwrite


Thus the filter here is only one example how one can write a stateful 
filter for traffic from/to a VM:

<filter name='ctdirtest' chain='ipv4' priority='-700'>
<uuid>582c2fe6-569a-f366-58fb-f995f1a559ce</uuid>
   <rule action='accept' direction='out' priority='500'>
     <icmp/>
   </rule>
   <rule action='accept' direction='in' priority='500'>
     <icmp/>
   </rule>
   <rule action='drop' direction='inout' priority='500'>
     <all/>
   </rule>
</filter>

The filter above creates the following types of rules -- some rules are 
omitted that goto into these user-defined rules.

Chain FI-vnet0 (1 references)
  pkts bytes target     prot opt in     out source               
destination
     6   504 RETURN     icmp --  *      * 0.0.0.0/0            
0.0.0.0/0            state NEW,ESTABLISHED ctdir ORIGINAL
     0     0 RETURN     icmp --  *      * 0.0.0.0/0            
0.0.0.0/0            state ESTABLISHED ctdir REPLY
     0     0 DROP       all  --  *      * 0.0.0.0/0            0.0.0.0/0

Chain FO-vnet0 (1 references)
  pkts bytes target     prot opt in     out source               
destination
     0     0 ACCEPT     icmp --  *      * 0.0.0.0/0            
0.0.0.0/0            state ESTABLISHED ctdir REPLY
     0     0 ACCEPT     icmp --  *      * 0.0.0.0/0            
0.0.0.0/0            state NEW,ESTABLISHED ctdir ORIGINAL
    53  3235 DROP       all  --  *      * 0.0.0.0/0            0.0.0.0/0

Chain HI-vnet0 (1 references)
  pkts bytes target     prot opt in     out source               
destination
     0     0 RETURN     icmp --  *      * 0.0.0.0/0            
0.0.0.0/0            state NEW,ESTABLISHED ctdir ORIGINAL
     0     0 RETURN     icmp --  *      * 0.0.0.0/0            
0.0.0.0/0            state ESTABLISHED ctdir REPLY
     0     0 DROP       all  --  *      * 0.0.0.0/0            0.0.0.0/0


Those may not be the most efficient rules, yet they provide the 
possibility to remove a rule from the XML and cut the connection 
immediately due to the ctdir usage.

>
> If they have no alternatives, then I do now agree that we shouldn't just
> scrap --ctdir. Then we have two choices:
>
> 1) take your patch, which hopefully will successfully guess the polarity
> of --ctdir correctly in all cases.

Why 'guess' -- it 'probes' for it and does actual testing.

>
> 2) switch unconditionally to the new "correct" polarity of --ctdir,
> release-note the heck out of it, and require that any distro with a
> kernel old enough to have the old style --ctdir backport at least the
> one patch to netfilter to change that.

Not a good idea IMHO because it would break on older kernels.

>
> My comments about (1): while I'll again say that the patch truly is
> poetic in its ability to overcome obstacles, it's really a workaround
> for a bug, and as time goes on will become less and less relevant (and
> more and more difficult to explain/rationalize). I really think I would
> prefer to be broken on very old distros rather than have that patch in
> the tree (although others may have a different opinion, and I would
> gracefully withdraw my objection in that case).
>
> About (2): Fedora at least as far back as F16 has a new enough
> kernel/iptables (iptables-1.4.12) that it uses the new polarity for
> --ctdir, and no older Fedora is supported. RHEL6 and CentOS6 still have
> iptables-1.4.7, so they have the old polarity. I'd be willing to bet
> that RHEL6 would take the netfilter patch to change --ctdir; of course
> that would leave us with temporary brokenness for anybody who upgraded
> their kernel without upgrading libvirt, or vice-versa.

You not only need to convert the filtering rules (and only do it once) 
but also re-program the users minds that may be used to that odd mixup 
of directions.


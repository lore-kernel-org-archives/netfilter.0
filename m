From: Mike Wright <mike.wright@mailinator.com>
Subject: Re: Port forwarding with iptables on tunnel interface
Date: Fri, 12 Feb 2010 11:56:51 -0800
Message-ID: <4B75B283.1040300@mailinator.com>
References: <1265912094.2985.44.camel@tesla.lan>	 <4B745327.9020806@trash.net> <1265916014.2985.72.camel@tesla.lan>	 <4B74E736.2020307@trash.net> <1265981292.2980.67.camel@tesla.lan>	 <4B756895.2060106@trash.net> <1265995841.2980.125.camel@tesla.lan>	 <4B75A5A5.1000402@mailinator.com> <1266002586.2980.135.camel@tesla.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1266002586.2980.135.camel@tesla.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Guido Trentalancia <guido@trentalancia.com>
Cc: Mike Wright <mike.wright@mailinator.com>, netfilter@vger.kernel.org

Guido Trentalancia wrote:
> Ciao Mike !
> 
> On Fri, 2010-02-12 at 11:01 -0800, Mike Wright wrote:
>> Guido Trentalancia wrote:
>>> Hello again !
>>>
>>> There are two things that look odd to me:
>>>
>>> 1) packets on port 25 are correctly forwarded (after decapsulation) to
>>> the redirected host on the 192.168.3.0 network *but* nothing goes back
>>> on the same network on port 25 (i.e. from interface eth0 to tunl0);
>>> 2) there is a very strange and very long MAC entry in the PREROUTING log
>>> for IN=tunl0.
>>>
>>> I have tried using the target TRACE, but it doesn't help much. I've got
>>> plenty of LOG targets disseminated everywhere that TRACE doesn't add
>>> anything. But again, I can't see POSTROUTING from the host where packets
>>> are being forwarded and I can't see replies going back on eth0 from that
>>> same machine (the sendmail machine) to the iptables machine.
>>>
>>> I also forgot to attach the iptables rules in my previous message, but
>>> here you go:
>>>
>>> *raw
>>> :PREROUTING ACCEPT [0:0]
>>> :OUTPUT ACCEPT [0:0]
>>> -A PREROUTING -p tcp --dport 25 -j TRACE
>>> -A PREROUTING -p tcp --dport 25 -j TRACE
>>> COMMIT
>>> *nat
>>> :PREROUTING ACCEPT [0:0]
>>> :OUTPUT ACCEPT [0:0]
>>> :POSTROUTING ACCEPT [0:0]
>>> -A PREROUTING -p tcp --dport 25 -j LOG --log-prefix "PREROUTING: "
>>> -A PREROUTING -p tcp --dport 25 -j DNAT --to-destination 192.168.3.69
>>> -A PREROUTING -p tcp --dport 587 -j DNAT --to-destination 192.168.3.69
>>> -A OUTPUT -p tcp --dport 25 -j LOG --log-prefix "OUTPUT: "
>>> -A OUTPUT -p tcp --dport 25 -j DNAT --to-destination 192.168.3.69
>>> # The following rule is not related, it's masquerading for another
>>> network...
>>> -A POSTROUTING -o eth0 -s 192.168.4.0/24 -j MASQUERADE
>>> -A POSTROUTING -p tcp --dport 25 -j LOG --log-prefix "POSTROUTING: "
>>> -A POSTROUTING -o eth0 -p tcp --dport 25 -j MASQUERADE
>>> -A POSTROUTING -o eth0 -p tcp --dport 587 -j MASQUERADE
>>> #-A POSTROUTING -o eth0 -p tcp --dport 25 -j SNAT --to-source
>>> 192.168.3.64
>>> #-A POSTROUTING -o eth0 -p tcp --dport 587 -j SNAT --to-source
>>> 192.168.3.64
>>> COMMIT
>> <snip />
>>
>> Salve, Guido.  I gave this a verrrry quick glance and off the top of my 
>> head I think something looks fishy in the POSTROUTING rules.
>>
>> In the PREROUTING you are selecting based on the *destination* port.  On 
>> the return trip shouldn't POSTROUTING use *source* port?
> 
> Hold on a second. The originating caller expects a reply on *its 25
> port*. Therefore my originating port could be everything and usually is
> an high port (> 1024) different than 25, but the important is that the
> destination port is 25 because there is the caller waiting a reply. 
> 
> Therefore even in the case of SNAT, I am selecting the destination port.
> 
> Do you convene with me now ?

Yes, indeed.  It seems I have my brain in backwards ;D

Buona fortuna !

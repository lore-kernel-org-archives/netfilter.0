From: "Ilo Lorusso" <sneak@ipnoc.co.za>
Subject: Re: Redirecting mail
Date: Fri, 8 Apr 2005 13:43:45 +0200
Message-ID: <001801c53c30$386ecf10$648045ac@sneak>
References: <MS_LEU1tDJt12e1s8HA000007ef@smtp.ttp.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

this is strange...


Ive got another mailserver 172.24.128.56 ..
now if I put that rule in

 iptables -t nat -A OUTPUT -p tcp -m multiport --dports smtp  -j 
DNAT --to-destination 192.168.12.56

and if I try telnet to any mail server on the internet , i connect to 
192.168.12.56 (Which should happen on 172.20.128.56)

[root@poscpt0h01 root]# telnet 196.31.155.18 25
Trying 196.31.155.18...
Connected to 196.31.155.18.
Escape character is '^]'.
220 prxsaa0z02.ipnetwork.co.za ESMTP Sendmail 8.12.8/8.12.8; Fri, 8 Apr 2005 
17:30:45 +0200


is there noway to make it connect directly to 196.31.155.18, but using 
192.168.12.56 as a gateway





----- Original Message ----- 
From: "Rob Sterenborg" <rob@sterenborg.info>
To: <netfilter@lists.netfilter.org>
Sent: Friday, April 08, 2005 12:58 PM
Subject: RE: Redirecting mail


>> Now what i would like to know is there a way I could route
>> all out going mail from 172.20.128.56 to 192.168.16.56 using
>> iptables DNAT.
>>
>> First of all, is it possible to do what I want to do? and
>
> The networks seem to be connected, so can't you just configure a
> smtp-forwarder in your MTA configuration ? That would be easier I think.
>
>> would I use iptables or iptables with something else?
>
> No, just iptables would be enough.
>
>> This is what ive tried...
>>
>> on 172.20.128.56 (Red Hat Linux release 7.3)
>> i issue the command  :
>> iptables -t nat -A OUTPUT -p tcp -m multiport --dports smtp
>> -j DNAT --to-destination 192.168.12.56
>
> There is no need to use multiport because you only DNAT 1 port : smtp.
> But that should not be a problem.
>
> iptables -t nat -A OUTPUT -p tcp --dports smtp \
> -j DNAT --to-destination 192.168.12.56
>
>> now when im on 192.168.12.56 (Red Hat Linux release 9 (Shrike) )
>> and do a tcpdump greping for smtp I see connections from 172.20.128.56
>> but not exactly sure what its doing.. but what i know, from
>> 172.20.128.56 I cant make smtp connections out to the internet..
>
> A few obvious tests :
> Do you see mail coming in from 172.20.128.56 into the queue of
> 192.168.12.56 ?
> Is mail from 172.20.128.56 "for the internet" being delivered ?
>
> If it's not working, do you have other iptables rules that prohibit this
> from working ?
>
>
> Gr,
> Rob
>
>
>
>
> ********* DISCLAIMER *********
> De informatie in dit E-mail bericht is uitsluitend bestemd voor de 
> geadresseerde. Verstrekking aan en gebruik door anderen is niet 
> toegestaan.
> Door de elektronische verzending van het bericht kunnen er geen rechten 
> worden ontleend aan de informatie. TTP staat niet in voor de juiste en 
> volledige overbrenging van de inhoud van een verzonden E-mail, noch voor 
> tijdige ontvangst daarvan.
>
> 



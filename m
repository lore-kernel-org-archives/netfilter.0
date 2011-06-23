From: Auro Benas <ebay.omg@gmail.com>
Subject: Re: IPTables Filtering traffic before Natting HOW TO?
Date: Thu, 23 Jun 2011 11:17:52 +0200
Message-ID: <BANLkTikvOnzR43EjJdbd_n16OURKROngpA@mail.gmail.com>
References: <BANLkTim1uqdSWuQwsiJvEuw=cD0Pfi0=Zg@mail.gmail.com>
	<BANLkTimL5KLG=4dgt-_kXY5Y4QsZOkuH-Q@mail.gmail.com>
	<BANLkTim5GcaD37uXk=rsUXqyiAnC7KVDHg@mail.gmail.com>
	<BANLkTimMwFFttGEQtGvbpuOfW0axuk=KLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=HeewboK4I/mdodsNbjpeBDd4bR9LO5s0H5se46w7h3w=;
        b=a8pLqOWvXiKS77DoVsdritpGkLj3qPDMgIPJo8Q6JQMUT2W4yC8rQ/fBvjf4PABJee
         Ei35hozG9sqX7ZoNsEiuIcOMeUGTJjzW+H5iaxN9S2qnqH3Az05WfJfrH9xX8WkkesZt
         yVa0tcTFkyRRzsittXitvlFk73DtyU4uy7YR0=
In-Reply-To: <BANLkTimMwFFttGEQtGvbpuOfW0axuk=KLQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Oskar Berggren <oskar.berggren@gmail.com>
Cc: netfilter@vger.kernel.org

Hi Readers,
thanks you Oskar, so in simple words you are saying that IPTables
can't do what I have in mind to accive with it.

I'm really sorry about that but at least I know now that I need to
rethink my server configuration ;).

Many thanks Oskar for your kind help ;)

Best regards,
Auro B.

2011/6/22 Oskar Berggren <oskar.berggren@gmail.com>:
> No packet will ever traverse more than one of INPUT, FORWARD and
> OUTPUT. If you DNAT in PREROUTING to divert the traffic to an interna=
l
> server, it will pass through FORWARD, but not INPUT. Input is for
> traffic that terminates at the same host.
>
> Your log shows the packet in FORWARD, with the modified destination a=
s
> per you DNAT.
>
> /Oskar
>
>
> 2011/6/21 Auro Benas <ebay.omg@gmail.com>:
>> Hi Readers,
>> as first thank you Oskar for your fast reply.
>>
>> Maybe I wrote too much stuff on previouse message.
>>
>> As first I'll reply to questions you asked me.
>>
>>> Are you saying that xx1, xx2, etc. resolve to different IP that are
>>> all present on interfaces of the FW itself?
>>> Or are you saying that incoming connections that originate from the=
 IP
>>> corresponding to xx1 should reach one server, originating from xx2
>>> another server, etc.?
>>
>> The second one, each third level domain is correlated to a single an=
d
>> specific server inside the DMZ zone behind the FW, as example:
>> xx1.domain.com ---> IPGServer 10.10.0.1
>> xx2.domain.com ---> IPGServer 10.10.0.2
>> xx1.domain.com ---> IPGServer 10.10.0.3
>> ----
>> x30.domain.com ---> 10.10.0.30
>>
>>
>>
>>> If your FW public IP is 1.2.3.4, directing traffic to an internal
>>> server is simply:
>>> -t nat -A PREROUTING -j DNAT --to 10.10.0.1
>>
>> Yep that is what I have accived right now.
>> I need AT LEAST 2 layers of security before going on-line and that
>> will be accived with the IPGServer AKA FW with IPTables ONLY install=
ed
>> as
>> first layer od defence/restriction, after that all the WEB Servers
>> behind the main FW will have IPTAbles installed to onborad with
>> EXTREMLY
>> restrictive rules even more than FW, that will be my second layer of
>> defence/restrictions.
>> The first point in all that is that I need as first to filter and LO=
G
>> all what comes in from the Internet with FW and to DROP all the IPs
>> that will dinamically be inserted in the black list rule in filter
>> table in INPUT chain.
>> The second point in all this is that WEB Servers behind FW will have
>> their job to do with Apache/MySQL/PHP installed on board and I
>> can't waste servers' performances for something that must be done by
>> the FW that is there simply to execute that kind of work.
>>
>>> This handles connection, i.e. traffic in both directions. You do no=
t
>>> need a separate SNAT rule to handle response traffic for such
>>> connections. For incoming traffic, the FILTER part and the web serv=
er
>>> will see the original source IP. As long as the servers default
>>> gateway point to your FW, return traffic will be handled properly
>>> without hiding/translating the true source address.
>>>
>>> SNAT rules will be needed to make connections initiated from your
>>> servers, (such as apt-get update), work.
>>
>> Well that is something that I haven't know before, I'm a rookie, tha=
nks ;)
>>
>>
>>> PREROUTING does not make traffic skip the FILTER chains. Note that =
you
>>> also have the raw table to filter before connection tracking and na=
t
>>> occurs.
>> I'm sorry but I think that I don't understand that point.
>> From what I see from my logs and what have I tried I see that the
>> filter table and
>> INPUT chanin restrictions even if setted aren't taken in considerati=
on.
>> I copy/paste you here my logs:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>> Jun 21 20:20:54 ggout001 GG-PREROUTING IN=3Deth0 OUT=3D
>> MAC=3D00:0f:1f:f9:33:aa:00:09:41:42:b8:46:08:00 =A0SRC=3D192.168.1.1=
06
>> DST=3D192.168.1.90 LEN=3D64 TOS=3D00 PREC=3D0x00 TTL=3D128 ID=3D9509=
 DF PROTO=3DTCP
>> SPT=3D3285 DPT=3D80 SEQ=3D2153389899 ACK=3D0 WINDOW=3D65535 SYN URGP=
=3D0
>> Jun 21 20:20:54 ggout001 GG-FORWARD IN=3Deth0 OUT=3Deth1
>> MAC=3D00:0f:1f:f9:33:aa:00:09:41:42:b8:46:08:00 =A0SRC=3D192.168.1.1=
06
>> DST=3D10.10.0.1 LEN=3D64 TOS=3D00 PREC=3D0x00 TTL=3D127 ID=3D9509 DF=
 PROTO=3DTCP
>> SPT=3D3285 DPT=3D80 SEQ=3D2153389899 ACK=3D0 WINDOW=3D65535 SYN URGP=
=3D0
>> Jun 21 20:20:54 ggout001 GG-POSTROUTIN IN=3D OUT=3Deth1 MAC=3D
>> SRC=3D192.168.1.106 DST=3D10.10.0.1 LEN=3D64 TOS=3D00 PREC=3D0x00 TT=
L=3D127
>> ID=3D9509 DF PROTO=3DTCP SPT=3D3285 DPT=3D80 SEQ=3D2153389899 ACK=3D=
0 WINDOW=3D65535
>> SYN URGP=3D0
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>>
>>
>> I'll olso copy/pase my actual IPTables rules just to make easiear yo=
ur
>> eventual help ;)
>> NOTE:
>> I leaved the test rule that will DROP any connection entering in eth=
0,
>> that was happend for
>> my SSH connection, or SFTP connection that arent prerouted while the
>> HTTP connections passes as no rule is setted on filter.
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>> # Generated by iptables-save v1.4.4 on Tue Jun 21 20:37:57 2011
>> *filter
>> :INPUT ACCEPT [300:34601]
>> :FORWARD ACCEPT [5:320]
>> :OUTPUT ACCEPT [3346:16521465]
>> -A INPUT -j ULOG --ulog-prefix "GG-INPUT"
>> -A INPUT -i eth0 -p tcp -j DROP
>> -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
>> -A FORWARD -j ULOG --ulog-prefix "GG-FORWARD"
>> -A FORWARD -i eth0 -o eth1 -m state --state RELATED,ESTABLISHED -j A=
CCEPT
>> -A FORWARD -i eth1 -o eth0 -j ACCEPT
>> -A OUTPUT -j ULOG --ulog-prefix "GG-OUTPUT"
>> COMMIT
>> # Completed on Tue Jun 21 20:37:57 2011
>> # Generated by iptables-save v1.4.4 on Tue Jun 21 20:37:57 2011
>> *nat
>> :PREROUTING ACCEPT [148:18297]
>> :POSTROUTING ACCEPT [1:64]
>> :OUTPUT ACCEPT [3:216]
>> -A PREROUTING -j ULOG --ulog-prefix "GG-PREROUTING"
>> -A PREROUTING -i eth0 -p tcp -m tcp --dport 80 -j DNAT
>> --to-destination 10.10.0.1
>> -A POSTROUTING -j ULOG --ulog-prefix "GG-POSTROUTIN"
>> -A POSTROUTING -o eth0 -j MASQUERADE
>> COMMIT
>> # Completed on Tue Jun 21 20:37:57 2011
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>>
>> NOTE:
>> That's a working DMZ zone, but I need something more from this
>> configuration and from the server that will host that configuration.
>> Filter as first
>> after filtering routing to the destinaion web server, that's all.
>>
>> I hope that you will understand what I need and you will point me in
>> the right direction.
>>
>> Thank you in advanced for your kind help ;).
>>
>> Best regards,
>> Auro B.
>>
>>
>>
>>
>> 2011/6/21 Oskar Berggren <oskar.berggren@gmail.com>:
>>> Are you saying that xx1, xx2, etc. resolve to different IP that are
>>> all present on interfaces of the FW itself?
>>> Or are you saying that incoming connections that originate from the=
 IP
>>> corresponding to xx1 should reach one server, originating from xx2
>>> another server, etc.?
>>>
>>> If your FW public IP is 1.2.3.4, directing traffic to an internal
>>> server is simply:
>>> -t nat -A PREROUTING -j DNAT --to 10.10.0.1
>>>
>>> This handles connection, i.e. traffic in both directions. You do no=
t
>>> need a separate SNAT rule to handle response traffic for such
>>> connections. For incoming traffic, the FILTER part and the web serv=
er
>>> will see the original source IP. As long as the servers default
>>> gateway point to your FW, return traffic will be handled properly
>>> without hiding/translating the true source address.
>>>
>>> SNAT rules will be needed to make connections initiated from your
>>> servers, (such as apt-get update), work.
>>>
>>>
>>> PREROUTING does not make traffic skip the FILTER chains. Note that =
you
>>> also have the raw table to filter before connection tracking and na=
t
>>> occurs.
>>>
>>> /Oskar
>>
>

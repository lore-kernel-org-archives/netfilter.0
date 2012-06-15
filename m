From: =?iso-8859-1?b?Sm9z6Q==?= Pablo =?iso-8859-1?b?UOlyZXo=?= 
	<josepablo@correo.co.cr>
Subject: Re: Capturing a C Class range dynamically into an ipset table
	within iptables. Possible?&#8207;
Date: Thu, 14 Jun 2012 23:39:24 -0600
Message-ID: <20120614233924.d2by4nvhcg0cogkw@correo.co.cr>
References: <20120614163444.7wwufjwdc0ok4osc@correo.co.cr>
	<4FDAA365.7040007@gmc.lt>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4FDAA365.7040007@gmc.lt>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; delsp="Yes	format=flowed"
To: netfilter@vger.kernel.org

Thanks.. but this would be outside of iptables ruleset.

I need a way to dynamically feed the ipset as traffic cones in via the =
=20
ruleset.





Aidas Kasparas <a.kasparas@gmc.lt> ha escrito:

> On 2012.06.15 01:34, Jos=E9 Pablo P=E9rez wrote:
>> Currently with ipset iam able to send to a table the inidivual (/32)
>> source IP of a connection...
>>
>> I need a way to send to iptables the C Class to an ipset .
>>
>> In other words I need the historical list of last 30 min of C class
>> ranges that have requested my server.
>>
>> I need this preferably done without something outside of iptables (s=
uch
>> as a daemon).
>>
>
> just use parameter netmask 24 while creating ipset and you're done.
>
> test:~# ipset create test hash:ip timeout 60 netmask 24
> test:~# ipset add test 127.0.1.2
> test:~# ipset add test 127.3.4.5
> test:~# ipset list test
> Name: test
> Type: hash:ip
> Header: family inet hashsize 1024 maxelem 65536 netmask 24 timeout 60
> Size in memory: 16632
> References: 0
> Members:
> 127.0.1.0 timeout 50
> 127.3.4.0 timeout 55
> test:~# ipset test test 127.0.1.1
> 127.0.1.1 is in set test.
> test:~#
>
>
>
> --
> Aidas Kasparas
>
>




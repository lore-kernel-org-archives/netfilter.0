From: Lu Brian <lyt0112@gmail.com>
Subject: Re: How can I get rules with all resolved IPs for FQDN?
Date: Fri, 22 Apr 2011 15:19:13 +0800
Message-ID: <BANLkTimY9isyFhAH_ESgfzxo8MWV4HDcoQ@mail.gmail.com>
References: <ED3A8D81130D4C0CB0D9B98DA81D188F@brianlu>
	<alpine.LNX.2.01.1104211240100.5504@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=7nU6mmW+FaPltE0LyIOeKDxadOhLbZJaKwQUGc2l0rE=;
        b=lSMsMkXWyf3diWsvp7bYZaqgjgyxozTHQT4W/gn+ll8yWg+bDDvRUU3f8hYoiSd3E3
         7iPcszxdMfpHdGVfRn2MyAZs4BUw+DwUpGwk0vKP8pBC+4QsqQ9vKXKkufMBCfWQD8QZ
         AmU+3SVhF89BQSC82630K5UcQ5kHuwa71VRpw=
In-Reply-To: <alpine.LNX.2.01.1104211240100.5504@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi Jan
My prolem is when I type the command :

[root@localhost ~]# iptables -t nat -A POSTROUTING -s 192.168.3.0/24
-d www.google.com -j SNAT --to-source 192.168.3.254

I can get all resolved ips for the domain name :
[root@localhost ~]# iptables -t nat -L -vn
Chain PREROUTING (policy ACCEPT 2 packets, 104 bytes)
pkts bytes target =A0 =A0 prot opt in =A0 =A0 out =A0 =A0 source =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 destination
Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
pkts bytes target =A0 =A0 prot opt in =A0 =A0 out =A0 =A0 source =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 destination
3855 =A0213K SNAT =A0 =A0 =A0 all =A0-- =A0* =A0 =A0 =A0* =A0 =A0 =A0 1=
92.168.2.0/24
0.0.0.0/0 =A0 =A0 =A0 =A0 =A0 to:192.168.1.20
=A0 =A00 =A0 =A0 0 SNAT =A0 =A0 =A0 all =A0-- =A0* =A0 =A0 =A0* =A0 =A0=
 =A0 192.168.3.0/24
72.14.203.147 =A0 =A0 =A0 to:192.168.3.254
=A0 =A00 =A0 =A0 0 SNAT =A0 =A0 =A0 all =A0-- =A0* =A0 =A0 =A0* =A0 =A0=
 =A0 192.168.3.0/24
72.14.203.99 =A0 =A0 =A0 =A0to:192.168.3.254
=A0 =A00 =A0 =A0 0 SNAT =A0 =A0 =A0 all =A0-- =A0* =A0 =A0 =A0* =A0 =A0=
 =A0 192.168.3.0/24
72.14.203.103 =A0 =A0 =A0 to:192.168.3.254
=A0 =A00 =A0 =A0 0 SNAT =A0 =A0 =A0 all =A0-- =A0* =A0 =A0 =A0* =A0 =A0=
 =A0 192.168.3.0/24
72.14.203.104 =A0 =A0 =A0 to:192.168.3.254
=A0 =A00 =A0 =A0 0 SNAT =A0 =A0 =A0 all =A0-- =A0* =A0 =A0 =A0* =A0 =A0=
 =A0 192.168.3.0/24
72.14.203.105 =A0 =A0 =A0 to:192.168.3.254
=A0 =A00 =A0 =A0 0 SNAT =A0 =A0 =A0 all =A0-- =A0* =A0 =A0 =A0* =A0 =A0=
 =A0 192.168.3.0/24
72.14.203.106 =A0 =A0 =A0 to:192.168.3.254

when i type the command :
[root@localhost ~]# iptables -t nat -A POSTROUTING -s 192.168.3.0/24
-d www.facebook.com -j SNAT --to-source 192.168.3.254

I can only get 1 new rule for the domain www.facebook.com

[root@localhost ~]# iptables -t nat -L -vn
Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
pkts bytes target =A0 =A0 prot opt in =A0 =A0 out =A0 =A0 source =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 destination
Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
pkts bytes target =A0 =A0 prot opt in =A0 =A0 out =A0 =A0 source =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 destination
3855 =A0213K SNAT =A0 =A0 =A0 all =A0-- =A0* =A0 =A0 =A0* =A0 =A0 =A0 1=
92.168.2.0/24
0.0.0.0/0 =A0 =A0 =A0 =A0 =A0 to:192.168.1.20
=A0 =A00 =A0 =A0 0 SNAT =A0 =A0 =A0 all =A0-- =A0* =A0 =A0 =A0* =A0 =A0=
 =A0 192.168.3.0/24
69.171.224.42 =A0 =A0 =A0 to:192.168.3.254

iptables command can resolve the domain name..www.google.com and
www.facebook.com can be resolved to many ips,but I can only get 1 rule
for www.facebook.com when i type an iptable command ....

2011/4/21 Jan Engelhardt <jengelh@medozas.de>:
>
> On Thursday 2011-04-21 11:04, Brian Lu wrote:
>
>> [root@localhost iptables-1.3.5]# nslookup www.facebook.com
>> Server: =A0 =A0 =A0 =A0 168.95.1.1
>> Address: =A0 =A0 =A0 =A0168.95.1.1#53
>>
>> Non-authoritative answer:
>> Name: =A0 www.facebook.com
>> Address: 66.220.146.25
>>
>> How can I get rules with all resolved IPs for this kind of FQDN?
>
> Using modern tools like iptables 1.4.10 - and host(8) FWIW.
>

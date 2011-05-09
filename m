From: Nikolay Kichukov <hijacker@oldum.net>
Subject: Re: Blocking in NAT
Date: Mon, 09 May 2011 11:54:24 +0300
Message-ID: <4DC7ABC0.6030304@oldum.net>
References: <C9EAA345.75ED%jlay@slave-tothe-box.net> <alpine.LNX.2.01.1105071653100.31190@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=oldum.net; s=mail;
	t=1304931267; bh=rIXaWq50hd3O/O/yv7WB3cX22t3Ij6VEdTCYrvvb1Aw=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=R0O5Uy4IlFEcXOODUphWvocOhqWolIuaZY6qZW2JMte2dTre+psEQrvAGAHCh0LE2
	 hz5vjKV81NDgyIKBOo4lro3RciSQqjDlqUe7WCi0+vHTn+GuhdSrouRut36WX5kyxF
	 tZx5LMzzwPzuRr8aUN/4DkSbbG7uAjiDSzmGmmHU=
In-Reply-To: <alpine.LNX.2.01.1105071653100.31190@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: James Lay <jlay@slave-tothe-box.net>, Netfilter <netfilter@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

or just block it in the -t mangle -A PREROUTING table.
Have a look at the packet flow diagram and you will  be good to go!

Cheers,
- -Nik

On 05/07/2011 05:54 PM, Jan Engelhardt wrote:
> On Saturday 2011-05-07 15:20, James Lay wrote:
> 
>> Hey All,
>>
>> So?once upon a time one could block using NAT, which was nice since I run
>> a spamfilter that grabs everything coming in to port 25 with:
>>
>> iptables -t nat -A PREROUTING -m physdev --physdev-in eth0 ! -s 10.0.0.0/8
>> -p tcp --dport 25 -j DNAT --to-destination 10.0.0.1:25
>>
>> For some reason, filtering in the nat table was deemed bad, so now I can
>> no longer drop things there.  So my question is, how do I block say...a
>> spammer from sending to port 25 now?  I can't use:
>>
>> iptables -t nat -i PREROUTING -m physdev --physdev-in eth0 -s naughty.ip
>> -j DROP
>> or
>> iptables -t nat -i PREROUTING -m physdev --physdev-in eth0 -s naughty.ip
>> -j REJECT
> 
> 
> iptables -A INPUT (or FORWARD, depending on use case) -m physdev 
> --physdev-in eth0 -s naughty.ip (-p tcp --dport 25) -j REJECT
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNx6vAAAoJEDFLYVOGGjgXS30H/RmE9stI4q8nWbZ03ObdIJ5H
gMQiZ2EST/Rz6q/OL37bGdk5bkZcRhj72AqRkrxB57lZDDpsk8uEwIlhoW61J3uI
dFXrGRZAPtCOd4yrGoILKBuK0hLOr/qWHGhxyCXw+Oa4Boq1LUjQHmJSRynss7Ui
caSjV9AWq4f6hmY3tLTQd8pXsi5zTOGKHSYwlRuoPeiUIiHZc9QkFAA6BOMw3Pl5
2NjjpOYAiRwt7/qbCWHaQkqsxvv3JD3tO/RT+Mg41cuOnuLj5945h7IktkbxVKj7
p7xvWJtUHDyD01A+rhb7B3lUn95eM3Hv3nBsAhnbcsXMQl/TO23/2jnsGuvxcbs=
=Hqow
-----END PGP SIGNATURE-----

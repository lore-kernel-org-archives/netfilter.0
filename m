From: pauloric@contatogs.com.br
Subject: Re: nftables - quota isn't working?
Date: Thu, 12 Aug 2021 11:10:55 -0300 (BRT)
Message-ID: <165409782.214.1628777455555.JavaMail.zimbra@contatogs.com.br>
References: <1279582625.93.1628773294634.JavaMail.zimbra@contatogs.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 mercurio.contatogs.com.br 80169421E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=contatogs.com.br;
        s=547D7A06-2322-11E9-835A-A37390E63B7D; t=1628777458;
        bh=CYWk9vMo5DLDQ5VCG7PVqg3zroDwTxF8X7GR6vuFAMc=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=m929VEaCr55j3aUXIkkxwf3TlM7sCj4lXUM9X6pbVSzbMz07XnR0gsxKOUntgQ+k0
         6oUrOj1WURbS1Zt+/w7vEounglGjcBjoV5jyKwUGMBs/Ix+z7QwKpiNkt+Q0uhFzvn
         NbL5+4pDKg2uhuiAcgUy/g2DXN8JIiRahnc5x+x8BPzCxIMxnDhdOyDaHeSMfLdbwj
         MdZqaBNI8q3PyMXf+qlpGG1iRsq+OmzM2hyIoYEuzByzPxcSCqwv9TmTTDhoFaelcW
         NJYKVMJExzRUIGupbIJ2+r2DzXfO29LJjTOIrB0KMxF/0Mb+BYWm5wQK6qBJfd3P4/
         z7M7V0749nS/g==
In-Reply-To: <1279582625.93.1628773294634.JavaMail.zimbra@contatogs.com.br>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>
Cc: pauloric <pauloric@contatogs.com.br>

I think that I find the 'error'.

Quota follows same rules that limit?

https://wiki.nftables.org/wiki-nftables/index.php/Rate_limiting_matchings

If it's correct it should be good to alert users that ares reading https://wiki.nftables.org/wiki-nftables/index.php/Quotas that Quotas follow same rules that limit.... 80)

best regards


----- Mensagem original -----
De: "pauloric" <pauloric@contatogs.com.br>
Para: "netfilter" <netfilter@vger.kernel.org>
Cc: "pauloric" <pauloric@contatogs.com.br>
Enviadas: Quinta-feira, 12 de agosto de 2021 10:01:34
Assunto: nftables - quota isn't working?

Hi all


Reading https://wiki.nftables.org/wiki-nftables/index.php/Quotas

I have been testing quota but I have a doubt.

a) If I use this rule below , quota reaches its value, but download continues.

insert rule inet filter FORWARD ip daddr 192.168.10.11 quota until 2 mbytes counter accept comment "paulo-quota"

nft list ruleset | grep 'paulo-quota'
ip daddr 192.168.10.11 quota 2 mbytes used 2 mbytes counter packets 1074 bytes 2094663 accept comment "paulo-quota"



b) But if I invert logic, download stops.

insert rule inet filter FORWARD ip daddr 192.168.10.11 quota over 2 mbytes counter drop comment "paulo-quota"


debian-10.10.0-amd64-netinst.iso
https://gemmei.ftp.acc.umu.se/debian-cd/current/amd64/iso-cd/debian-10.10.0-amd64-netinst.iso
0 B/s - 22,9 MB de 336 MB



Should a) have the same result as b) ?

Ubuntu 20.04.2
5.4.0-47-generic #51-Ubuntu SMP
nftables 0.9.3-2

Thanks in advanced

-- 
Paulo Ricardo Bruck consultor
-- 
Pau lo Ricardo Bruck consultor 
tel 011 3596-4881 011 
cel 98140-9184(TIM/Whats) 
[ http://www.contatogs.com.br/ | http ] [ http://www.contatogs.com.br/ | s://www.contatoglobal.com.br ] 


Domou arigatou gozaimasu

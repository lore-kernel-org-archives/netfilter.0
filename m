From: pauloric@contatogs.com.br
Subject: nftables - quota isn't working?
Date: Thu, 12 Aug 2021 10:01:34 -0300 (BRT)
Message-ID: <1279582625.93.1628773294634.JavaMail.zimbra@contatogs.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 mercurio.contatogs.com.br 60EC841FE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=contatogs.com.br;
        s=547D7A06-2322-11E9-835A-A37390E63B7D; t=1628773297;
        bh=jbrTiyQIn90QHlcFdb2EzkQI5YULnEBXSCU/nth4bU4=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=Z2A5xjnVEIPhQz3LNBjIvI39i1Q7vDtDfu5gkTCoalBAN6f418qWITYE7TNdAp9rr
         ZSn0sH8B+SwwEAMRc/MC/o2+EZZxASCAjGMv9blagfUQe8OUq4jHtj0IR6dkfaQNgq
         BjCOhQLi85LNUcZ2b6ZnoLOHeIxWgdbMlJhPgH0W3DtbSR6Pr6S4TNpa3VgJcvyJUR
         m4DbJARumxCr1sznf4kixwoZFtaLUkBrNHIuCsPUb4vguu+tSvSCU6XZNl/daIPld+
         c61+WHksf+JKIhSPo+2WRcTcRstgtEUrv+jA60ES9XZLOdQZgN4R9cPAdRXYBVdzil
         hSwC2UED5Gnww==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>
Cc: pauloric <pauloric@contatogs.com.br>

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


From: Aleksander Morgado <aleksander@aleksander.es>
Subject: Re: IP masquerading not applied in TCP retransmission packets
Date: Fri, 3 Jul 2020 15:14:00 +0200
Message-ID: <1fdbafb5-5244-fdcb-28a8-a34b44f86b3c@aleksander.es>
References: <86a0fca6-4ac9-84e6-47d8-5911ee8ffbdb@aleksander.es>
 <2c0b4cea-003d-75e9-b78e-b43993d30c36@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aleksander-es.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GkZBCSO2snd4Zo4vKIw4kY1qG+WBNiskvKutpTJi2R8=;
        b=OvpQeT1oQyYMVepz++VdphNnCfPDH0HOQbHuumsi+7dCGy51T990AzTSCoOmpvD+7+
         8/7IK707R2MrT/wXGvgMIaN6XGsmz7jP3vAbM+VG6je3Bz6kbtSDg3NSalH/pt13foXN
         VY1S/OW4SsC8le3MDVkr04L2nZANGaFTyC96iJl1IVBPrO+Hz74IbBHS2UixmGAXuoie
         CblJIodDqsB2O/CJj5OfJ9KlBTxsUSBvcZDEoVjvxN3Y6oBlNo5JhiasPWf44L13or+V
         7zks0orfGjyililrWQTA+bXgWCgtil60z5WISllDFyi3wc5PfQAB0zskz6SmE95Fe0ie
         NYJg==
In-Reply-To: <2c0b4cea-003d-75e9-b78e-b43993d30c36@thelounge.net>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reindl Harald <h.reindl@thelounge.net>, netfilter@vger.kernel.org

Hey!

> Am 03.07.20 um 13:54 schrieb Aleksander Morgado:
>> I'm trying to debug an issue found on an old Ubuntu 14.04 system running kernel 3.13.0-53 with iptables v1.4.21. The system acts as a router providing access to the Internet to several subnets, with the usual NAT rules:
>>
>>   $ sudo iptables -t nat -S
>>   -P PREROUTING ACCEPT
>>   -P INPUT ACCEPT
>>   -P OUTPUT ACCEPT
>>   -P POSTROUTING ACCEPT
>>   -A POSTROUTING -o eth0 -j MASQUERADE
>>
>> The FORWARD chain rules in the main table look like this:
>>   $ sudo iptables -S
>>   ...
>>   -P FORWARD ACCEPT
>>   -A FORWARD -p tcp -m tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu
>>
>> The problem I am seeing is that TCP retransmissions originated in the subnet clients end up WITHOUT the IP masquerading applied, i.e. the original client IP of the subnet is found in the IP packets instead of the IP address of the outgoing interface in the router. I saw this issue in a system in production, and I attempted to reproduce the problem with some iptables DROP rules that trigger it
> 
> i would guess that it ended as "ctstate INVALID" because the network
> layer on the firewall machine saw no reason that this re-transmit
> happened at all
> 
> out-of-order packages typically are INVALID and nat only applies to NEW
> 
> it could be a bug but also that the re-transmit was not needed at all
> because the ACK came back and there was a race between re-transmit and ACK
> 

I added the iptables DROP rules in the server-side (X.X.X.X being the firewall/gateway public IP), to make sure no ACK arrives the gateway/firewall (only the SYN/ACK of the TCP establishment goes through):
  $ sudo iptables -A OUTPUT -p tcp --tcp-flags PSH PSH -d X.X.X.X -j DROP
  $ sudo iptables -A OUTPUT -p tcp --tcp-flags SYN,ACK ACK -d X.X.X.X -j DROP

If I try to reproduce it again, I can still see the wrong 10.10.0.20 source IP address in the retransmissions, and no ACK arriving before the retransmissions are generated:

  13:04:42.892332 IP 192.168.1.11.38816 > 176.28.121.13.443: Flags [S], seq 4127012281, win 14600, options [mss 1460,sackOK,TS val 8987347 ecr 0,nop,wscale 6], length 0
  13:04:42.913929 IP 176.28.121.13.443 > 192.168.1.11.38816: Flags [S.], seq 1711653205, ack 4127012282, win 28960, options [mss 1460,sackOK,TS val 2003147288 ecr 8987347,nop,wscale 7], length 0
  13:04:42.922138 IP 192.168.1.11.38816 > 176.28.121.13.443: Flags [.], ack 1, win 229, options [nop,nop,TS val 8987350 ecr 2003147288], length 0
  13:04:42.922915 IP 192.168.1.11.38816 > 176.28.121.13.443: Flags [P.], seq 1:518, ack 1, win 229, options [nop,nop,TS val 8987350 ecr 2003147288], length 517
  13:04:43.152445 IP 10.10.0.20.38816 > 176.28.121.13.443: Flags [P.], seq 4127012282:4127012799, ack 1711653206, win 229, options [nop,nop,TS val 8987374 ecr 2003147288], length 517
  13:04:43.612818 IP 10.10.0.20.38816 > 176.28.121.13.443: Flags [P.], seq 0:517, ack 1, win 229, options [nop,nop,TS val 8987420 ecr 2003147288], length 517
  13:04:44.532834 IP 10.10.0.20.38816 > 176.28.121.13.443: Flags [P.], seq 0:517, ack 1, win 229, options [nop,nop,TS val 8987512 ecr 2003147288], length 517
  13:04:46.374399 IP 10.10.0.20.38816 > 176.28.121.13.443: Flags [P.], seq 0:517, ack 1, win 229, options [nop,nop,TS val 8987696 ecr 2003147288], length 517
  13:04:50.063004 IP 10.10.0.20.38816 > 176.28.121.13.443: Flags [P.], seq 0:517, ack 1, win 229, options [nop,nop,TS val 8988065 ecr 2003147288], length 517
  13:04:57.432739 IP 10.10.0.20.38816 > 176.28.121.13.443: Flags [P.], seq 0:517, ack 1, win 229, options [nop,nop,TS val 8988802 ecr 2003147288], length 517
  13:05:12.171881 IP 10.10.0.20.38816 > 176.28.121.13.443: Flags [P.], seq 0:517, ack 1, win 229, options [nop,nop,TS val 8990276 ecr 2003147288], length 517

I believe this would mean there is no race involved, right?

-- 
Aleksander
https://aleksander.es

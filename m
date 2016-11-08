From: Anton Danilov <littlesmilingcloud@gmail.com>
Subject: Re: matching process
Date: Tue, 8 Nov 2016 11:58:56 +0300
Message-ID: <CAEzD07L=gDFmm1=+bNxX5mRDyaGwUa=S+p7=iT14qvF4B4NPFg@mail.gmail.com>
References: <CANY1rLgxygkJXdLVEQbE_O3fsf0=4Qye8TjdKaYY1d-FzvPj6w@mail.gmail.com>
 <CAEzD07JoSVCkoC2JA4SvkqFiQZG4G=ZfchAF1tOZ1yPft+zxdQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=vAgefhN5rApImTlat9KXzJSkGAk2fuXFd8Fcb0/55kg=;
        b=ikJQDEUbroRdpmQK5vsLAuTrDtf69L/T7upKLwaWwMY2qjkCxDCMaC8SlBFX4+NCxX
         yyCFpd9iG0KVLdfXlAxuUBrw1feJXtdM4z9czU207FrUFp1RNDC/5AaV5eQnm63b+Lt/
         MiLL7Cv75R1uCBzS08UNZXV4PtupyCBz13d1gfzyT1jba8nkiQwhndWyiNR0wL0voKQw
         BFnK/2V2CmC/+4WOCr9+tPmmAubeosQvoNKEpf7AkDa/RO9f0j1XQXnULWwwOGBTZAJo
         a6k9yj9zhVwIdpPcRPdGEtxuxdA7ITRs+CvzR+U8L09TJJhrPwJXgDyFE+b+5m9dbIJl
         fAhA==
In-Reply-To: <CAEzD07JoSVCkoC2JA4SvkqFiQZG4G=ZfchAF1tOZ1yPft+zxdQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Art Emius <art@emius.ru>
Cc: netfilter@vger.kernel.org

Hi Art again.
I've reread the mail and function ip_packet_match source.

And here is match steps:
1. source address
2. destination address
3. input interface
4. output interface
5. next protocol
6. fragment checking
7. other matches.




2016-11-08 11:48 GMT+03:00 Anton Danilov <littlesmilingcloud@gmail.com>:
> Hello Art!
>
> Some types of matches are being checking always.
>
> Look at http://lxr.free-electrons.com/source/net/ipv4/netfilter/ip_tables.c#L53
>
> Function ip_packet_match checks the interfaces and protocols, and
> fragments always.
>
> Other matches are being checked in the loop, that will be break after
> first mismatch
> ( http://lxr.free-electrons.com/source/net/ipv4/netfilter/ip_tables.c#L233
> function and
> this loop http://lxr.free-electrons.com/source/net/ipv4/netfilter/ip_tables.c#L308
> )
>
>> Does criteria number matter? Two example rules are written below.
>> iptables -t filter -A FORWARD -i eth0 -p icmp -j ACCEPT
>> iptables -t filter -A FORWARD -i eth1 -s 10.10.10.10 -d 10.20.20.20 -p
>> icmp -j ACCEPT
>> Will it take same time to match packet by these rules, or first rule
>> will take less time?
>
> In the both rules --in-interface and --protocol matches will be checked,
> but second rule will be take more time, because it checks the addresses.
>
>>
>> How does matching process exactly happens?
>> Let's say we have a rule like:
>> iptables -t filter -A FORWARD -i eth0 -s 10.10.10.10 -d 10.20.20.20 -p
>> udp --dport 123 -j ACCEPT
>> And packet with
>> iif=eth1
>> src=10.10.10.10
>> dst=10.20.20.20
>> proto=udp
>> dport=123
>>
>> Will netfilter match packet with all criteria specified and make
>> decision in the end, or it will jump to next rule when first criteria
>> mismatch happen?
>
> The intefaces and protocol will be cheched at first step by
> ip_packet_match function.
> But after interface mismatch there is the jump at next rule, so
> protocol, addresses and
> port numbers checking will be skipped.
>
>> And third question. Is it all fair if using ipset? Will packet be
>> matched with SET2 if it doesn't match SET1?
>> iptables -t filter -A FORWARD -m set --match-set SET1 src,src -m set
>> --match-set SET2 dst,dst -j ACCEPT
>
> Nope, the packet will not be matches with SET2, if --match-set SET1 src,src
> returns the false.
>
>
> --
> Anton.



-- 
Anton.

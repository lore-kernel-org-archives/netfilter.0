From: Daniel <tech@tootai.net>
Subject: Re: Nftables 2 WAN
Date: Sun, 16 Aug 2020 23:24:30 +0200
Message-ID: <edd8f4fd-0509-572d-0622-c4246246ae53@tootai.net>
References: <6bd2a7b2-4244-3695-4b62-64957bfd71c5@tootai.net>
 <f271e8e7-12c1-480f-0a06-3db5ebc5875a@tootai.net>
 <20200816184041.GA1545@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1597613073; bh=5hBPLYpY9/Y/jhMdW5Sx235zhmcQLa56KUHtSxW6rwo=;
        h=Subject:Cc:References:From:Date:In-Reply-To:From;
        b=XK2zP4OwQmPG6aJ8AvNNJwFnsaIP1l29Nmm4uH3jVkQmSwUtpL2U2vd8LtHdZrNRn
         yVsNAM3qI1qc5JZnC/OPKEzZGnA2Hn6qosUunMjdYme/X1lU5EzDmoZhmvn8JWCMqY
         Xkc6go3pijGnpNFFjm3QTmEYFBeXNrQpSuIX3gRs=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1597613073; bh=5hBPLYpY9/Y/jhMdW5Sx235zhmcQLa56KUHtSxW6rwo=;
        h=Subject:Cc:References:From:Date:In-Reply-To:From;
        b=XK2zP4OwQmPG6aJ8AvNNJwFnsaIP1l29Nmm4uH3jVkQmSwUtpL2U2vd8LtHdZrNRn
         yVsNAM3qI1qc5JZnC/OPKEzZGnA2Hn6qosUunMjdYme/X1lU5EzDmoZhmvn8JWCMqY
         Xkc6go3pijGnpNFFjm3QTmEYFBeXNrQpSuIX3gRs=
In-Reply-To: <20200816184041.GA1545@salvia>
Content-Language: fr-FR
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: 
Cc: Netfilter list <netfilter@vger.kernel.org>


Le 16/08/2020 à 20:40, Pablo Neira Ayuso a écrit :
> On Fri, Aug 14, 2020 at 11:26:31PM +0200, Daniel wrote:
> [...]
>> UPDATE: I discover that the traffic I see on interface gretunnel is only the
>> local generated one which is going out with the eth0 ipv6 address. I modify
>> mangle table which now looks like
>>
>> # nft table mangle ip6
>> #
>> $fwtables delete table ip6 mangle 2>/dev/null || true
>> $fwtables add table ip6 mangle 2>/dev/null || true
>> $fwtables add chain ip6 mangle output "{ type nat hook output priority -199
>> ; policy accept ; }"
> Why chain type 'nat' ? Probably you meant to specify here 'mangle'.
> NAT chains only see the first packet of flows.

Because mangle is not accepted.

$fwtables add chain ip6 mangle output "{ type mangle hook output 
priority -199 ; policy accept ; }"

dh@peech:~$ sudo sh nft-mark.sh
Error: unknown chain type mangle
add chain ip6 mangle output { type mangle hook output priority -199 ; 
policy accept ; }

-- 
Daniel Huhardeaux
+33.368460088@tootai.net	      sip:820@sip.tootai.net
+41.445532125@swiss-itech.ch		    tootaiNET

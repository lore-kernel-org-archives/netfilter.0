From: "J. Bakshi" <joydeep@infoservices.in>
Subject: Re: Hot to design syn-flood protection based on ip ?
Date: Tue, 01 Sep 2009 13:08:04 +0530
Message-ID: <4A9CCF5C.8050100@infoservices.in>
References: <4A967DE2.2060601@infoservices.in>	<4A9CBF27.1070600@infoservices.in> <20090901085801.428359f0@catlap>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090901085801.428359f0@catlap>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: netfilter@vger.kernel.org

Marek Kierdelewicz wrote:
> Hello,
>
>   
>> Any clue ?
>>     
>
> You're on the right track. Just use "hashlimit" module instead of
> "limit".Use option "--hashlimit-mode srcip". All necessary info is in
> iptables manpage.
>   

Thanks a lot, what about this ruleset ?

iptables -A INPUT -p tcp --syn  -m hashlimit \
 --hashlimit 1/sec --hashlimit-burst 4 --hashlimit-htable-expire 300000 \
--hashlimit-mode srcip --hashlimit-name testlimit -j ACCEPT
 
iptables -A INPUT -j DROP

The concept here the blocked ip doing the syn-flood will be blacklisted
for 5 min and will be checked again after that interval.


> Best regards,
> Marek
>
>   


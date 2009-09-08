From: "J. Bakshi" <joydeep@infoservices.in>
Subject: Re: iptree question
Date: Tue, 08 Sep 2009 13:32:29 +0530
Message-ID: <4AA60F95.3060501@infoservices.in>
References: <4AA5F9AC.8000701@infoservices.in> <38db14850909080057w6caf2daeq4b287480a07ca2d0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <38db14850909080057w6caf2daeq4b287480a07ca2d0@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anatoly Muliarski <x86ever@gmail.com>
Cc: netfilter@vger.kernel.org

Anatoly Muliarski wrote:
> 2009/9/8, J. Bakshi <joydeep@infoservices.in>:
>   
>> Hello list,
>>
>> I am opening this new thread as I am working in a new direction with
>> ipset ( as many of you suggested ).
>>
>> The present rules I am using to auto blacklist ips is like below
>>
>> ````````````````````````````
>> iptables -N syn-flood
>> iptables -A INPUT -i $IFACE -p tcp --syn -j syn-flood
>> iptables -A syn-flood -p tcp --syn  -m hashlimit \
>> --hashlimit 4/sec --hashlimit-burst 4 --hashlimit-htable-expire 300000 \
>> --hashlimit-mode srcip --hashlimit-name testlimit -j RETURN
>>
>> # Drop bad IP and put then in blacklist
>> iptables -A syn-flood -m recent --name blacklist --set -j DROP
>> `````````````````````````````````
>>
>> To manage the ips properly I like to save ips  in iptree which is an
>> option from ipset. Is there any way to migrate the ips from ipt_recent
>> to iptree ?
>>
>> Or a new way as below  ?
>>
>> ```````````````````
>> ipset --create  blacklistIP   iptree --timeout 3600
>>
>> iptables   -A PREROUTING    blacklistIP   -j DROP
>>
>>
>> iptables -N syn-flood
>> iptables -A INPUT -i $IFACE -p tcp --syn -j syn-flood
>> iptables -A syn-flood -p tcp --syn  -m hashlimit \
>> --hashlimit 4/sec --hashlimit-burst 4 --hashlimit-htable-expire 300000 \
>> --hashlimit-mode srcip --hashlimit-name testlimit -j RETURN
>>     
>
>
> Then you should insert the follow line:
> iptables -A syn-flood -j SET --add-set blacklistIP src
>
>   
>> # Drop bad IP
>> iptables  -A  syn-flood  -j DROP
>>
>> # save the src IP
>> ipset -N blacklistIP -j SET --add-set src
>> ipset -N blacklistIP -j syn-flood
>> ``````````````````````
>>     
> That is the wrong syntax. See above.
>
> Remember, an IP in the blacklist will disappear in an hour after the
> last adding into the set.
>
>   

Hello Anatoly,

thanks a lot for your kind guidance to both of my emails. I like to
experiment with the codes as you suggest. But I have discovered that
ipset is not available in the suse 11 repo.  Hence I need to compile it
from the source or better if I found a .rpm for suse 11.

Thanks

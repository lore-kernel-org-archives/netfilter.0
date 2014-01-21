From: tingwei liu <tingw.liu@gmail.com>
Subject: Re: Fwd: Linux bridge for route
Date: Tue, 21 Jan 2014 09:26:44 +0800
Message-ID: <CA+qZnSSAKdoEFJMak1kS95EJE+oHcvnKrOvLhUMGAU9vZANKVw@mail.gmail.com>
References: <CA+qZnSRGKiFh8FiKMpVQku7CiWCMPq47FpPwrawvTC6KBPwz7A@mail.gmail.com>
	<CA+qZnSQY9dpZDdULtH3GNDEbB0fgoEJ=pa4gOOtwFhrGTgj4bg@mail.gmail.com>
	<52D992F4.8070500@pandora.be>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=e86BtdT8qqKbus91cgfAQAOVf7yMagEWgWBJVsAUMyA=;
        b=bNvhUt7jPhEQ8OgF+M0GwgFWf+lZXCgrCoOYp7UdqI87wtx4DAOflo4whQonAgzsWX
         beKvD0RUUo1j6sen9C9+awrrrFf18TT4G3lECXYQ9XXQaHvYOjnii5yusV+pt8E63s03
         ZCbzIEMJghf7aj5e1icf6Z6npdaJgC/R0aN17irhiPeag7FIN2V2dLLbwwwcb/MtPed6
         pYnVz1MZLmggjr/cqJxgA3jI4XoB+4e8736sBMdEPBQiP2lnS1ukN4Z8csl5Uvnk1pBL
         /nsU+/cVThrNc/MjS07OL+t4JTdriKpC6Q75kSh/f3p+b1nCjGTOfezWsnKHlxbjgiIF
         bzUg==
In-Reply-To: <52D992F4.8070500@pandora.be>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bart De Schuymer <bdschuym@pandora.be>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, netdev@vger.kernel.org

On Sat, Jan 18, 2014 at 4:30 AM, Bart De Schuymer <bdschuym@pandora.be> wrote:
> tingwei liu schreef op 17/01/2014 10:14:
>
>> Dear all,
>>
>>         There is  a question has puzzled me for a long time.
>>         You can find the topology from attachment.
>>
>>         Normal traffic is:
>>
>>                 PC(192.168.1.8)--->Bridge(eth0)--->Bridget(eth1)--->NAT
>> server-->switch--->Server(192.168.5.3)
>>
>>         Now I want the ssh traffic like this:
>>                PC(182.168.1.8)--->Bridge(eth0)--->eth2--->NAT
>> server--->switch--->Server(192.168.5.3)
>>
>>
>>        What I have done on LINUX Server:
>>                #net.bridge.bridge-nf-call-iptables = 1
>>                #iptables -t nat -A POSTROUTING -s 192.168.1.8 -p tcp
>> --dport 22 -j SNAT --to-source 192.168.5.2
>>
>>        I have find the rule matched through command "iptables -t nat
>> -nvL", but the packets doesn't sent to 192.168.5.3.
>>        and "tcpdump -i eth2 tcp port 22" can not capture any packet!
>
>
> You are trying to make a brouter. You don't need to set
> net.bridge.bridge-nf-call-iptables to 1, instead you need to add an ebtables
> rule in the BROUTING chain, see:
> http://ebtables.sourceforge.net/examples/basic.html#ex_brouter
>
> Something like this (in combination with your existing iptables rules):
> ebtables -t broute -A BROUTING -p ipv4 --ip-source 192.168.1.8 \
> --ip-protocol tcp --ip-destination-port 22 \
> -j redirect --redirect-target DROP
>
Dear man,
      This is bad news. It does _not_ work!
      Is there any idea?
Thanks for your reply!

> cheers,
> Bart
>

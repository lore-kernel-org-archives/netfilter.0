From: Mauricio Tavares <raubvogel@gmail.com>
Subject: Re: newbie: forward rule to itself
Date: Wed, 27 Oct 2010 15:47:36 -0400
Message-ID: <4CC881D8.3060408@gmail.com>
References: <4CC8774C.1070908@gmail.com> <alpine.LNX.2.01.1010272116580.19157@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=FfOeILHKKhti+rhPYoWh0KYxAzPAuJhAPqbixDX0Eas=;
        b=dh2WrTvt+jQ1itOJ+xwtJfXzgvKeFt+rGeVHjxt8MsREEfP+T8Iy5nyoBRFyPvNXVg
         4l14NR8gV2wRBnwCEpMmJOvWoAMzfHrdbipx4ZPBVBy8YMtRdoazhTiAxvOB1ojACzC4
         1l56Yug4klnQriy6uZdelX0fA7YdP3VMuD1Kc=
In-Reply-To: <alpine.LNX.2.01.1010272116580.19157@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 10/27/2010 03:17 PM, Jan Engelhardt wrote:
> On Wednesday 2010-10-27 21:02, Mauricio Tavares wrote:
>
>> 	Let's say I have server1 with two ports, eth0 and eth0, and server2
>> whose eth0 port is connected to server1's eth1. And let's say the subnet
>> between them is 192.168.1.0/24 while the one server1's eth0 is connected to is
>> 192.168.4.0/24.
>>
>> I have the following rules to forward port 6969 coming on eth0 on server1 to
>> port 6969 on server2's eth0:
>>
>> iptables -A PREROUTING -t nat -p tcp --dport 6969 -j DNAT --to
>> 192.168.1.server2:6969
>> iptables -A INPUT -d 192.168.4.server1 -p tcp -m tcp -m state --state NEW
>> --dport 6969 -j ACCEPT
>> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>>
>> Any machine in 192.168.4.0/24 seems to be able to get to server2 by using
>> 192.168.1.server1:6969. But, if I try to connect to 192.168.1.server1:6969 on
>> server1 itself, I will not be forwarded to server2. What am I missing here?
>
> That prerouting only applies to packets coming from devices connected to
> the machine.

	How would the prerouting that applies to packets coming from the 
machine itself look like?

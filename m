From: Thomas Berg <thomas.berg@branndal.se>
Subject: Re: ULOG The kernel doesn't support a certain ebtables extension,
 consider recompiling your kernel or insmod the extension.
Date: Tue, 01 Sep 2009 15:20:24 +0200
Message-ID: <4A9D1F98.7030100@branndal.se>
References: <4A9C2F4C.9050405@branndal.se> <200908311534.19700.rob0@gmx.co.uk> <4A9CD19C.6040107@branndal.se> <4A9D08FF.7070705@trash.net> <4A9D10DF.1050307@branndal.se> <4A9D151D.30808@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A9D151D.30808@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Patrick McHardy <kaber@trash.net>
Cc: /dev/rob0 <rob0@gmx.co.uk>, netfilter@vger.kernel.org

Do you think this patch will be inckluden in debian unstble release soon 
or do I have to complie a new kernel to get it working?

Best regards,
Thomas

Patrick McHardy skrev:
> Thomas Berg wrote:
>   
>> Hi
>>
>> trying this
>>
>> rmmod ipt_ulog
>>
>> modprobe ebt_ulog
>>
>> ebtables 14108 3 ebtable_broute,ebtable_nat,ebtable_filter
>> x_tables 14108 5 ebt_ulog,ebt_nflog,ebt_ip,ebt_log,ebtables
>>
>>
>> module is then loaded, great but still the same error when trying to add
>> a ebtables rule with ulog.
>>
>> br0:~# /sbin/ebtables --modprobe /sbin/modprobe -A FORWARD
>> --in-interface eth1.4 --protocol IPv4 --ip-protocol udp
>> --ip-destination-port 67 -j DROP --ulog
>> The kernel doesn't support a certain ebtables extension, consider
>> recompiling your kernel or insmod the extension.
>>     
>
> This patch should fix it.
>
>
>   


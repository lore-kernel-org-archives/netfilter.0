From: Thomas Berg <thomas.berg@branndal.se>
Subject: Re: ULOG The kernel doesn't support a certain ebtables extension,
 consider recompiling your kernel or insmod the extension.
Date: Tue, 01 Sep 2009 09:47:40 +0200
Message-ID: <4A9CD19C.6040107@branndal.se>
References: <4A9C2F4C.9050405@branndal.se> <200908311534.19700.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200908311534.19700.rob0@gmx.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter@vger.kernel.org

/dev/rob0 skrev:
> On Monday 31 August 2009 15:15:08 Thomas Berg wrote:
>  
>> /sbin/ebtables --modprobe /sbin/modprobe -A FORWARD --in-interface
>> eth1.4 --protocol IPv4 --ip-protocol udp --ip-destination-port 67
>> -j DROP --ulog
>> ULOG The kernel doesn't support a certain ebtables extension,
>> consider recompiling your kernel or insmod the extension.
>>
>> lsmod
>> ebt_ip                  1752  29
>> ebt_log                 3268  32
>> ebtable_broute          1740  0
>> ebtable_nat             2000  0
>> ebtable_filter          2028  1
>> ebtables               14108  3 
>> ebtable_broute,ebtable_nat,ebtable_filter
>> ipt_ULOG                6684  1
>> x_tables               14108  4 ebt_ip,ebt_log,ebtables,ipt_ULOG
>> bridge                 39968  1 ebtable_broute
>> 8021q                  17932  0
>> garp                    6996  1 8021q
>> stp                     2112  2 bridge,garp
>>     
>
>  
>> I can se the modules below
>> /lib/ebtables
>>     
>
> Those are ebtables(8) user-space modules, not kernel.
>
>  
>> Isnt ebtables supposed to auto load its needed modules?
>>     
>
> I have this:
> /lib/modules/$(uname -r)/kernel/net/bridge/netfilter/ebt_ulog.ko
> Do you?
>
>   
Its there
-rw-r--r-- 1 root root  9209 2009-03-13 23:37 ebt_ulog.ko

trying modprobe ebt_ulog results in

br0:/lib/modules/2.6.26-1-686/kernel/net/bridge/netfilter# modprobe 
ebt_ulog
FATAL: Error inserting ebt_ulog 
(/lib/modules/2.6.30-1-686/kernel/net/bridge/netfilter/ebt_ulog.ko): 
Cannot allocate memory

> If this is your custom kernel, you overlooked it. 
I was going to make a custom kernel, but dit get unsure what I should 
include except bridging to get ebt_ulog to work. Did dot find any 
related to ulog in menuconfig or do i have to make a patch to the source 
before running menuconfig?


> If it is a Debian
> kernel, file a Debian bug.
>   
Its a debian unstable kernel so there will probably be a new release soon.


Best regards,
Thomas



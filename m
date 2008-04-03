From: Steven Stromer <filter@stevenstromer.com>
Subject: Re: [solved] possible bug in call to libipt_state
Date: Wed, 2 Apr 2008 23:54:06 -0400
Message-ID: <758C82ED-E150-44D2-AD78-D5F4D7BF088F@stevenstromer.com>
References: <filter-4B6EC6.16121031032008@ger.gmane.org> <op.t8wenaw7rtqp7s@hagumi.azt>
Mime-Version: 1.0 (Apple Message framework v753)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <op.t8wenaw7rtqp7s@hagumi.azt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: netfilter@vger.kernel.org

Humbled again. After much searching found '-m -state --state' in two  
locations, instead of '-m state --state'. I had searched long and  
hard for '-m state -state', and '-m state ---state' before posting.  
Finding errors in iptables is like the sysadmin's version of 'Where's  
Waldo?' Thanks to you and Ukeme for your aid.

Steven


On Mar 31, 2008, at 4:46 PM, Eljas Alakulppi wrote:

> Hey.
>
> The reason might be that there is something like "---state" (note 3  
> - instead of normal 2). You should start looking from /etc/init.d/ 
> iptables (or firewall or something similar). A quick workaround  
> could be to create a symbolic link for libipt_-state.so (ln -sf  
> libipt_state.so /lib64/iptables/libipt_-state.so) if it's something  
> that needs to be fixed now and the cause remains unclear (which I  
> doubt).
>
> Steven Stromer <filter@stevenstromer.com> kirjoitti Mon, 31 Mar  
> 2008 23:12:10 +0300:
>
>> Hi,
>>
>> On FC8, kernel 2.6.24.3-50.fc8 (and earlier, actually), iptables  
>> v1.3.8, I am receiving the following error when trying to load  
>> rules from a shell script:
>>
>> Couldn't load match '-state':/lib64/iptables/libipt_-state.so:  
>> cannot open shared object file: No such file or directory
>>
>> In fact, there is no such file or directory, because the call is  
>> being incorrectly made to 'libipt_-state.so', instead of  
>> 'libipt_state.so':
>>
>> # ls -la /lib64/iptables | grep state
>> -rwxr-xr-x 1 root root  6888 2007-11-05 12:08 libip6t_state.so
>> -rwxr-xr-x 1 root root  6888 2007-11-05 12:08 libipt_state.so
>>
>> I am not at all certain whether this is a problem in the Fedora  
>> iptables package, the kernel, or iptables itself. If anyone could  
>> help me locate the source of the call, and could also confirm that  
>> this really is a bug, I'll happily report it!
>>
>> Thanks,
>> Steven Stromer
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe  
>> netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>


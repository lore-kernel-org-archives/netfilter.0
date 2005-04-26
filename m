From: staenker <staenker@rhcs.de>
Subject: Re: queue newbie
Date: Tue, 26 Apr 2005 07:24:01 +0200
Message-ID: <426DD071.5050507@rhcs.de>
References: <000301c549fb$a6facb40$2801a8c0@MBRC40>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000301c549fb$a6facb40$2801a8c0@MBRC40>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: m.d.berger@ieee.org
Cc: netfilter@lists.netfilter.org

Michael D. Berger wrote:

>Thank you for this help.  Additionally, 
>>From where do I download the latest iptables src?
>  
>
netfilter.org

>How do I enable CONFIG_IP_NF_QUEUE?
>  
>
If you are compiling a kernel you have to configure, which parts of the 
big source code schould be compiled. Because of that there exists a 
config file. In this config file you have to enable CONFIG_IP_NF_QUEUE.

>In Red Hat Workstation, where is <where-you-built-your-kernel>?
>  
>
Normaly in /usr/src . But if you don't know where the kernelsources 
schould be you won't be able to patch this kernel with netfilter 
patches. And if your are not able to patch your kernel, you wont get the 
new feature you want. Thatswhy you schould do some reading, googling und 
expirence about how to compile a linux kernel.
If youre done with this you should be able to answer questions like 
"From where do I download the latest iptables src?" by yourself.

>Mike.
>  
>
Richard

>--
>Michael D. Berger
>m.d.berger@ieee.org 
>
>  
>
>>-----Original Message-----
>>From: bharathi [mailto:bharathi@au-kbc.org] 
>>Sent: Monday, April 25, 2005 9:33 AM
>>To: Michael D. Berger
>>Cc: netfilter
>>Subject: Re: queue newbie
>>
>>
>>Dear Mr.Berger,
>>                            Download the latest version of 
>>iptables src 
>>and do the following to get libipq,
>>  # make KERNEL_DIR=<<where-you-built-your-kernel>>
>>  # make install KERNEL_DIR=<<where-you-built-your-kernel>>
>>  # make install-devel
>>IMPORTANT:  Your kernel  must have enabled with the  
>>CONFIG_IP_NF_QUEUE 
>>( Userspace queueing via NETLINK (EXPERIMENTAL) ) module to use this 
>>queueing feature with iptables.
>>
>>thanks,
>>bharthix.
>>
>>
>>Michael D. Berger wrote:
>>
>>    
>>
>>>On RH-WS-3 (4 when I get around to it), I would like
>>>to use the capabilities of -j QUEUE.  Google seems to
>>>indicate that I need libipq, and to get this, perhaps
>>>I need to get an rpm for iptables-devel.
>>>
>>>Is this the way to go?  If so, where is the best place
>>>to get the rpm, and what version should I get?  If not,
>>>how should I proceed?
>>>
>>>Thanks in advance for your help.
>>>Mike.
>>>
>>>--
>>>Michael D. Berger
>>>m.d.berger@ieee.org 
>>>
>>>
>>>
>>>
>>> 
>>>
>>>      
>>>
>>    
>>
>
>
>
>
>  
>



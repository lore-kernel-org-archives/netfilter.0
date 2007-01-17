From: Michael Gale <michael.gale@pason.com>
Subject: Re: Fw: PPTP Problem with 2.6.20-rc1 >=
Date: Wed, 17 Jan 2007 13:05:50 -0700
Message-ID: <45AE819E.5020104@pason.com>
References: <088601c739c2$a7115c80$0a01a8c0@pcjorge>	<45AE5ABB.2070005@pason.com>
	<046e01c73a5e$64027d10$0301a8c0@hercules.decimalint.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <046e01c73a5e$64027d10$0301a8c0@hercules.decimalint.pt>
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
To: Jorge Bastos <mysql.jorge@decimal.pt>
Cc: netfilter@lists.netfilter.org


What do you mean when you say "outside servers" ?

Are you saying that after the PPTP connection is made from client to server that your client can access the server via IP but is not able to access any network services on 
other machines ?

Did you double check that IP forwarding is enabled and what about NAT rules ? Are you natting all traffic so it appears to come from the server or is your network setup to 
route traffic to the client network ?

Michael



Jorge Bastos wrote:
> Hum,
> 
> I'm not having problems when i connecto to the pptp server on the linux 
> box, i'm having problems when i try to connect to outsite servers like:
> 
> my computer => linux gateway with kernel 2.6.20-rcX (also has a pptp 
> server that works file with all kernels) => WEB => remote linux/windows 
> pptp server
> 
> mppe is not used in this case (if i'm correct, at least never used it)
> 
> When i connect from the outsite to my linux pptp server, all works ok
> 
> Can this be the new *nf_nat_pptp* modules?
> 
> ----- Original Message ----- From: "Michael Gale" <michael.gale@pason.com>
> To: "Jorge Bastos" <mysql.jorge@decimal.pt>
> Cc: <netfilter@lists.netfilter.org>
> Sent: Wednesday, January 17, 2007 5:19 PM
> Subject: Re: Fw: PPTP Problem with 2.6.20-rc1 >=
> 
> 
>> Hey,
>>
>> Check out the pptp site for more info:
>>
>> http://pptpclient.sourceforge.net
>> http://pptpclient.sourceforge.net/howto-diagnosis.phtml#mppe_kernel
>>
>> --snip--
>> Check MPPE in kernel Support
>> Make sure the MPPE module can be loaded:
>>
>> # modprobe ppp-compress-18
>>
>> If this module loads without error, then all is well with it. If 
>> errors are generated, you must find the cause and fix it. There are 
>> numerous causes of a failure to load. Some of the causes are;
>>
>>    1. depmod -a was not run after loading a kernel-mppe rpm,
>>    2. the MPPE module cannot be found in the appropriate /lib/modules 
>> directory,
>>    3. the MPPE module that was found cannot be loaded because of 
>> version conflicts,
>>
>>    4. an old mppe.o file was left around after an upgrade that 
>> provided an ppp_mppe.o file (which results in "init_module: File 
>> exists" error if the mppe.o module is loaded somehow),
>>
>> 2003-08-01
>>
>>
>>    5. the ppp_generic module cannot activate the MPPE module when it 
>> finds it needs it, because you are using PPP-MPPE 2.4.0 and the 
>> /etc/modules.conf file does not have an entry for alias 
>> ppp-compress-18 mppe,
>>    6. the PPP modules were compiled into the kernel statically (they 
>> must be modules for MPPE to work as a module),
>>    7. the ppp_async module cannot be loaded (although pptp does not 
>> use a serial port, the ppp_async module is required for data transfer 
>> with the psuedo-tty device).
>> --snip--
>>
>>
>>
>> Jorge Bastos wrote:
>>> Hum...
>>> Well i don't use iptables-save, i just have all rules and the 
>>> modprobe's in
>>> a startup file.
>>> Anyway Linus isn't talking about a solution, is there one already?
>>>
>>>
>>> ----- Original Message ----- From: "TheGesus" <thegesus@gmail.com>
>>> To: "Jorge Bastos" <mysql.jorge@decimal.pt>
>>> Cc: <netfilter@lists.netfilter.org>
>>> Sent: Tuesday, January 16, 2007 9:02 PM
>>> Subject: Re: PPTP Problem with 2.6.20-rc1 >=
>>>
>>>
>>>> On 1/16/07, Jorge Bastos <mysql.jorge@decimal.pt> wrote:
>>>>> Hum... Yes
>>>>>
>>>>> There's changes now?
>>>>>
>>>>
>>>> http://lkml.org/lkml/2007/1/9/217
>>>>
>>>
>>>
>>
>> -- 
>> Michael Gale
>>
>> Red Hat Certified Engineer
>> Network Administrator
>> Pason Systems Corp.
>>
> 
> 

-- 
Michael Gale

Red Hat Certified Engineer
Network Administrator
Pason Systems Corp.


From: Norman Zhang <norman.zhang@rd.arkonnetworks.com>
Subject: Re: Iptables and Kernel
Date: Mon, 12 Apr 2004 10:05:04 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <407ACC40.4060503@rd.arkonnetworks.com>
References: <407A27B2.4000101@rd.arkonnetworks.com> <12755.3975828507$1081750103@news.gmane.org> <407A36DF.40806@rd.arkonnetworks.com> <5554.68140305511$1081756198@news.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5554.68140305511$1081756198@news.gmane.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

>>>>Is iptables still needed for kernel 2.6.x? I see a lot of iptables
>>>>patches go into the kernel, but not much updates on the
>>>>www.netfilter.org. The logo on netfilter says firewalling, NAT and
>>>>packet mangling for Linux 2.4. So I guess much of the code goes directly
>>>>into the kernel? Also does kernel 2.6.3 support Netmeeting and MSN
>>>>Instant Messengener, or I need the following plug-in,
>>>>http://www.kfki.hu/%7Ekadlec/sw/netfilter/newnat-suite/?
>>>
>>>1) iptables is the userspace component.  Yes it is still needed in 2.6.x
>>>-- you still have to use it to setup and manage individual rules.
>>>
>>>2) 2.6.x indeed supports many components of netfilter out of the box,
>>>however there is still patch-o-matic-ng which can still add functionality
>>>not yet in the kernel or in userspace.
>>>
>>>3) No, you do not need patches from newnat-suite by default, you need
>>>ip_conntrack_h323 and ip_nat_h323, although you might need newnat if your
>>>iptables is really old.
>>
>>I'm using iptables-1.2.9-5mdk.i586.rpm on LM10.0. The latest on
>>www.netfilter.org is 1.2.9. I guess those 2 modules is included in 1.2.9?
>>
>>>Keep in mind that *support* of netmeeting in this case is a loose
>>>terminology -- I believe that several functionalities are not covered by
>>>the h323 patches.
>>
>>All I wanted is the ability to see video & audio for both incoming and
>>outgoing calls. Is that supported in iptables-1.2.9? Do I need to apply
>>pom-ng on top of iptables?
> 
>Looking at my kernel tarball, the bare 2.6.3 kernel does NOT include the h323 modules.
>I would say you need patches in p-o-m -- I'm not sure if mandrake has a package for
>p-o-m or not, but yes you need to add h323 modules.

I just downloaded 2.6.5, may I ask where should I check to see if h323 
modules are included? On www.netfilter.org, I see pom-20031219 and 
pomng-20040302. Is it safe to assume, that pomng includes pom?

>IIRC, netmeeting should provide video/audio with conntrack and nat of h323 and relevant
>ESTABLISHED,RELATED rules.  -- be aware that you may not be able to recieve
>calls inside the firewall unless you forward the inbound connection requests -- 
>the gnomemeeting website has some good rules on their faq pages that can help
>with netmeeting requests as well.  Check out openh323.org for gatekeeper applications
>that can act as proxy for connection requests, thus mitigating functionality problems.  
>MS netmeeting also uses UPNP -- this protocol has been discussed on this list previously, 	
>and you might want to read up on that as well.

Thank you so much. I will read up on them.

Regards,
Norman


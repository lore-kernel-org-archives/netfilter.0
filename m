From: Vlad Adomnicai <vlada@xana.ro>
Subject: Re: High CPU usage + Kernel option
Date: Tue, 06 Apr 2004 17:59:45 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4072C5E1.60306@xana.ro>
References: <4072B238.6050509@xana.ro> <1081262572.24338.37.camel@raylinux.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1081262572.24338.37.camel@raylinux.internal>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

With vmstat the sys is at 100%. User process is 1-2%.
The machine doesn't do anything except routing and filtering with iptables.
There is also a script that runs every minute that updates the iptables 
rules, but it only lasts for about 1 second under medium cpu load.

Vlad Adomnicai


Ray Leach wrote:

>On Tue, 2004-04-06 at 15:35, Vlad Adomnicai wrote:
>  
>
>>Hi,
>>   I have a K6/2 333 machine with 64Mb of RAM and two network cards. 
>>(3c509 and an Intel one both with TCP cheksum offloading and Cpu )
>>   I use Fedora Core 1 with the default kernel    and iptables 1.2.9.
>>
>>   At high traffic through the router (6-7Mbytes/second) the CPU goes to 
>>100% and I can't even log on to it through SSH:
>>[root@root web]# ssh 192.168.200.1 -C -v
>>OpenSSH_3.5p1, SSH protocols 1.5/2.0, OpenSSL 0x0090701f
>>debug1: Reading configuration data /etc/ssh/ssh_config
>>debug1: Applying options for *
>>debug1: Rhosts Authentication disabled, originating port will not be 
>>trusted.
>>debug1: ssh_connect: needpriv 0
>>debug1: Connecting to 192.168.200.1 [192.168.200.1] port 22.
>>debug1: Connection established.
>>debug1: identity file /root/.ssh/identity type -1
>>debug1: identity file /root/.ssh/id_rsa type -1
>>debug1: identity file /root/.ssh/id_dsa type -1
>>    and stands there until a timeout occures.
>>   On the network behind the router are aproxymately 200 users for which 
>>I have about 200 iptables rules  like this iptables -A FORWARD -s <ip> 
>>-m mac --mac-source <mac> -j ACCEPT and 200   iptables -A FORWARD -d 
>><ip> -j ACCEPT, to allow passage only for the machines with the corect 
>>pair of ip/mac. I could give up the last 200 rules, as they don't serve 
>>a real purpose in limiting the access but they are used only for 
>>bandwidth monitoring / ip.
>>   Does anyone know how to lower the cpu usage with this configuration? 
>>    
>>
>It should be very low ...
>
>  
>
>>tweaks of any kind? Would a 2.6 kernel improve the situation? I have 
>>also seen an option in the 2.4 kernels CONFIG_NET_HW_FLOWCONTROL 
>>(Forwarding between high speed interfaces) but there it is written that 
>>it supports only some network devices and I don't know about 3coms or 
>>intel ones.
>>
>>  Any one has any ideas? another way of setting the rules? another 
>>filtering method? tweaking parameters? or at least what kind of system 
>>will it be necessary for this setup to be able to at least log on to the 
>>machine and do something on it. Also, would a FreeBSD be more suitable 
>>for this on the same configuration?
>>
>>    
>>
>Run something like sar, vmstat, top on the machine during high usage to
>see if there is another proc running that may be causing the high cpu
>usage. Do you run squid on that machine? If so, check the memory config
>...
>
>  
>
>>Thanks in advance for any informations.
>>Vlad Adomnicai
>>
>>    
>>




From: Peter Schobel <pschobel@porchlight.ca>
Subject: Re: Problems with Transparent Proxy using IPTables, Squid and 2.6 kernel
Date: Mon, 12 Jan 2004 15:09:13 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <31206E3D-453B-11D8-AFEE-000393677A36@porchlight.ca>
References: <200401111700.i0BH0oHu031652@server5.bandwidthco.com>
Mime-Version: 1.0 (Apple Message framework v553)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200401111700.i0BH0oHu031652@server5.bandwidthco.com>
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

I tried your rule - it didn't help but from my understanding i 
shouldn't need rules like that since my input , output and forward 
policies are set to default ACCEPT

Peter Schobel

On Sunday, January 11, 2004, at 12:00  PM, Mark E. Donaldson wrote:

> I haven't been following all of this Peter, but it would seem you now 
> need
> to add a rule allow the packets to get through the FORWARD chain now 
> that
> they have been successfully REDIRECTED.  Try something like:
>
> $IPT -t filter -A FORWARD -i eth0 -p tcp --dport 3128 -j ACCEPT
>
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Peter Schobel
> Sent: Friday, January 09, 2004 6:09 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: Problems with Transparent Proxy using IPTables, Squid and 
> 2.6
> kernel
>
> ok, I removed the error line and the cat autoconf line from the 
> config.h and
> got iptables 1.2.9 to compile against my kernel source and headers and
> reinstalled
>
> if i turn on ip_forward and try to access external sites, i get 
> forwarded
> through to the external page without problem
>
> if i enable the iptables rule
>
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT
> --to-port 3128
>
> my pages just time out when i try to access external sites
>
> but if i try to access the proxyhost directly using http, it redirects 
> me to
> the proxy site without problem
>
> i get exactly the same results using this rule
>
> iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT 
> --to-destination
> $LOCALHOST:3128
>
> does anyone have any idea why traffic destined for external sites will 
> not
> transparently redirect to squid for me?
>
> does anyone have any idea as to what further steps I can take to
> troubleshoot this problem?
>
> Thx in advance,
>
> Peter Schobel
>
> On Thursday, January 8, 2004, at 09:33  PM, Alistair Tonner wrote:
>
>> On January 8, 2004 03:05 pm, Peter Schobel wrote:
>>> ok, I downloaded the source ball for iptables 1.2.9, and compiled
>>> using
>>>
>>> make KERNEL_DIR=/usr/src/linux-2.6.0-1.107
>>>
>>> i got an error from config.h telling me to use the glibc version so i
>>> symlinked /usr/src/linux-2.6.0-1.107 to /usr/include/linux/config.h
>>>
>>> then i compiled successfully and installed using
>>>
>>> make install KERNEL_DIR=/usr/src/linux-2.6.0-1.107
>>>
>>> without incident
>>>
>>> i checked the timestamp on the iptables binary to make sure that it
>>> had been overwritten
>>>
>>> I rmmod'd all the iptables modules and then reloaded my iptables rule
>>>
>>> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT
>>> --to-port 3128
>>>
>>
>> 	Ummm ... I don't understand where the error came from.... I'm using
> a
>> slackware based box with many upgrades
>> 	(gcc glibc binutils and modutils....) my switch from 2.4.23 to 2.6.0
>
>> required a binutils and modutils
>> 	upgrade FIRST -- I would hope that RPM dependencies are in place to
>> enforce this as it will likely
>> 	apply to your situation ... when I rebuilt iptables source it went
>> painlessly --- no error from config.h.
>>
>> 	I *DONT* like the relink .. I've a feeling this will break some
>> inportant defines....
>> 	
>> 	what do you get for modprobe --version and ld -v ?
>> 	I suspect your modutils is incorrect for 2.6.0
>>
>>> lsmod gives me
>>>
>>> Module                  Size  Used by
>>> ipt_REDIRECT            2048  1
>>> iptable_nat            20140  2 ipt_REDIRECT
>>> ip_tables              15104  2 ipt_REDIRECT,iptable_nat
>>> ip_conntrack           28464  2 ipt_REDIRECT,iptable_nat
>>>
>>> iptables -t nat -L gives me
>>>
>>> Chain PREROUTING (policy ACCEPT)
>>> target     prot opt source               destination
>>> REDIRECT   tcp  --  anywhere             anywhere            tcp
>>> dpt:http redir ports 3128
>>>
>>> Chain POSTROUTING (policy ACCEPT)
>>> target     prot opt source               destination
>>>
>>> Chain OUTPUT (policy ACCEPT)
>>> target     prot opt source               destination
>>>
>>> testing it reveals that it is still not working - did i do anything
>>> wrong in the above steps? what further steps would you recommend to
>>> troubleshoot this problem?
>>>
>>> Peter Schobel
>>> ~
>>
>>
> *****************************
> Peter Schobel
> Network Administrator
> Porchlight.ca
> Unlimited Internet
> *****************************
> In a world without walls or fences
> We will have no need for gates or windows
> *****************************
>
>
>
>
*****************************
Peter Schobel
Network Administrator
Porchlight.ca
Unlimited Internet
*****************************
In a world without walls or fences
We will have no need for gates or windows
*****************************



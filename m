From: Fisher Alex <Alex.Fisher@uk.thalesgroup.com>
Subject: Re: Is this possible?
Date: Thu, 22 Apr 2004 14:08:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4087C3E0.8050509@uk.thalesgroup.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Antony Stone wrote:
> On Thursday 22 April 2004 1:36 pm, Fisher Alex wrote:
> 
> 
>>>However, if someone is adamant that you need to set up network
>>
>>connectivity
>>
>>
>>>between machines with such an unfriendly combination of IP addresses, I
>>>suggest you simply set up multiple host-specific routes on the netflter
>>>machine, telling it where to find each different 192.168.0.* destination
>>>address, and don't have a standard 192.168.0.0/24 route on that system.
>>
>>Unfortunately, this is exactly what I can't do :(  This is because there
>>are two of each 192.168.0.* IP address.  The original destination IP
>>address has to taken into account when determining whether packets route
>>through eth1 or eth2.
> 
> 
> Have you considered using two netfilter boxes, one DNATting from 
> 172.26.158.1-30 to 192.168.0.1-30 (network A), and the other DNATting from

> 172.26.158.31-60 to 192.168.0.1-30 (network B)?
> 
> Regards,
> 
> Antony
> 

Its just crossing my mind now :)

I've got 'use netfilter MARK value as routing key' switched on in the 
kernel, so I think I'll give it a go before quitting and finding a 2nd box.

Al
This email and any attachments are confidential to the intended recipient
and may also be privileged. If you are not the intended recipient please
delete it from your system and notify Thales Underwater Systems on +44 1963
370 551. You should not copy it or use it for any purpose nor disclose or
distribute its contents to any other person.


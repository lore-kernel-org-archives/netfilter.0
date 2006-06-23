From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Could policy routing with fwmark be applied to locally generated
 packet ?
Date: Fri, 23 Jun 2006 12:48:24 +0200
Message-ID: <449BC6F8.2000205@plouf.fr.eu.org>
References: <449BB882.8030706@gmail.com>
	<02BB8A4AC86C564C89C7F14CF98CE0C40127AF@knowledge.wizdom.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <02BB8A4AC86C564C89C7F14CF98CE0C40127AF@knowledge.wizdom.nu>
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
To: netfilter@lists.netfilter.org

Hello,

Sietse van Zanen wrote :
> 
> dog daemon wrote :
>>
>> The question is could we use netfilter fwmark to mark locally generated
>> port 80 packet (http) to certain fwmark(ex. 0x20), and route them to
>> wireless route, but keep the default gw being 10.5.30.254?

Yes, of course.

>> I have tested the following environment but it seemed that the packets
>> was be routed to the correct route, but had the incorrect source
>> address(the address of eth0).
[...]
>> I think that output routing decision was done before "OUTPUT" chain in
>> mangle table, and the outgoing address was already chosen

That's correct.

>> Is there another way to fit this requirement or am i missing
>> something(documentation) ?
> 
> I think you only need to add a simple SNAT rule to change the source IP
> to 192.168.3.10

Yes. Avoid MASQUERADE which does not always work as expected when in 
conjunction with advanced routing.
The mark set for alternate routing can be reused to match the 
connections which need to be SNATed.

> Or there might be some ip_if_group option is /proc/sys/net to have
> local outgoing packets always use the source address of the interface
> the are leaving. Not sure about Linux, but Solaris has such an option in
> the kernel.

IMHO such behaviour would be total nonsense.


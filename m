From: Steve Brueckner <steve@atc-nycorp.com>
Subject: RE: Troubleshooting SNAT
Date: Mon, 12 Feb 2007 19:50:42 -0500
Message-ID: <60D45469A1AAD311A04C009027B6BF68060E9CF0@SERVER20>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Thanks, but using the --to-source switch seems to have the same effect 
as just using --to.  And my attempt to use Masquerading failed as well.

I'm new to iptables, but it doesn't seem too complex as a user to try 
to do this, so I really think the problem isn't with my usage of 
iptables but that something is either broken or missing in my kernel.

I think what we need to do is some debugging, but I was hoping for some
ideas on how to do that from this list.

Thanks

Steve Brueckner, ATC-NY

James Shewey wrote:
> did you try "iptables -t nat -A POSTROUTING -o eth0 -j SNAT
> --to-source 192.168.1.221" 
> 
> Perhaps this will yeild better results.
> 
> You should also be able to do what you want with _all_ traffic that
> flows through the router too using the masquerade table. This may not
> work for you solution though.  
> 
> 
> On 2/12/07, Steve Brueckner <steve@atc-nycorp.com> wrote:
>> I have an FC5 (2.6.16.13-xen kernel) box with 2 interfaces:
>> eth0 is 192.168.1.221 (external network)
>> eth1 is 192.168.10.1 (internal network)
>> 
>> I've got to nat traffic through this box from host 192.168.10.2 to
>> host 192.168.1.12.  So I enabled ip forwarding and source nat on the
>> multi-homed box: # sysctl -w net.ipv4.ip_forward=1
>> # iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 192.168.1.221
>> 
>> That didn't work; the packets were indeed forwarded but their source
>> address was unchanged (still 192.168.10.2):
>> # tcpdump -n -i eth0
>> 18:14:12.425317 IP 192.168.10.2 > 192.168.1.12: ICMP echo request,
>> id 2617, seq 9, length 64 
>> 
>> I also tried plain old Masquerading:
>> # iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE This also does
>> not change the packets' source address, but it does forward them
>> from eth1 to eth0 again. 
>> 
>> This similar command has a different but still incorrect effect:
>> # iptables -t nat -A POSTROUTING -j MASQUERADE It changes the source
>> address of the packets on eth1 but of course does not forward them
>> to eth0. 
>> 
>> Nothing seems to work.  Packets are either forwarded but without new
>> source IPs or they get new source IPs but aren't forwarded.
>> My filter table is wide open (no rules).
>> 
>> The same kernel can do SNAT just fine using Debian.  I'm starting to
>> think FC5 is missing something.  However, I seem to have the
>> following modules, which appear sufficient to me:
>> # lsmod | grep ip
>> ipt_MASQUERADE          3776  0
>> iptable_filter          3104  1
>> iptable_nat             8836  1
>> ip_nat                 18092  2 ipt_MASQUERADE,iptable_nat
>> ip_conntrack           55800  4
>> xt_state,ipt_MASQUERADE,iptable_nat,ip_nat nfnetlink              
>> 6520  2 ip_nat,ip_conntrack 
>> ip_tables              13636  2 iptable_filter,iptable_nat
>> x_tables               13188  6
>> xt_state,ipt_MASQUERADE,xt_tcpudp,xt_physdev,iptable_nat,ip_tables
>> ipv6                  269056  14
>> 
>> Any ideas on how to proceed with troubleshooting this?
>> 
>> Thanks,
>> 
>> Steve Brueckner, ATC-NY



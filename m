From: Ryan D <netfilter@mandrake.us>
Subject: Re: round-robin aliases
Date: Fri, 17 Sep 2004 16:16:07 -0600
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040917221607.GG2579@dearing.us>
References: <20040917175729.GF2579@dearing.us>
	<1095445245.1886.48.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1095445245.1886.48.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, Sep 17, 2004 at 02:20:45PM -0400, Jason Opperisano exclaimed:

>On Fri, 2004-09-17 at 13:57, Ryan D wrote:
>> Ive been trying to find a way to do this... I have eth0 on the
>> 192.168.2.0/24 network (eth0 has ip 192.168.2.10). I also have 5 aliases
>> on the same network with these ips:
>> 
>> eth0:1 192.168.2.11
>> eth0:2 192.168.2.12
>> eth0:3 192.168.2.13
>> eth0:4 192.168.2.14
>> 
>> 
>> Id like to round-robin the source ip on a per connection basis, meaning,
>> if I ssh to 192.168.2.100 it may come from eth0:1, if I then ssh to
>> 192.168.2.110 it will come from eth0:2, etc.  So the destination ssh
>> machines will see different source IPs.
>> 
>> Is this possible with netfilter/iproute2?  The only potential problem I
>> see is with the arp table, but I also dont understand this stuff as well
>> as I would like.
>> 
>> -Ryan
>
>this is the default behavior of the SNAT code:
>
>  iptables -t nat -A POSTROUTING -o eth0 \
>    -j SNAT --to-source 192.168.2.11-192.168.2.14
>
>layer 2 devices don't have problems with many IP's being associated with
>the same MAC address--they don't particularly like the same MAC address
>being associated with multiple ports.
>



Is there possibly a piece missing to this? Ive set this up and it did
not complain, but Im still only going out through one IP. Here is the
output from iptables and ip route show:

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
SNAT   all -- anywhere  anywhere  to:192.168.2.10-192.168.2.11



192.168.2.0/24 dev eth0  proto kernel  scope link
default via 192.168.2.254 dev eth0



Thanks,
Ryan


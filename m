From: Menno Smits <menno@netboxblue.com>
Subject: Re: Why is ipset nethash set type limited to /31?
Date: Mon, 13 Mar 2006 08:47:10 +1000
Message-ID: <4414A4EE.8040207@netboxblue.com>
References: <4410F444.3090407@netboxblue.com>
	<Pine.LNX.4.58.0603100910240.6303@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0603100910240.6303@blackhole.kfki.hu>
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
To: Netfilter Mailing list <netfilter@lists.netfilter.org>

Hi Jozsef,

Jozsef Kadlecsik wrote:
> Hi,
> 
> On Fri, 10 Mar 2006, Menno Smits wrote:
> 
>> Is there a reason why the ipset's nethash set type can't be used with
>> single IPs (/32) as well as larger networks? I'd really like to be able
>> to use networks and IPs in the same set.
> 
> An IP(v4) address is a 32bit number. A network address consists of an IP
> address and a mask value. In nethash the IP address *and* the mask
> together are stored on 32bits. Therefore it is not possible to store plain
> IP addresses in that type of sets.

Ok fair enough.

How would you feel about a "union" set type? Union sets would be
configured to refer to 1 or more other sets. If the IP is found in any
of the child sets it returns a match.

Example usage could be something like:

# ipset -N foo iphash
# ipset -A foo 192.168.0.1

# ipset -N bar nethash
# ipset -A bar 10.0.0.0/8

# ipset -N foobar union --set foo --set bar

# ipset -T foobar 192.168.0.1
192.168.0.1 is in set foobar.

# ipset -T foobar 10.1.2.3
10.1.2.3 is in set foobar.

# ipset -T foobar 192.168.0.2
192.168.0.2 is NOT in set foobar.

# ipset -T foobar 11.0.0.2
11.0.0.2 is NOT in set foobar.

Obviously the set types that could be used in the union would have to be 
compatible. Mixing an iphash and an ipportmap wouldn't make much sense.

Your thoughts?

Regards,
Menno



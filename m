From: Andy Furniss <andy.furniss@dsl.pipex.com>
Subject: Re: how to block udp frag?
Date: Sat, 08 Jan 2005 19:54:43 +0000
Message-ID: <41E03A83.6030403@dsl.pipex.com>
References: <2E314DE03538984BA5634F12115B3A4E01BC4203@email1.mitretek.org>	<41E001FB.80807@dsl.pipex.com>
	<1105205583.7108.0.camel@ierdnac>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1105205583.7108.0.camel@ierdnac>
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
To: ierdnah-ipt@as.ro
Cc: netfilter@lists.netfilter.org, justin.piszcz@mitretek.org

ierdnah-ipt wrote:
> http://www.netfilter.org/patch-o-matic/pom-base.html#pom-base-u32
> 
> Inspecting individual bits

I guess this is the title for below - but I just realised it's also the 
answer to my not being able to say "not" - do it one bit at a time :-)

So assuming the frag field on an unfragged packet is 0 and !0 on all 
frags, then I could make a tc filter that would get all the packets.

Remember the problem is that iptables can't see the fragged packets when 
doing NAT - my way does not use iptables. I found those examples - but I 
couldn't get tc to parse anything that looks like that (which doesn't 
mean it's impossible but my filter does the same anyway).

Andy.

> 
> I'd like to look at the "More Fragments" flag - a flag which has no
> existing test in iptables (-f matches 2nd and further fragments, I want
> to match all fragments except the last). Byte 6 contains this, so I'll
> start with offset 3 and throw away bytes 3-5. Normally this would use a
> mask of 0x000000FF, but I also want to discard the other bits in that
> last byte. The only bit I want to keep is the third from the top (0010
> 0000), so the mask I'll use is 0x00000020 . Now I have two choices; move
> that bit down to the lowest position and compare, or leave it in its
> current position and compare.
> 
> To move it down, we'll right shift 5 bits. The final test is:
> iptables -m u32 --u32 "3&0x20>>5=1" 
> 
> If I take the other approach of leaving the bit where it is, I need to
> be careful about the compare value on the right. If that bit is turned
> on, the compare value needs to be 0x20 as well.
> iptables -m u32 --u32 "3&0x20=0x20" 
> 
> Both approaches return true if the More Fragments flag is turned on.
> 
> 
> On Sat, 2005-01-08 at 15:53 +0000, Andy Furniss wrote:
> 
>>Piszcz, Justin Michael wrote:
>>
>>>Yes, if you use NAT, you cannot block fragmented packets.
>>
>>Assuming my testing isn't too lame then you can drop with a policer. It 
>>will still let the last packet through though, as the match is on the 
>>more fragments flag. I suppose using the next field could do them all - 
>>but I don't know how to say not with u32.
>>
>>tc qdisc add dev eth0 handle ffff: ingress
>>
>>tc filter add dev eth0 parent ffff: prio 1 protocol ip u32 \
>>match ip protocol 17 0xff \
>>match u8 0x20 0x20 at 6 \
>>police rate 1kbit burst 10 drop \
>>flowid :1
>>
>>The rate is irrelevant here, it's the burst 10 that means that only 
>>packets <= 10 bytes will ever pass.
>>
>>To delete it do
>>
>>tc qdisc del dev eth0 handle ffff: ingress
>>
>>To see stats -
>>
>>tc -s qdisc ls dev eth0
>>
>>Andy.
>>
>>PS
>>
>>I had to remove jason from the cc as my isps mailserver threw a domain 
>>not found.
>>
>>
>>>
>>>-----Original Message-----
>>>From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Bruno Wallace
>>>Sent: Monday, January 03, 2005 7:39 AM
>>>To: Jason Opperisano; netfilter@lists.netfilter.org
>>>Subject: Re: how to block udp frag?
>>>
>>>the iptables dont see this traffic..
>>>
>>>
>>>On Sat, 1 Jan 2005 19:08:45 -0500, Jason Opperisano <opie@817west.com> wrote:
>>>
>>>
>>>>On Sat, Jan 01, 2005 at 09:58:41PM -0200, Bruno Wallace wrote:
>>>>
>>>>
>>>>>hello,
>>>>>how to block this?????
>>>>>
>>>>>20:53:44.628586 83.102.166.15 > xxx.xxx.151.35: udp (frag 1720:25@512)
>>>>>(ttl 53, len 45)
>>>>>0x0000   4500 002d 06b8 0040 3511 2599 5366 a60f        E..-...@5.%.Sf..
>>>>>0x0010   c896 9723 11ef 0035 0019 1e70 71f7 0100        ...#...5...pq...
>>>>>0x0020   0001 0000 0000 0000 0000 0200 0100             ..............
>>>>>20:53:47.197264 83.102.166.24 > xxx.xxx.151.34: udp (frag
>>>>>48577:25@512) (ttl 53, len 45)
>>>>>0x0000   4500 002d bdc1 0040 3511 6e87 5366 a618        E..-...@5.n.Sf..
>>>>>0x0010   c896 9722 11ef 0035 0019 1e68 71f7 0100        ..."...5...hq...
>>>>>0x0020   0001 0000 0000 0000 0000 0200 0100             ..............
>>>>>20:53:49.306206 83.102.166.76 > xxx.xxx.145.115: udp (frag
>>>>>21990:25@512) (ttl 53, len 45)
>>>>>0x0000   4500 002d 55e6 0040 3511 dbdd 5366 a64c        E..-U..@5...Sf.L
>>>>>0x0010   c896 9173 11ef 0035 0019 23e3 71f7 0100        ...s...5..#.q...
>>>>>0x0020   0001 0000 0000 0000 0000 0200 0100             ..............
>>>>>20:53:49.529603 83.102.166.7 > xxx.xxx.146.119: udp (frag
>>>>>26427:25@512) (ttl 53, len 45)
>>>>>0x0000   4500 002d 673b 0040 3511 c9c9 5366 a607        E..-g;.@5...Sf..
>>>>>0x0010   c896 9277 11ef 0035 0019 2324 71f7 0100        ...w...5..#$q...
>>>>>0x0020   0001 0000 0000 0000 0000 0200 0100
>>>>>
>>>>>thanks
>>>>>Bruno Wallace
>>>>
>>>>either (a) use a default deny policy that doesn't allow UDP traffic or
>>>>(b) in your rules where you accept UDP traffic, specify "! -f" which,
>>>>according to the man page:
>>>>
>>>> When the "!" argument precedes the "-f" flag, the rule will only match
>>>> head  fragments, or unfragmented packets.
>>>>
>>>>-j
>>>>
>>>>
>>>
>>>
>>>
>>
>>
>>
> 
> 
> 
> 




From: Philip Warner <pjw@rhyme.com.au>
Subject: Re: Martians question
Date: Fri, 22 Sep 2006 23:30:25 +1000
Message-ID: <4513E571.5030603@rhyme.com.au>
References: <s5131b92.046@gwia203.syr.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <s5131b92.046@gwia203.syr.edu>
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
To: Randy Grimshaw <rgrimsha@syr.edu>
Cc: netfilter@lists.netfilter.org

Randy Grimshaw wrote:
> I have seen martians caused by two MACaddresses (systems) with the same
> IPnumber.
>   
But that's not the case here. AFAICT...203.8.195.10 is the remote
machine on the other side of eth1.
> <><Randy
>
>
> <><Randall Grimshaw
> Room 203 Machinery Hall
> Syracuse University
> Syracuse, NY   13244
> 315-443-5779
> rgrimsha@syr.edu
>   
>>>> Philip Warner <pjw@rhyme.com.au> 09/21/06 8:27 PM >>>
>>>>         
> I've seen a lot about martian sources being from a 'wrong' subnet, and
> in that context can not see why I am getting lots of martian messages in
> my logs:
>
> Sep 21 22:29:49 ares kernel: martian source 203.8.195.10 from
> 203.8.195.20, on dev eth1
> Sep 21 22:29:49 ares kernel: ll header:
> ff:ff:ff:ff:ff:ff:00:50:ba:39:10:22:08:06
>
> where eth1 is configured as:
>
> eth1      Link encap:Ethernet  HWaddr 00:50:BA:39:10:22
>           inet addr:203.8.195.20  Bcast:203.8.195.255 
> Mask:255.255.255.0
>           inet6 addr: fe80::250:baff:fe39:1022/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           collisions:0 txqueuelen:1000
>
> and the routing has:
>
> 203.8.195.0/24 dev eth1  proto kernel  scope link  src 203.8.195.20
>
> Admittedly, I barely know what I'm doing, but this looks like it should
> be OK: the
> martian 203.8.195.10 is on eth1's subnet, and the routing tables
> at least recognize where to send packets for that address to...so any
> explanation or 
> help would be appreciated.
>
> There are also 2 other ethernet devices,  one to a 10.x.y/24 address
> range and the other to part of the same address range:
>
> eth2      Link encap:Ethernet  HWaddr 00:01:80:5C:8B:35
>           inet addr:203.8.195.121  Bcast:203.8.195.121 
> Mask:255.255.255.255
>
> (this interface should really be dropped, it's there for a legacy
> network that is now not used)...and when I drop eth2, I still get
> martians...so I assume it's not relevant.
>
>
>
>
>
>   



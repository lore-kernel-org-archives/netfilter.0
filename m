From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How to bind 2 WAN 1 LAN ?
Date: Mon, 28 Oct 2002 16:15:32 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210281615.g9SGFbe08878@vulcan.rissington.net>
References: <200FAA488DE0D41194F10010B597610D445ECF@JUPITER>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200FAA488DE0D41194F10010B597610D445ECF@JUPITER>
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
To: netfilter@lists.samba.org

On Thursday 24 October 2002 11:01 pm, George Vieira wrote:

> I'm totally confused on your problem and maybe a drawing using TEXT
> characters might be better. Sounds like your problem is NOT an IPtables
> problem but more a routing issue.

I agree with this diagnosis.

> You talk about parts which I have no idea what they are.. ie "preceding 3
> part go" can you explain further without using words like "it", "they",
> "that" ..etc..

I believe what the original poster is trying to do is to split his internal 
network into 4 ranges of IP addresses, each containing 64 IPs, and to route 
three of them via one ISP, and the other one via his other ISP.

Here is what I posted in reply to this last Thursday:
____

You need to use iproute2 to set up source-based policy routing.

Netfilter will not change the routing of your packets for you, therefore it 
will not help you do what you want.

Iproute2 will let you set up a more complicated routing table than the 
standard 'route' command, and then netfilter will happily process the packets 
as they go through.
 

Antony.

-- 

Ramdisk is not an installation procedure.


From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: scp and sftp: large files not being transfered
Date: Wed, 22 Sep 2004 16:01:04 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409221601.04310.Alistair@nerdnet.ca>
References: <20040922180449.65926.qmail@web53101.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040922180449.65926.qmail@web53101.mail.yahoo.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On September 22, 2004 02:04 pm, nikhil hegde wrote:
> Hi All,
> I've mentioned this prblem earlier. It is about large
> file transfer not taking place in fedora core 2 kernel
> 2.6.5-1.358. When I am getting packets into userspace
> and doing some processing.
>
> http://lists.netfilter.org/pipermail/netfilter/2004-September/056036.html
>
> I was doing "ip route change 10.6/16 mtu 1000 dev
> wlan0"
>
> If I lock the mtu value then it just works fine. Does
> it mean that this kernel is not considering my request
> to set the mtu to 1000?because..I read that..
>
> "If the modifier lock is not used, the MTU may be
> updated by the kernel due to Path MTU Discovery. If
> the modifier lock is used, no path MTU discovery will
> be tried, all packets will be sent without the DF bit
> in IPv4 case or fragmented to MTU for IPv6"
>
	Path MTU discovery allows the system to set the MTU on a connection by 
connection basis.  Once the MTU for a connection is set, packets are sent DF.  
If you LOCK the MTU DF is dropped since we won't know that the MTU does NOT 
drop off somewhere down the line, and the kernel cannot tune the MTU on a 
connection by connection basis (through that route).  If you set MTU on a 
device it is specific to that particular network link, NOT the overall pipe 
through which a connection must travel.

	Can you see both ends of the transfer and do you have admin rights through 
the network? 

	I've had a similar problem in the past moving files from windows boxen to a 
linux environment where the link had to go through DSL - the windows box 
would attempt to open the MTU up at a certain point in the transfer and the 
rest of the file would die.  Smaller files never reached the point in the 
handling routines where the attempt to open up the MTU was tried.  Hard 
setting the MTU on the windows box was the quick answer, but allowing ICMP 
messages back to the windows box ended up being a better answer (limitied 
list of course)  -- perhaps you are dropping ICMP messages somewhere in the 
pipe?

	I can't recall off the top of my head *which* ICMP messages I had to let back 
in ...but they fixed the issue.

	
> If this is so what is the role of
> "/proc/sys/net/ipv4/ip_no_pmtu_disc " , which still
> shows the value 0. Also given the fact that transfer
> happens on 2.4.18-3 kernel with same pmtu setting.

	This is  generic -- for the system, if you lock the MTU on an ip route, it is 
only connections through that route that get MTU locked.  I would suggest 
that you *might* find differences in the ICMP message handling between the 
two boxes, or possibly firewalling rules are coming to play.
>


	Alistair Tonner 


From: Evgeni Vachkov <evgeni.vachkov@investis.com>
Subject: Re: ip_conntrack_tcp Errors - backing a patch
Date: 30 Jun 2004 10:25:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088587533.13926.332.camel@spudgun.dhcp.internal>
References: <1088423237.13933.127.camel@spudgun.dhcp.internal>
	 <40E00F6A.2010604@bofh.bg>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40E00F6A.2010604@bofh.bg>
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
To: netfilter@lists.netfilter.org

On Mon, 2004-06-28 at 13:30, Dimitar Katerinski wrote:
> > Is that a problem with conntrack and its tunning or I am missing some
> > patch? ...Or perhaps it is some other problem with other parts of the
> > kernel? 
> It seems to me that you have applied the tcp window tracking patch from pom-ng.
> The problem is that the client and the server have done the first step of the
> three way handshake, and are in sync, but the firewall for some reason is not.
> So it drops the SYN/ACK, and thus forcing the client to retransmit its SYN and
> initiate a new session (as descibed in the source code of the patch)
> 
> My advice is if you have applied this patch, to remove it, and test the load on the
> firewall again.
> > 

I would like to remove the patch, but unfortunately the person who
compiled last time didnt leave the code.

So....

Would it be possible to compile the relevent modules only (is it
conntrack only?) from scratch and to insmod them into the kernel?

Or there are parts of the kernel that I would need to recompile?

In any case, what code do I need to download and compile and where do I
find the relevant instructions?

In ideal situation I'd like to have a few versions of the conntrack (and
other related?) and be able to insmod them on the fly. 

Also can I just rmmod the conntrack module or I need to unload iptables
and all the rest before I can insmod the new ones? 


Many thanks,
Evgeni




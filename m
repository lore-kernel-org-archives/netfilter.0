From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Two connections shared by ports
Date: Wed, 03 Nov 2004 10:44:34 -0600
Message-ID: <41890AF2.9050402@pbl.ca>
References: <41890694.8070706@treedesign.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41890694.8070706@treedesign.com>
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

Tony VanScoy wrote:
> My Goal:  Setup ipfilter to share two Internet connections.
> 
> Perhaps sharing is the wrong word.  I would like ipfilters to use 
> Internet connection 1 for any  traffic, incoming and outgoing, through 
> ports 21,25, 110, 143, 995, and maybe others.  The rest of the traffic 
> would travel through Internet connection 2 without limits.
> 
> The problem is that our office uploads numerous files through mail and 
> ftp that are usually 50M, possibly larger.  These uploads are unmanaged 
> and suck the life out of our bandwidth.  It sucks browsing the net like 
> I was back on my 28.8 dial up. I just want to dedicate one of our 
> connections for those uploads/downloads to relieve the office of these 
> troubles.
> 
> Is it possible?

Look at Linux Advanced Routing howto (www.lartc.org).  It will show you 
how.  Chapter 11 is what you need.  In short, you'd mark packets for 
ports 21,25,110, and so on using Netfilter and than you would route them 
thruogh one connection, and route everything else through another. 
While you are at LARTC, you can do more interesting things, like traffic 
shaping, to solve your problems (of some types of traffic getting too 
much of your bandwith).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7


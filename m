From: Michael Gale <michael.gale@utilitran.com>
Subject: Re: Two connections shared by ports
Date: Wed, 03 Nov 2004 09:33:45 -0700
Message-ID: <41890869.6040605@utilitran.com>
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
To: Tony VanScoy <tony@treedesign.com>, netfilter@lists.netfilter.org

Hello,

	I do not believe this is possible with ipfilter, iproute2 maybe be able 
to help, by routing traffic based on source IP address.

Why not use multiple internal nics and network addresses or limit the 
amount of bandwidth available to FTP / SMTP traffic.

If you only allowed FTP to use a maximum of 10% of the total bandwidth, 
that would solve the problem.

Michael.



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
> 
> 
> 
> 
> 

-- 
Michael Gale
Lan Administrator
Utilitran Corp.

We Pledge Allegiance to the Penguin


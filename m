From: uniplex <uniplex@maximum-linux.net>
Subject: Re: -m recent
Date: Thu, 30 Jan 2003 19:50:25 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E398201.3090502@maximum-linux.net>
References: <3E2FEA1C.9030305@maximum-linux.net> <20030123191505.GL484@ns.snowman.net> <3E301172.101@maximum-linux.net> <20030123224028.GM484@ns.snowman.net> <3E309EFA.4060605@maximum-linux.net> <20030125012940.GN484@ns.snowman.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Stephen Frost <sfrost@snowman.net>
Cc: netfilter <netfilter@lists.netfilter.org>

Stephen Frost wrote:

> If you want to install using one of the tarballs I've created it's
> pretty simple.  Patch your kernel using the patch-o-matic as normal.
> Then uncompress/untar the tarball you downloaded and copy the
> ipt_recent.h and ipt_recent.c from the tarball over the ones that now
> exist in your Linux kernel tree (from the patch-o-matic).  You can also
> overwrite the libipt_recent.c that is in the extensions directory with
> the one from the tarball.  Then compile iptables and your kernel as you
> normally would.
> 
> 	Stephen

Thanks Stephen, I got pretty much everything with it working now. I'm 
having a little problem with --seconds now

--seconds ! 1800 returns an error. so does --seconds \! 1800

Am I doing something wrong here?



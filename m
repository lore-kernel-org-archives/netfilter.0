From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: Kernel panic with RPC patch
Date: 26 Apr 2003 12:55:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051354548.5942.74.camel@tux.rsn.bth.se>
References: <1051338674.4852.20.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1051338674.4852.20.camel@jasiiitosh.nexusmgmt.com>
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
To: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Sat, 2003-04-26 at 11:19, John A. Sullivan III wrote:
> I was thrilled to see the RPC patch but find that I cannot use it.  My
> RedHat 7.3 system running kernel 2.4.20 hangs on boot with:
> 
> Unable to handle kernel NULL pointer dereference at virtual address
> 00000010
> 
> I thought it might be the use of cryptoapi so I removed it.  That made
> no difference.  I overwrote the kernel source with a fresh copy and
> recompiled without cryptoapi.  That didn't make a difference either.
> 
> I suspected some of the other patches but the one that made the error go
> away when removed and return when applied was RPC.
> 
> Has anyone else had this problem?

Can you please run the entire stackdump through ksymoops so you get a
redable backtrace? Otherwise noone can help you.

-- 
/Martin


From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: PPTP NAT and iptables compilation
Date: Mon, 29 Mar 2004 23:09:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403292309.51751.Antony@Soft-Solutions.co.uk>
References: <20040329190109.GB26945@cinemasoft.com.ar>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040329190109.GB26945@cinemasoft.com.ar>
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

On Monday 29 March 2004 8:01 pm, ihernandez@cinemasoft.com.ar wrote:

> Hello. i have used patch-o-matic to add the pptp-nat helper module
> kernel works fine, but userspace iptables tool fails with:
> "iptables: Invalid argument"
>
> i have seen a lot of posts and the solution is to compile the
> iptables-1.2.9 tools
> i downloaded a fresh copy from www.netfilter.org and run make
> KERNEL_DIR=mykerneldir
> it says:
> Extensions found: IPv4:recent IPv6:ah IPv6:esp IPv6:frag IPv6:ipv6header
> IPv6:hbh IPv6:dst IPv6:rt
>
> then i install.
> fine, but it continues with it's problems!!!!
> what can i do to compile the tools th right way?

Are you sure the command you've run afterwards is the newly-compiled version, 
and not just the old one sitting somewhere in your path?

What does "ls -al `find / -name iptables`" show ?   (Those are single 
backticks around the find command).

Regards,

Antony.

-- 
Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

                                                     Please reply to the list;
                                                           please don't CC me.



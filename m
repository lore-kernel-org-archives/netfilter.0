From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: error compiling iptables-1.2.8 on linux kernel-2.5.69
Date: 16 May 2003 14:22:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053087745.659.30.camel@tux.rsn.bth.se>
References: <20030516081758.GH30683@gsib.sl.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030516081758.GH30683@gsib.sl.ru>
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
To: Anatoly Pugachev <mator@gsib.ru>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Fri, 2003-05-16 at 10:17, Anatoly Pugachev wrote:
> Hello.
> Sorry if i missed something essencials from the docs on compiling
> iptables (INSTALL), but i'm unable to compile it. Here what i have:
> iptables 1.2.8 got from netfilter.org
> linux kernel version 2.5.69 from kernel.org
> gcc-3.2.3 from RH rawhide
> libc-2.3.2 from RH rawhide
> and errors compiling iptables, 
> $ make KERNEL_DIR=../linux-2.5.69 2>&1 | tee error-log.txt
> in attached text file.
> PS: i've succesfully compiled iptables, using source of 2.4.20 kernel.
> So can i use this binary with newer linux kernel 2.5.X ?

Try itables from cvs instead. You really expect a developmentkernel to
compile with a stable iptables? :)

The binary compiled against 2.4.20 should work, but wheres the fun in
that? :)

-- 
/Martin


From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: How add ipt_string
Date: Mon, 28 Oct 2002 19:25:32 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210281923490.10749-100000@dns.toxicfilms.tv>
References: <006901c27eab$e6ad7530$0207a8c0@FRAMOS>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006901c27eab$e6ad7530$0207a8c0@FRAMOS>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fabricio Veloso <fabricio_veloso@yahoo.com.br>
Cc: netfilter@lists.netfilter.org

> How add ipt_string in version 1.2.7a.  I did read FAQ, but not found. In
> version 1.2.5, I used patch-o-matic.
Well, you need to execute
# ./runme extra from the patch-o-matic directory, and apply the string
match patch to the kernel, then build it as a module, so it is faster to
build just a module, than the whole kernel tree.

Then recompile iptables, make install.
And try it out:
# iptables -m string --help

Regards,
Maciej Soltysiak




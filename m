From: Sven Riedel <sr@gimp.org>
Subject: Re: Filtered Port 21 somewhat open - iptables weirdness?
Date: Sat, 24 Jan 2004 19:57:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040124185737.GA16233@localnet>
References: <20040124014842.GA9219@localnet> <000501c3e287$ea1f5490$0200000a@heretic>
Reply-To: sr@gimp.org
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000501c3e287$ea1f5490$0200000a@heretic>
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
Content-Transfer-Encoding: 7bit
To: Alexis <alexis@attla.net.ar>
Cc: netfilter <netfilter@lists.netfilter.org>

On Sat, Jan 24, 2004 at 11:39:46AM -0300, Alexis wrote:
> try using 
> 
> netstat -tupan and see wich process is using that port. if any.

Already tried that, and came up empty. Same thing with lsof (I compiled
a static version of lsof on a guarenteed clean machine, just to make
sure that I wasn't getting the output of a rootkit).

Regs,
Sven
-- 
Sven Riedel                      sr@gimp.org
Liebigstr. 38 
30163 Hannover                  "Python is merely Perl for those who
                                 prefer Pascal to C" (anon)


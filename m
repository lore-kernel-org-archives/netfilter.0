From: Anatoly Pugachev <mator@gsib.ru>
Subject: Re: error compiling iptables-1.2.8 on linux kernel-2.5.69
Date: Fri, 16 May 2003 17:32:56 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030516133256.GQ30683@gsib.sl.ru>
References: <20030516081758.GH30683@gsib.sl.ru> <1053087745.659.30.camel@tux.rsn.bth.se>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1053087745.659.30.camel@tux.rsn.bth.se>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Fri, May 16, 2003 at 02:22:25PM +0200, Martin Josefsson wrote:
> > and errors compiling iptables, 
> > $ make KERNEL_DIR=../linux-2.5.69 2>&1 | tee error-log.txt
> > in attached text file.
> > PS: i've succesfully compiled iptables, using source of 2.4.20 kernel.
> > So can i use this binary with newer linux kernel 2.5.X ?
> 
> Try itables from cvs instead. You really expect a developmentkernel to
> compile with a stable iptables? :)

thanks, that helps.

-- 
/mator


From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: bad interpreter
Date: Wed, 27 Nov 2002 13:28:05 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021127132805.H14289@funkyjesus.org>
References: <20021127115344.59352.qmail@web9606.mail.yahoo.com> <3.0.1.16.20021127141258.1af7ba26@s-net-04.besancon.org>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3.0.1.16.20021127141258.1af7ba26@s-net-04.besancon.org>; from thierry.itty@besancon.org on Wed, Nov 27, 2002 at 02:12:58PM +0000
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
To: netfilter@lists.netfilter.org

On Wed, Nov 27, 2002 at 02:12:58PM +0000, Thierry ITTY wrote:
> this happens when you get a script file from dos (with cr/lf eol)
> the first line may look normal 

Aaaaahhhh, good point :)

> #!/bin/sh
> 
> but the CR (which remains invisible within a text editor that silently
> adapts itself) is misunderstood by shell 
> 
> just edit the file using vi, then ":set ff=unix" and ":wq". this will
> remove the CRs

cat -v will show the dos line-endings if you have them.

-- 
FunkyJesus System Administration Team



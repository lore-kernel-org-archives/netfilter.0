From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: making services invisible
Date: Fri, 11 Oct 2002 17:54:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021011175456.C3805@funkyjesus.org>
References: <3DA57D10.8040904@bol.com.br> <1034257577.1589.2.camel@tech004> <003001c2706b$20982a50$3201a8c0@leonardo>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <003001c2706b$20982a50$3201a8c0@leonardo>; from leolistas@solucoesip.net on Thu, Oct 10, 2002 at 11:41:32AM -0300
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

On Thu, Oct 10, 2002 at 11:41:32AM -0300, Leonardo Rodrigues ( listas ) wrote:
> 
>     DROP would make nmap ( or any other scanner ) mark that port as filtered
> too. To make services closed and 'invisible' to scanners, you should use '-j
> REJECT --reject-with tcp-reset'.

Spot on :)

Isn't this one in an FAQ somewhere by now, seeing as no-one ever reads the
rather good nmap man page.

I haven't checked but last time I looked the TTL will be different with RSTs
sent from iptables rather than those sent because there's no listener on the
port.  There are ways around this too, depends how invisible you want to
be...

-- 
FunkyJesus System Administration Team



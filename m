From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: IP_forward
Date: Mon, 25 Nov 2002 22:51:55 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021125225155.B14289@funkyjesus.org>
References: <00af01c294a6$88ca0c60$e5b4e40f@lsmith5953> <200211251307.28634.apapadop@cmu.edu>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200211251307.28634.apapadop@cmu.edu>; from apapadop@cmu.edu on Mon, Nov 25, 2002 at 01:07:28PM -0500
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

On Mon, Nov 25, 2002 at 01:07:28PM -0500, Alexandros Papadopoulos wrote:
> On Monday 25 November 2002 12:17, bigman@monster-solutions.net wrote:
> > all,
> >     what file do I tell the server to run echo 1 >
> > /proc/sys/net/ipv4_ipforward in?
> >
> 
> You probably mean /bin/echo 1 > /proc/sys/net/ipv4/ip_forward

Though, to be fair, it should find echo.

> and the easiest way to run it is out of /etc/rc.local

That depends, as far as I know, on your distribution.  What are you running?

-- 
FunkyJesus System Administration Team



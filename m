From: "Ian! D. Allen" <idallen@idallen.ca>
Subject: Re: CONNMARK save-mark and restore-mark not working ?
Date: Fri, 18 Feb 2005 16:32:35 -0500
Message-ID: <20050218213235.GC31190@elm.home.idallen.ca>
References: <20050218084044.GA31190@elm.home.idallen.ca>
	<4215CBE9.9020701@multitech.co.in>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4215CBE9.9020701@multitech.co.in>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Chandran <vinod_chandran@multitech.co.in>
Cc: netfilter@lists.netfilter.org

Vinod Chandran wrote:
> >   iptables -t mangle -A OUTPUT -j MARK --set-mark 9
> >   iptables -t mangle -A OUTPUT -j CONNMARK --save-mark
> Here the mark value of the packet is set to 9, which will be saved 
> to be used as conntrack mark for all the packets coming after this.

It isn't being saved.  The --save-mark does nothing.  It changes
nothing in any of my ip_conntrack lines:

   # grep 'mark=9' /proc/net/ip_conntrack
   #

That sounds broken, right?

Linux elm 2.6.10-1mdk #2 Sat Jan 29 13:10:11 EST
2005 i686 AMD Athlon(tm) XP 3200+ unknown GNU/Linux

-- 
-IAN!  Ian! D. Allen   Ottawa, Ontario, Canada
       EMail: idallen@idallen.ca   WWW: http://www.idallen.com/
       College professor (Linux) via: http://teaching.idallen.com/
       Support free and open public digital rights:  http://eff.org/


From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Dropping SYN with FIN flag set
Date: 21 Oct 2003 15:47:24 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066765643.1557.79.camel@valhalla>
References: <NDBBKABJBJCIJNAELLKEEEDOJDAA.jimm@simutronics.com>
	 <1066754393.1557.29.camel@valhalla> <3F95721F.2050905@Loudoun-Fairfax.com>
	 <1066762574.1557.62.camel@valhalla>
	 <20031021192921.GA12606@home.tig-grr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031021192921.GA12606@home.tig-grr.com>
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
To: Tom Marshall <tommy@home.tig-grr.com>
Cc: netfilter@lists.netfilter.org

On Tue, 2003-10-21 at 15:29, Tom Marshall wrote:
>
> Don't know if you care or not, but you could do this much more efficiently
> with perl. 

I *totally* agree. I teach the SANS perimeter track (T2) and teach this
method of log review. While I can teach people how to use grep in about
10 minutes, perl takes a wee bit longer. Using the same method I teach
in class gives me a better chance to debug/improve/etc.

>  If you don't want to do that, you can at least avoid the
> tempfiles by using the surrounding spaces in your patterns, eg.
> 
>   grep " FINSCAN " logfile > finscan.txt

I like using temp files as it aids in debugging. Also, I kind of have to
use the temp files as I '-v' out everything I have a pattern for and
want to be able to see what ever is left (i.e. all the traffic I don't
create a match pattern for).

Thanks!
C






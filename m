From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: P-O-M  - cvs server down?
Date: Wed, 23 Aug 2006 18:38:00 +0200
Message-ID: <000901c6c6d2$7f91ef20$0101000a@tanjian>
References: <001d01c6c6ca$0dd2cc90$9e0110ac@chaussy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001d01c6c6ca$0dd2cc90$9e0110ac@chaussy>
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
To: netfilter@lists.netfilter.org

> Hi,
> 
> Is the cvs server down?  From two machines on different ISP's (one in
> Canada and the other in Columbia) I've tried to check out netfilter
> in order to run
> P-O-M and I'm getting 'connection refused'  I can ping
> 'pserver.netfilter.org' which leads me to believe the cvs server
> isn't running: 
> 
> % cvs -d :pserver:cvs@pserver.netfilter.org:/cvspublic login
> Logging in to :pserver:cvs@pserver.netfilter.org:2401/cvspublic
> CVS password:
> cvs [login aborted]: connect to
> pserver.netfilter.org(213.95.27.115):2401
> failed: Connection refused
> 
> I'm following the information found on:
> 
> http://www.netfilter.org/documentation/HOWTO//netfilter-extens
> ions-HOWTO-2.h tml#ss2.1 
> 
> Which worked before.  :)

Netfilter has switched from CVS to SVN.

http://www.netfilter.org/downloads.html#svn


Gr,
Rob



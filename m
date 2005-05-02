From: "Ken Hilliard" <ken@acotec.com>
Subject: RE: snat
Date: Mon, 2 May 2005 10:14:14 +0700
Message-ID: <000301c54ec5$0a0d1300$5f01a8c0@compaq>
References: <20050502180627.GA11940@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050502180627.GA11940@bender.817west.com>
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
To: 'Jason Opperisano' <opie@817west.com>, netfilter@lists.netfilter.org

Much thanks.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Jason
Opperisano
Sent: Tuesday, May 03, 2005 1:06 AM
To: netfilter@lists.netfilter.org
Subject: Re: snat

On Mon, May 02, 2005 at 09:52:14AM +0700, Ken Hilliard wrote:
> Hey, I'm pretty new to iptables. Where can I get a list of all these
> iptables targets. For example, I never heard of (or read about) the
SAME
> target.

browse the descriptions at the netfilter site (or mirror of your
choosing):

  http://netfilter.org/patch-o-matic/pom-submitted.html
  http://netfilter.org/patch-o-matic/pom-pending.html
  http://netfilter.org/patch-o-matic/pom-base.html
  http://netfilter.org/patch-o-matic/pom-extra.html

or--if your prefer, browse the help and info files directly from the SVN
repository:

  http://svn.netfilter.org/cgi-bin/viewcvs.cgi/trunk/patch-o-matic-ng/

or--checkout your own copy of PoM from SVN, and browse the files in your
local copy (if you ever actually want to apply any of the patches, this
is probably the best route to go):

  svn co https://svn.netfilter.org/netfilter/trunk/patch-o-matic-ng

HTH...

-j

--
"Grinch: You think you have won, you think all is well. Well kiss my
 green ass, I'll see you in hell."
        --Family Guy





From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Start Up Script
Date: Thu, 6 Mar 2003 18:36:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030306183633.18c428a9.arnt@c2i.net>
References: <NHBBICNKELBGKGHPCFMPOEMFCAAA.bbunnell@iastate.edu>
	<3E676F72.1060702@pcxperience.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E676F72.1060702@pcxperience.com>
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
To: netfilter@lists.netfilter.org

On Thu, 06 Mar 2003 09:55:30 -0600, 
"James A. Pattie" <james@pcxperience.com> wrote in message 
<3E676F72.1060702@pcxperience.com>:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Brian Bunnell wrote:
> > Hello
> >
> > Thank you very much for helping me.  I have a perfectly good
> > netfilter script that I run from the command line and everything
> > works fine.  I
> would
> > like this script to run when I boot up the computer.  I am having a
> > lot of trouble finding quality resources on the net about this.
> >
> > There are great resources for learning how to use netfilter. 
> > However,
> when
> > it comes to startup scripts, all the examples seem to be 25 pages
> > long and incomprehensible or wnat me to completely rewrite the
> > script I already
> have.
> >
> > Why can't I just tell the computer to run my script instead of the
> "Let the
> > world in" script it runs at boot?
> >
> > Does anyone have any recommendations, resources or better yet, a
> > good concise example for run level 3?
> 
> If you are on a chkconfig/sysv system just add the necessary chkconfig
> entries to the top of your script, drop it in /etc/init.d and
> chkconfig{script name} on.  Make sure you disable the iptables scripts
> if on a redhat box.
> 
> The PCX Firewall project will generate a redhat init script.
> http://pcxfirewall.sf.net/  Use that for examples on how to modify
> your script.

..the classic bsd approach is move your script to /etc/rc.d/rc.firewall 
and call it from /etc/rc.d/rc.local, just before rc.local runs you
online at boot time.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.




From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: migrating ipchains to iptables
Date: Wed, 2 Apr 2003 14:16:44 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030402141644.60c03834.arnt@c2i.net>
References: <F27pMHi0SYNIPukg3nO0000612d@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F27pMHi0SYNIPukg3nO0000612d@hotmail.com>
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
To: John Lumby <johnlumby@hotmail.com>
Cc: netfilter@lists.netfilter.org

On Tue, 01 Apr 2003 20:15:10 -0500, "John Lumby" <johnlumby@hotmail.com>
_MAILED!!!_, instead of posting, and in top-posting style too, in 
message <F27pMHi0SYNIPukg3nO0000612d@hotmail.com>:
> 
> > ----Original Message Follows----
> > 
> > Message: 2
> > Date: Tue, 1 Apr 2003 05:23:46 +0200
> > From: Arnt Karlsen <arnt@c2i.net>
> > To: netfilter@lists.netfilter.org
> > Subject: Re: migrating ipchains to iptables
> > Organization: ing. Arnt Karlsen
> > 
> > On Mon, 31 Mar 2003 21:27:54 -0500,
> > "John Lumby" <johnlumby@hotmail.com> wrote in message
> > <F78G1vzGbjkJ3FvTFnQ00016fee@hotmail.com>:
> > 
> > > I'm running a 2.4.18-3 kernel but for strange reasons have always
> > > used
> > 
> > ..you want 2.4.18-27.7|8.x|0.etc.  _Now_.
> > http://rhn.redhat.com/errata/rh72-errata.html or
> > http://rhn.redhat.com/errata/rh73-errata.html or
> > http://rhn.redhat.com/errata/rh8-errata.html
> > 
> > > ipchains.   Now want to switch to iptables.   Wondering if anyone
> > > has ever written a script which will read an ipchains file as
> > > created by
> > >
> > >        /etc/rc.d/init.d/ipchains save
> > 
> > ..the easy way is use the 'setup' utility, then choose firewall
> > setup.
> > 
> > > and either convert it to /etc/rc.d/init.d/iptables save format or
> > > set up the "corresponding" iptables chains directly.
> > 
>
> Thanks a lot for the tips.
> 
> I just have one question.     What is the reason for recommending to
> upgrade to 2.4.18-27.7?   

..hint; errata means?   ;-) 

..they come as "Security", "Bug Fix", and "Enhancement".  ;-)

> Is it that the setup in my 2.4.18-3 won't do
> this conversion (I didn't try it yet see below**) 

..do.  Now.   ;-)

> or that you think
> there are important security flaws fixed in the later release?
> 
> John
> 
> ** I don't see any man page for "setup" and never heard of it before. 
> Is it documented anywhere?    Or is it just self-documenting?    
> I prefer to know what some tool like this will do before letting it do
> it.

..wise.  Try it anyway, it has a "Cancel" button too if you don't like
it, I'm not too impressed myself, but it does get a firewall newbie's
_workstation_ safely online, until he gets his iptables act together.

..now, I prefer adding webmin(.com) and shorewall(.net) to control 
iptables, whenever my clients wanna try do stuff themselves.

..if they run more mission critical stuff, I have them put ipcop(.org)
on its own box, usually version 1.3"alpha", 1.3 is now in beta and due
out as stable in a few weeks.  The stable 0.1.1 and 1.2.0 is based on
2.2 and ipchains and will not do stateful firewalling.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



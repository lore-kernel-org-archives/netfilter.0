From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: setting up my own ruleset under red hat 8.0
Date: Thu, 24 Oct 2002 11:46:50 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210241142001.364-100000@localhost.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@lists.netfilter.org>


  ok, time for another almost certainly trivial question.
what's the proper procedure for establishing my own iptables
ruleset for red hat 8.0?

  first, i noticed that the startup script /etc/init.d/iptables
will, at boot time, look for the iptables config file
/etc/sysconfig/iptables and will run "iptables-restore" based on the 
contents of that file as it was saved during installation.

  once i define my own ruleset, i'm assuming that, first, i
want to delete /etc/sysconfig/iptables to remove any trace of
the former ruleset so that it does not get pulled in at
boot time.

  and second, what's the preferred place to add my own ruleset?
i can certainly add a script call to /etc/rc.local, for instance.
is there a better place?

rday



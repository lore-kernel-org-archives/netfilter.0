From: jamal <hadi@cyberus.ca>
Subject: ANNOUNCE: tc filter extensions
Date: Sat, 4 Jan 2003 13:03:58 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030104125252.J48869__13874.3922267624$1041974329@shell.cyberus.ca>
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
To: diffserv-general <diffserv-general@lists.sourceforge.net>
Cc: lartc@mailman.ds9a.nl, netfilter@lists.samba.org, netfilter-devel@lists.samba.org



I guess holidays means idle time which means idle minds which leads to
thumb twiddling which then leads to some work (which is sometimes useful)

Ive updated the traffic control patches i posted about six months ago.
Note, the current release does not break anything in tc. It is fully
backward compatible so you can choose not to use it and things will work
as they do today. Of course, it is very useful so you cant choose to
ignore it!

It's now upgraded to better than "use at your own risk" category.
tested on both uni and SMP 2.4.18 and 2.4.20.

http://www.cyberus.ca/~hadi/patches/action/

Bug reports and feedback are appreaciated.
A lot more goodies coming up, so this is just the tip. First steps are to
prove sanity of the idea.

cheers,
jamal


From: Bob Balsover <balsover@pacbell.net>
Subject: RE: netfilter digest, Vol 1 #513 - 12 msgs
Date: Tue, 07 Jan 2003 17:01:30 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c2b6b1$7c18c560$0301a8c0@BOBSDESK>
References: <20030107220901.9462.47110.Mailman@kashyyyk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <20030107220901.9462.47110.Mailman@kashyyyk>
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


Message: 9
Date: Tue, 7 Jan 2003 21:13:34 +0100
From: Harald Welte <laforge@netfilter.org>
To: Netfilter Development Mailinglist
<netfilter-devel@lists.netfilter.org>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>,
	Netfilter Announcement List
<netfilter-announce@lists.netfilter.org>
Subject: [ANNOUNCE] New netfilter/iptables patch-o-matic release
Reply-To: coreteam@netfilter.org


--KMIs29sPfC/9Gbii
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
While patch-o-matic-20030107 is announced on the home page, it is not
listed on the download page...



------------------------------------------
Good news, Everyone! (TM)

The netfilter core team announces a new release of the netfilter
patch-o-matic suite:

	patch-o-matic-20030107

This release contains the most up-to-date bugfixes and new features
for=20
the netfilter/iptables subsystem of the 2.4.x Linux kernel.

The patches are devided into several repositories.  Which ones are to be
used, depends on how conservative or adventurous the user is ;)

'submitted':
	Patches which have been submitted for kernel inclusion, most of
	them have already appeared in 2.4.20.  It's really recommended
	to always apply those

'pending':
	Patches currently pending for kernel inclusion.  They will
	almost certainly appear in the next official kernel release.

'base':
	New features which are self-contained enough so it's sure they
	don't clash with each other.  Those are safe in the way that
they
	don't harm already existing functionality.  Playing with them
	might discover one or the other remaining bug... you've been
	warned.

'extra':
	New features which might cause other patches from 'extra' to
	clash with each other.  Most interestingly, you will find here
	conntrack/nat helpers for H.323, PPTP, talk/ntalk, rsh, tftp,
	mms and amanda.


Read more about the individual patches of this new patch-o-matic release
at: http://www.netfilter.org/documentation/pomlist/pom-summary.html

The new patch-o-matic release including a cryptographic GPG signature
is available for download at

	http://www.netfilter.org/downloads.html#pom-20030107


Enjoy,
	Harald (for the netfilter core team)



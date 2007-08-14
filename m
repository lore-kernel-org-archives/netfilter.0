From: "Adam J. Richter" <adam@yggdrasil.com>
Subject: Capitalization conflicts in netfilter code apparently break tortise
	subversion
Date: Tue, 14 Aug 2007 10:33:37 -0700
Message-ID: <20070814173337.GA9922@freya.hsd1.ca.comcast.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

	I am sorry if this is a frequently raised topic, but I have
done some web searches for it, including ones limited to
netfilter.org, and looked through the past few months of mailing list
archives without finding anything about it.

	netfilter appears to be the only part of the linux kernel that
contains file names that differ only by capitalization.  I infer from
a quick glance at the source tree that the netfilter code currently
uses the caplitation to distinguish between "targets" and "matches",
which I would assume somehow helps in the readability of iptables
output or something like that.

	File names that collide when compared case insensitively
result in errors in the use of TortoiseSVN on Windows clients using a
subversion source tree that has a copy of the linux kernel checked in.

	Although I would welcome tips about some kludge available in
TortoiseSVN to work around this problem so that I don't have to admit
that Linux is incompatible with the primary client of this particular
company's chosen version control system, and have found some
discussion of this subversion issue on the net already, the primary
point of my letter is that file names that differ only in
capitalization in the real world do add a little bit to costs of and
potential arguments against linux.  Incompatability with our
colleagues' case insensitive file systems also impedes software
sharing minutely and may erode the inclination of others to accomodate
conventions that may make our lives easier (7 bit characters in file
names, no spaces, control characters, slashes, semicolons, no files
named "..", etc.).

	I don't expect the netfilter contributors immediately to jump
and fix this problem, which I imagine would have implications in user
level code and system administration scripts.  Rather, I submit it for
contributors to contemplate in future planning.  For example, perhaps
in the future, the FILTERNAME/filtername convention could be migrated
to the use of suffixes like filtername_in/filtername_out.

	Thanks for your time.

Adam Richter


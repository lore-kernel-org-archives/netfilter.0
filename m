From: =?unknown-8bit?q?m=2Ebar=FD=FE?= demiray <barisdemiray@yahoo.com>
Subject: delay after [time patch] rule's expire
Date: Fri, 25 Jun 2004 10:32:49 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040625173249.26447.qmail@web14007.mail.yahoo.com>
References: <1088180537.40dc5139d37a8@securemail.starken.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1088180537.40dc5139d37a8@securemail.starken.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hi all!
This is not a technical problem in fact, only my
curiousty. I applied the time patch with patch-o-matic
and test it with a rule like

iptables -A INPUT -p icmp -m time --timestart 14:44
--timestop 14:55 --days Fri -j DROP

When the current time is passing the start time
(packages will be matched and dropped soon) and the
stop time (they'll be free to pass again) there is
about 1 min. delay between these two process. For
example, when it's 14:55, then the icmp packages
shouldn't be matched anymore but they are dropped till
it's about 14:56. Why?

Have a nice day..



=3D=3D=3D=3D=3D
M.Bar=FD=FE Demiray

DOS: n., A small annoying boot virus that causes random=20
spontaneous system crashes, usually just before saving a massive project. E=
asily cured by UNIX.  See also MS-DOS, IBM-DOS, DR-DOS.


	=09
__________________________________
Do you Yahoo!?
Yahoo! Mail - Helps protect you from nasty viruses.
http://promotions.yahoo.com/new_mail


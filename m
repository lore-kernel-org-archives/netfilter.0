From: Sagara Wijetunga <sagaralists@yahoo.com>
Subject: RE: Allow active and passive FTP connections
Date: Fri, 18 Jun 2004 10:14:24 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040618171424.37671.qmail@web14728.mail.yahoo.com>
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hi all

Today I upgraded the Linux kernel to 2.6.7.=20

Applied following patches of the
patch-o-matic-ng-20040302:
init_conntrack-optimize NETMAP SAME TTL connlimit
fuzzy iprange ipv4options mport raw CLASSIFY addrtype
childlevel owner-socketlookup

Compiled in all netfiter options to the kernel.

After the server is booted with the new kernel, I
recompiled and reinstalled the iptables.

But my problem is still the same. The =93-m state
--state ESTABLISHED=94 works well, but the =93-m state
--state RELATED=94 does not work at all for FTP data
connections. What have I missed?

Is there an alternative method to know that a
particular --syn connection a part of an existing FTP
connection without using RELATED?

Any ideas please?

Sagara




	=09
__________________________________
Do you Yahoo!?
Yahoo! Mail is new and improved - Check it out!
http://promotions.yahoo.com/new_mail


From: <bmcdowell@coxhealthplans.com>
Subject: RE: help needed: clogged console
Date: Fri, 2 Jan 2004 09:15:24 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7A3B4AA360FDEF448F3390421FC8D731012C6B06@coxhpexg.coxhp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: orlowscy@hotpop.com, shrike-list@redhat.com, redhat-list@redhat.com
Cc: netfilter@lists.netfilter.org


Search for 'dmesg -n 1' - I think that's what you're after.


Bob

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Slawomir
Orlowski
Sent: Tuesday, December 23, 2003 12:32 PM
To: shrike-list@redhat.com; redhat-list@redhat.com
Cc: netfilter@lists.netfilter.org
Subject: help needed: clogged console


Hello,

I have Linux RH 9.0 configured as filtering firewall, and getting a lot =
of
(kernel, iptables) messages on active consoles.
I have thought that putting in /etc/syslog.conf:

# *.kern /dev/console
kern.* /var/log/kernel
kern.* /dev/tty8

would free me from this, but it did not.
How can I force kernel message to appear only in /var/log/kernel log and =
on
tty8 only?

Best Regards
I hope that somebody will be able to help me.
When  I'm getting a lot of dropped packages it is not possible even to =
log.

Slawomir Orlowski



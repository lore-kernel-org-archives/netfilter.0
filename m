From: =?unknown-8bit?q?J=F6rgen?= Danielsson <jorgen_d@yahoo.com>
Subject: local redirect
Date: Mon, 4 Nov 2002 14:51:18 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021104225118.85776.qmail@web9902.mail.yahoo.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

I have a problem that perhaps someone can help me
with. I need to setup a redirect on a local network,=20
will try to explain what I mean, it looks like this:

inet
  |
---------
firewall

eth0  xxx.xxx.xxx.22
-----------
   |                     | Server
   |---------------------| xxx.xxx.xxx.11
   |                     |
----------
Router

xxx.xxx.xxx.2
-----------


What this "picture" is trying to explain is that we
have incoming traffic over for example a vpn to a
router. Now I want users coming in that way to be able
to reach a intranet on the server, but for security
reason I want a semitransparent relay on the firewall
pointing to port 80 on the server. Reason for
semitransparent is that it hides the sites real ip,
but the server can log from were the connection is
made (it won't show the fw's ip) xxx.xxx.xxx.*** is
the same subnet and without nat.

I tried to use forward, but noticed that it requires
prerouting which then uses -t nat for example, and
ther eis no nat on the local network.

So I have no idea how to solve this, I can't use a
third party software like rinetd, since it isn't
semitransparent.

Anyone that has any ideas ?

/J=F6rgen

__________________________________________________
Do you Yahoo!?
HotJobs - Search new jobs daily now
http://hotjobs.yahoo.com/


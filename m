From: =?unknown-8bit?q?J=F6rgen?= Danielsson <jorgen_d@yahoo.com>
Subject: iptables and mtu
Date: Mon, 10 Jun 2002 12:28:51 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020610192851.52895.qmail@web9903.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.samba.org

I'm using an adsl connection and have linux as
router/firewall. The problem is that adsl uses a mtu
that is 1492, standard for ethernet is 1500.

Is there a way to make iptables "convert" packages to
the masqed net to a mtu of 1500 instead ?
Right now i have to manually change the mtu to 1490 on
the computers behind the linux router to be able to
access all websites.

/J=F6rgen

__________________________________________________
Do You Yahoo!?
Yahoo! Health - your guide to health and wellness
http://health.yahoo.com


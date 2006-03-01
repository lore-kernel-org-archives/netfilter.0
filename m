From: <account@netje.nl>
Subject: Outgoing port is wrong
Date: Wed, 1 Mar 2006 13:19:08 +0100
Message-ID: <005001c63d2a$5726a8f0$7b82a8c0@aladin>
Reply-To: postmaster@netje.nl
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

I am having a lot of problems with setting up something relatively easy, =
but
does not seem to work.
=A0
Situation:
=A0
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
+-------------+=A0=A0=A0=A0=A0=A0=A0=A0 |--- Box1=A0 192.168.1.107:15009 =

Internet ------| eth0=A0=A0=A0 eth1|---------|--- Box2=A0 =
192.168.1.108:15009
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
+-------------+=A0=A0=A0=A0=A0=A0=A0=A0 |--- Box3=A0 192.168.1.109:15009
=A0=A0=A0=A0=A0=A0=A0=A0 62.59.197.53 =A0=A0=A0=A0192.168.1.1
=A0
I have 3 boxes running the same services in a DMZ. Via the internet, I =
want
the ability to access the different boxes, based on a different port =
number
on the out-side. Out-side port 18107 should go to internal
192.168.1.107:15009, 18108 should go to 192.168.1.108:15009 and Port =
18109
should go to 192.168.1.109:15009.=20
This was working, but the new security of the applications does demand =
that
the services should be able to reinitiate the connection, using the same
port as on the way in. So I need to make sure that box1
(192.168.1.107:15009) always uses 62.59.197.53:18107 to connect to the
outside.=20
=A0
How do I setup these rules correctly for in and out going?
=A0
=A0
Any help is welcome.
=A0
=A0=A0 Henri B.
=A0
=A0



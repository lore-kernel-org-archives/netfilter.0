From: Carles Xavier Munyoz =?iso-8859-15?q?Bald=F3?= <carles@unlimitedmail.org>
Subject: Connection synchronization.
Date: Tue, 30 Sep 2003 14:09:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309301409.45599.carles@unlimitedmail.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hi,
I have a master FW with a failover FW that I have configured using Keepaliv=
ed=20
(http://keepalived.sourceforge.net/index.html).
The problem I have now is that when the failover FW is activated due a faul=
t=20
in the master FW, the current connections are lost.

Is there any utility for keep linux netfilter connections synchronization
between the two firewalls ?
I have seen that this is done by the Linux Virtual Server=20
(http://www.linuxvirtualserver.org/), but I don't want a Linux Virtual Serv=
er=20
director, I only want a FW box with a failover FW with synchronized=20
connections.
Is there any utility for it ?

Greetings.
=2D--
Carles Xavier Munyoz Bald=F3
carles@unlimitedmail.org
http://www.unlimitedmail.net/
=2D--



From: Carles Xavier Munyoz =?iso-8859-15?q?Bald=F3?= <carles@unlimitedmail.org>
Subject: TCP/UDP accounting data.
Date: Mon, 27 Oct 2003 13:31:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310271331.12496.carles@unlimitedmail.org>
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
To: netfilter list <netfilter@lists.netfilter.org>

Hi,
I have created, using the iptables command, a set of chains for accounting=
=20
purpouses only.
=46or example, I have created a chain for account the TCP incomming traffic=
 and=20
another one for account UDP incomming traffic.

I'm programming a C daemon that periodically takes the amount of bytes=20
accounted by every chain and stores it in a database.

At this moment I'm running the command iptables from inside my C program to=
=20
store the chain information in a file, and then parse this file to get the=
=20
data.
Is there any iptables C library I can use to get this accounting informatio=
n=20
directly, without having to run the iptables command ?
Is this information stored in a /proc file ?

Greetings.
=2D--
Carles Xavier Munyoz Bald=F3
carles@unlimitedmail.org
http://www.unlimitedmail.net/
=2D--



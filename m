From: "Paul Gaynor" <pgaynor@storactive.com>
Subject: RE: server upload limiting
Date: Sun, 13 Jul 2003 15:09:15 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <39ED39E9649AE44BA0E71FA06EF456EA5DA1@MAIL.storactive.com>
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
To: Mark <markryan@cfl.rr.com>, netfilter@lists.netfilter.org

Hey Mark,

	There is a lot of wonderful Traffic shaping things that you can
do with iptables.  Take a look at the Linux Advanced Routing and Traffic
Control HOW-TO:

http://www.linux.org/docs/ldp/howto/Adv-Routing-HOWTO/index.html

	This will give you a good place to start.  There is also some
Application layer Traffic Shapers for Linux, you may want to do a search
for this as well.

Good Luck,
   Paul Gaynor


-----Original Message-----
From: Mark [mailto:markryan@cfl.rr.com]=20
Sent: Sunday, July 13, 2003 10:52 AM
To: netfilter@lists.netfilter.org
Subject: server upload limiting

Hi,
=20
I run a ftp server on a cable modem using slackware linux and proftpd.
I am=20
looking for a way to limit my upload speed so it is not always maxed
out.  Is=20
there a way to do this with iptables?  I would like to set a server
limit of=20
38Kbytes send speed.
=20
Mark



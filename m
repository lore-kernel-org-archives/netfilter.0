From: miller69@gmx.net
Subject: New match, related connections and marking packets
Date: Tue, 18 Mar 2003 10:08:19 +0100 (MET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <31548.1047978499@www57.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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
To: netfilter@lists.netfilter.org

Hello everyone,

I have the following setup:

Internet------------|eth0  Linux bridge  eth1|--------------DMZ

I'm going to use HTB on the linux bridge that filters a couple of
connections in both directions.  For this reason I've created a new match f=
or iptables.
The following line works very well:

iptables -t mangle -I FORWARD -m mymatch --myoption -j MARK --set-mark 11

The only problem is that it just catches one single packet (the matching
one) but I need to treat all related packets in the same way.  How do I gra=
b all
the related packets and mark them too? =20
I don't know if it's easily possible because I can't devide if I want to
mark the connection until the first packet in PUSH-state containing data
arrives. At this point the connection is already established. So I can't use
iptables connection tracking, can I?

Thanks for your help!
Mike

--=20
+++ GMX - Mail, Messaging & more  http://www.gmx.net +++
Bitte l=E4cheln! Fotogalerie online mit GMX ohne eigene Homepage!



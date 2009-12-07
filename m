From: Aviad Lahav <aviad.lahav@gmail.com>
Subject: Netfilter injects network headers?
Date: Mon, 7 Dec 2009 21:05:41 +0200
Message-ID: <85ce6a220912071105s7706f877k9547362aefd76056@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:date
         :x-google-sender-auth:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=eP4A97HH+wxwvgI5hzZYV57lofkXsSgNyxyeCKRsnK4=;
        b=emoQSu2q/wGELe9joFpRheDWXaNWowhazJCaBeM8os3fDhBeb/A/tSQscmebnk9kzq
         gKCFHU6s69O5HBguMywouU4I3JT5svxItZn95TgO/VxVhzg2mJ5Uh3Mbh6nfp45/uoRZ
         QWJWSrTJeu5rXoNbP0KFXJ1FiLyr5UeT0IgwM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi all,
I'm trying to set up an SSL transparent proxy, and=A0I've seen very
bizarre behavior on my system.
I've added two NAT rules to =A0the PREROUTING chain, looking like this:

# iptables -L -v -t nat
Chain PREROUTING (policy ACCEPT 561 packets, 70236 bytes)
=A0pkts bytes target =A0 =A0 prot opt in =A0 =A0 out =A0 =A0 source =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 destination
=A0=A0 20 =A01280 REDIRECT =A0 tcp =A0-- =A0ppp0 =A0 any =A0 =A0 anywhe=
re
anywhere =A0 =A0 =A0 =A0 =A0 =A0tcp dpt:4309 redir ports 4443
=A0=A0 =A08 =A0 512 REDIRECT =A0 tcp =A0-- =A0ppp0 =A0 any =A0 =A0 anyw=
here
anywhere =A0 =A0 =A0 =A0 =A0 =A0tcp dpt:https redir ports 4443

So I've got a listener on port 4443, accepting connections from both
ports 443 and 4309.
When I'm doing the first recv() in my accepting server, I get the
incoming connections to port 443 very well, BUT:
Incoming connections to port 4309 gets *3 extra bytes* in the
beginning of the connection (maybe also to subsequent packets, but I
haven't had the chance to see this data yet...()

The first 3 bytes I'm getting is:
0x00 0x01 0x05

My machine is an up-to-date Ubuntu 9.10 (karmic), and the packets are
coming from a client connected thru pptpd.
Anyone has a clue?

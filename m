From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: passive ftp and file sharing
Date: Wed, 11 Jun 2003 08:06:16 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6E1A@wardrive.citadelcomputer.com.au>
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
To: leo.lombardo@tiscalinet.it
Cc: netfilter@lists.samba.org

Use ip_conntrack_ftp which is for FTP and use -m state --state RELATED =
for FTP related connections.

other than that, you have to learn more about the ports used by those =
applications and possibly block their port/protocol.

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au
=20

-----Original Message-----
From: Leonardo Lombardo [mailto:leo.lombardo@tiscali.it]
Sent: Monday, June 09, 2003 7:43 PM
To: netfilter@lists.netfilter.org
Subject: passive ftp and file sharing


Hi all,

a question for you: how can I set my iptables firewall so that natted =
lan
users can use ftp in passive mode and have winmx, dc, audiogalaxy, ....
blocked ? I've tried out all that scripts/lists of ip/... i've found on
the net but nothing... the only way I found to block file sharing is to
close all ports 800:65535 but this way passive ftp is blocked too.... =
:((
I'm a very beginner with iptables so please be patient...

p.s.: now I use firewall-jay script to manage iptables.

Thanks to all in advance :)
##############################################

Leonardo Lombardo - leo.lombardo@tiscalinet.it

##############################################

__________________________________________________________________
Tiscali ADSL Light Sempre a 1 euro al giorno! E in piu' telefoni gratis.
Abbonati entro il 31 maggio, l'attivazione e 'gratuita.   =20
http://point.tiscali.it/adsl/index.shtml






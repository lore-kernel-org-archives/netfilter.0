From: =?iso-8859-1?q?yann=20Conan?= <yahn_ick@yahoo.fr>
Subject: FTP +SLL + PortForwarding
Date: Wed, 15 Sep 2004 18:44:37 +0200 (CEST)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040915164437.83457.qmail@web20928.mail.yahoo.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

Hi all,

I'm trying to configure a iptables firewall in a
structure in double bastion mode.

this is the configuration:
	internet
	   :
	   :
	   :
	FW (RH/iptables)
	   :
	   :
	   :
	DMZ/w2k/FTPS server
	   :
	   :
	   :
	FW(w2k/Isa server)
	   :
	   :
	   :
	  LAN
	 =20
the tranfer of the data from the FTP server must be
protected with SSL (no SSH)

for the FTP transfer I make a portForwarding with
ip_conntrack_ftp and it works.

but now I would like to know how I have to do to
PortForward ftp data with SSL.
There is a problem because iptables must find during
the FTP connect the random client port in active  FTP
or the random server port in passive FTP. And if it's
encrypted with SSL it's impossible for iptables to
find the right ports.

Then I would like to know if it is possible for
iptables to read SSL or if there is a possibility to
unencrypt in input, read the FTP connect with
ip_conntrack_ftp and re-encrypt in output.

sorry about my english...

Best regards,

Yann


=09

=09
	=09
Vous manquez d=92espace pour stocker vos mails ?=20
Yahoo! Mail vous offre GRATUITEMENT 100 Mo !
Cr=E9ez votre Yahoo! Mail sur http://fr.benefits.yahoo.com/

Le nouveau Yahoo! Messenger est arriv=E9 ! D=E9couvrez toutes les nouveau=
t=E9s pour dialoguer instantan=E9ment avec vos amis. A t=E9l=E9charger gr=
atuitement sur http://fr.messenger.yahoo.com


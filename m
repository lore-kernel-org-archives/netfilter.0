From: "Gary Smith" <gary@primeexalia.com>
Subject: RE: Restrict LAN users to send mail to Internet but allow to send
	mailto other LAN user.
Date: Wed, 27 Oct 2004 09:06:04 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <21245695958BF041875A6C39D08F9EBA1C3C1B@vjo-mails-03.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: ads nat <adsnat@yahoo.com>, netfilter@lists.netfilter.org

Here is an example that we use for blocking workstations but allowing =
the centrallized exchange server to send email.  I've changed it to =
match your interfaces and IP's.
=20
iptables -A FORWARD -o eth0 -i eth1 -s 192.168.0.7 -p tcp -m tcp --dport =
25 -j ACCEPT
iptables -A FORWARD -o eth0 -i eth1 -p tcp -m tcp --dport 25 -j REJECT
=20
Please note that this is off the top of my head so it might not be =
FORWARD but everything else should be correct.
=20
Gary Smith
=20

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of ads nat
Sent: Wed 10/27/2004 7:58 AM
To: netfilter@lists.netfilter.org
Subject: Restrict LAN users to send mail to Internet but allow to send =
mailto other LAN user.=20



Hi,
I will elaborate my problem.

I am looking for solution for following problem.

I have A Linux interent gateway server having 3 NIC
cards
1) eth0 connected to internet.
2) eth1 connected to private LAN (192.168.0.1.)
3) eth2 connected to DMZ server.(10.0.0.1)

DMZ server is with one LAN card (eth0 : 10.0.0.2)

On DMZ, DNS, Web and sendmail are installed.
Iptables prerouting rules are set on Gateway server so
that users from LAN 192.168.0.0 can acess web as well
as mail server.

Now I want to allow LAN users to send emails to each
other on LAN but want to allow some LAN users to send
email to Internet(Outside world).
Is there any way using Linux iptables firewall to
acieve this requirement.

thanks for support.


              =20
_______________________________
Do you Yahoo!?
Express yourself with Y! Messenger! Free. Download now.
http://messenger.yahoo.com





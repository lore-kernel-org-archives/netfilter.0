From: "Daniel Fourie \(DJN\)" <FourieDJ@telkom.co.za>
Subject: How to SNAT FTP
Date: Mon, 11 Apr 2005 08:26:39 +0200
Message-ID: <C55C2B2C46581A429D06FFBFD73008C601E7256B@CNTRRA20-XCS00.telkom.co.za>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

Hi all

=20

I would like to ask you all a question on how to source nat (SNAT) an
ftp connection. My network looks something like this.

=20

#         000

#       0     0

#    0           0

#   0 192.168.0.0 0

#   0             0

#    0           0

#       0     0

#         000

#          |

#          |                                     0 0 0

#   (165.168.1.1 =96 eth0)                      0         0

#   0000000000000000                        0             0

#   0              0                       0      DMZ      0

#   0 devlab-fw-00 0 [172.20.1.1 =96 eth1]--0    172.20.0.0   0

#   0              0                       0               0

#   0000000000000000                        0             0

#                                             0         0

#                                                0 0 0

=20

I have got the following nat rules in my iptables firewall

=20

$IPTABLES -t nat -A POSTROUTING -s $NET_DMZ -o eth0 \

-j SNAT --to-source 192.168.1.1

=20

Everything seems to work fine, but ftp on the other hand is not
working in active mode. The ftp helper is loaded (ip_conntrack_ftp,
ip_nat_ftp).

If I do a network scan I can see the connection coming to my machine,
but the data connection witch is negotiated in the payload is not
natted to the correct ip (192.168.1.1). This is suggesting to me that
the ftp helper is not working. I am running a updated version of
RedHat 9 current kernel is kernel-2.4.20-31.9.

=20

It will be appreciated if someone can help.

=20

Regards

DevLab


--=20
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.0.308 / Virus Database: 266.9.5 - Release Date: 4/7/2005
=20

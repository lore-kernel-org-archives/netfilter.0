From: "Hammond, Jeffrey" <Jeffrey.Hammond@tekelec.com>
Subject: Passing X11 through  IPTABLES NAT
Date: Tue, 10 May 2005 07:20:13 -0500
Message-ID: <D1D49B61B5B64B4A8FB647B97BEC4ED9024FE0FA@DCEVS1.tekelec.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

All;

            I'm using IPTABLES to NAT various client LINUX boxes through
a VPN server. I'm able to connect through the server, NAT the client and
out the VPN connection successfully. Telnet is successful. However when
I try to export the X display back to my client I receive 'Can't open
Display <I.P.>' where the I.P. is that of the NAT'd client from the
host, and see and 'invalid data' packet while sniffing on the client.
I've tried DNATting X11 port 6000 packets back to the original I.P. with
no success.

=20

            Any help would be appreciated.

=20

Jeff Hammond

=20


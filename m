From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: DNAT pptp to windows machine
Date: Tue, 2 Aug 2005 08:12:14 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE58290747E@pxtbenexd01.pxt.primeexalia.com>
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
To: "Sadus ." <sadus@swiftbin.net>, netfilter@lists.netfilter.org

First, you only need to post one time.=20

To answer this question, you need a little additional background on your
environment.  Will it be the firewall making the connection?  What OS
version?  ETC.

If you are just doing straight NAT'ing of firewall IP to the back end
PPTP server then you shouldn't need to do anything more than setup the
NAT rules and ensure that the firewall is allowing the traffic
(including GRE).  I think that NAT'ing GRE is the difficult part but I
usually use a dedicated IP for the PPTP servers and NAT the entire IP.

Alternatively, you can install POPTOP on your firewall.

Gary

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Sadus .
> Sent: Tuesday, August 02, 2005 12:58 AM
> To: netfilter@lists.netfilter.org
> Subject: DNAT pptp to windows machine
>=20
> Hello,
> I would like to DNAT to a pptp server, what rules/protocols/ports
should
> i use? do i need to recompile the kernel?
>=20
> Thanks
>=20
> EL-KHOUJA Haytham
> ----------------------------------------------------------
> sadus@swiftbin.net
> ----------------------------------------------------------
> Please avoid sending me Word or PowerPoint attachments.
> See: http://www.gnu.org/philosophy/no-word-attachments.html


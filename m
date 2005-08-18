From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: ftps and iptables
Date: Thu, 18 Aug 2005 15:04:29 -0400
Message-ID: <E656E2CC1C5AEB42ACB00EB83122C7741FCDB1@farmer.vikus.com>
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

By default FTPS (FTP over SSL, not to be confused with FTP/SSH or SFTP)
runs on port 990. It also sounds like you're using passive mode - if so
you may need to open those ports as well. It would make sense to me
(although I don't know) that conntrack_ftp could only track unsecured
FTP sessions since the only indication of a port change is in the packet
data (which would be encrypted). Someone may know better than I, though.

Derick Anderson

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Vects
> Sent: Thursday, August 18, 2005 2:53 PM
> To: netfilter@lists.netfilter.org
> Subject: ftps and iptables
>=20
> Hi,
> I have web server protected by iptables at office, lately I=20
> wanted to activate ftps on it but failed to get a list by=20
> client. It's working well when iptables are down. I played=20
> with iptables rules, open full access from web server but it=20
> didn't help. I couldn't find anything special what prevents=20
> it to operate. Does somebody already solved such a problem?=20
>=20
> Thanks, Alexc.
>=20
>=20
>=20
>=20


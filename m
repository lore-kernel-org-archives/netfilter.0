From: "Ian Pollock" <ianp@highsun.com.au>
Subject: RE: Block MSN Messenger & Yahoo Messenger
Date: Fri, 12 Dec 2003 10:02:35 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F5267F735EEF4446A3FC6FD2821A1970016C5C@server.skinners.highsun.com.au>
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
To: netfilter@lists.netfilter.org

by using the below rules in your squid.conf will stop msm, not sure =
about yahoo but if you check your log and look for the yahoo lookup =
entries you could modify these rules to suit yahoo blocking mabye..

<snip> -- squid.conf --

acl msnmessenger url_regex -i gateway.dll

http_access deny msnmessenger=20

ian



-----Original Message-----
From: Michael Gale [mailto:mgale@utilitran.com]
Sent: Friday, 12 December 2003 9:46 AM
To: netfilter@lists.netfilter.org
Subject: Re: Block MSN Messenger & Yahoo Messenger


Hello,

	Would running squid in transparent mode with no cache :) be able to =
block MSN and yahoo messenger :)

Michael.


On Thu, 11 Dec 2003 10:43:28 +1000
"Lawrence Tang" <ingsiong@daltron.com.pg> wrote:

> Hi,
>     I have an RH9 with NAT access for the client. I would like to =
block MSN & Yahoo messenger from the client to access.
>     Can any body advice me ? Thanks in advance.
>=20
> Best Regards,
> =20
> Lawrence Tang=20
>=20


--=20
Michael Gale
Network Administrator
Utilitran Corporation



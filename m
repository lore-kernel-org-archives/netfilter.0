From: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
Subject: RE: Allow active and passive FTP connections
Date: Thu, 17 Jun 2004 08:13:07 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2E314DE03538984BA5634F12115B3A4E894F8D@email1.mitretek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Chris Brenton <cbrenton@chrisbrenton.org>, Sagara Wijetunga <sagaralists@yahoo.com>
Cc: netfilter <netfilter@lists.netfilter.org>

I think he meant, modprobe ip_conntrack_ftp and if you are behind nat
there is a module for that as well.


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Chris Brenton
Sent: Thursday, June 17, 2004 8:08 AM
To: Sagara Wijetunga
Cc: netfilter
Subject: Re: Allow active and passive FTP connections

On Thu, 2004-06-17 at 07:03, Sagara Wijetunga wrote:
>
> I have following issues relating to above rules:
> 1. For active FTP requests by remote clients, it drops
> the data connection request to the remote client from
> the server on the OUTPUT chain.=20
>=20
> 2. For passive FTP requests by remote clients, it
> drops the data connection request to the server from
> remote clients on the INPUT chain.

Try:
insmod ip_conntrack_ftp

HTH,
C







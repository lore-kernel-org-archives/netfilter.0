From: "Piszcz, Justin" <jpiszcz@servervault.com>
Subject: RE: IRC and ident with iptables
Date: Mon, 6 Jun 2005 07:00:14 -0400
Message-ID: <F8B974E70BDE1745ABB27AF04788FA005BFE3A@mail1.dulles.sv.int>
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
To: /dev/rob0 <rob0@gmx.co.uk>, Alexander Salmin <security.member@gmail.com>
Cc: netfilter@lists.netfilter.org

Yes, oidentd.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of /dev/rob0
Sent: Sunday, June 05, 2005 10:46 AM
To: Alexander Salmin
Cc: netfilter@lists.netfilter.org
Subject: Re: IRC and ident with iptables

Alexander Salmin wrote:
> diffrent ident. So, what I would like to know is if there is a way to
> make iptables recognize to whom it should portforward to, based of
> what internal ip that is connecting. Can it be done? If not, is there

That would be tricky, but perhaps possible using some extension of=20
connection tracking ... whoever makes a new connection to an ircd is=20
going to get the next ident query from that IP.

> any identd-server for Linux 2.6 that you know could do this?

This is how I'd go about it. I've seen numerous identd's listed on=20
freshmeat which claim to be able to do this. It wouldn't be that=20
complicated, I think: look up the connection in ip_conntrack, query the=20
appropriate internal identd, give that reply to the external client.
--=20
     mail to this address is discarded unless "/dev/rob0"
     or "not-spam" is in Subject: header



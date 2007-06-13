From: "Martin McKeay" <mmckeay@stillsecure.com>
Subject: RE: ..prevention, was: syn DDoS attack solution
Date: Wed, 13 Jun 2007 11:44:21 -0600
Message-ID: <5C9E8CCEEB81ED498AC0C3B0054704F302A8427E@webmail.latis.com>
References: <20070613192619.e6a0e7eb.arnt@c2i.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <20070613192619.e6a0e7eb.arnt@c2i.net>
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
To: Arnt Karlsen <arnt@c2i.net>
Cc: netfilter@lists.netfilter.org

I'm not directly involved in the firewall for the corporation in my
current postion, but as the Security Manager at my last employer, one of
the things we did was set up a schedule of regular firewall reviews by a
committee consisting of the firewall admin, the network admin and
myself. We had a check list of the minimum requirements for the
firewalls, including the bogons and a final deny all rule.  It was a
e-commerce software/hosting company, so we had over 30 firewalls we
managed.  Our entire IT department, including myself and the IT Director
was 7 people, so you can guess this wasn't something people liked making
time for, but it saved us a more than once when someone had made a
mistake in the firewall configuration.

I like the idea of an automatic update, but I think it's more important
to have regular peer review of the firewall configuration.  It's worked
well for me in the past

Martin


Martin McKeay, CISSP, GSNA
Cobia Product Evangelist
StillSecure
martin@stillsecure.com
707-495-7926
http://www.cobiablog.com

-----Original Message-----
From: Arnt Karlsen [mailto:arnt@c2i.net]=20
Sent: Wednesday, June 13, 2007 11:26 AM
To: Martin McKeay
Cc: R. DuFresne; netfilter@lists.netfilter.org
Subject: Re: ..prevention, was: syn DDoS attack solution

On Wed, 13 Jun 2007 08:24:24 -0600, Martin wrote in message
<5C9E8CCEEB81ED498AC0C3B0054704F302A8410E@webmail.latis.com>:

> It's manual at this point.  The bogons aren't changing that often to=20
> the best of my knowledge, maybe 3-4 times a year at most.

..rare enough to forgen't all about it then.  Cron job?

--
..med vennlig hilsen =3D with Kind Regards from Arnt... ;o) ...with a
number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three:=20
  best case, worst case, and just in case.



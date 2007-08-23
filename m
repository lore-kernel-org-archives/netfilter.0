From: "michel banguerski" <banguerski+nfdev@gmail.com>
Subject: Re: Change ip_conntrack_sip default port
Date: Thu, 23 Aug 2007 18:29:15 +0200
Message-ID: <cba9bb580708230929g10e5f341y6b3ba88cf8e544fd@mail.gmail.com>
References: <DIIE.00000AF100044B14@aressi.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
	b=galrqZ6gbncQhh8V/0Pw3yvzBJTStSnPQ7t75fQvbiu2PSG281gc/imnLTl93wf7JthgJvZ2eIX6OgOMjTTL2NS9bVa6iVWQenR8m5rRO2lcS71p+py6RBtcxdgdhDb8O3CxHyr78/Anto6QO7npaf5fC9U3y8KzzzqKfCvQklM=
In-Reply-To: <DIIE.00000AF100044B14@aressi.fr>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
To: Sebastien VECTEN <svecten@aressi.fr>
Cc: Mail List - Netfilter <netfilter@lists.netfilter.org>

Hi S=E9bastien

There is a match module that may do what you want:
"-m helper" with --helper argument that in wour case sould be
"sip-xxxx" I believe

I came across this in the iptables manual but never tested. Please let
me know if it works for You.

Best regards
Michel

2007/8/23, Sebastien VECTEN <svecten@aressi.fr>:
> Hi,
>
> I tried to change the default port of sip_contrack and h323_conntrack in =
iptables. The problem is those conntrack are "hard compiled" in the kernel =
(not as module if not the command "modprobe ip_conntrack_sip port=3Dxxxx" i=
s the solution).
>
> I would like to know if its possible to change this port (without change =
kernel) when the conntrack is "hard compiled" and especially where? (file o=
r sysctl.conf etc... I didn't find)
>
> By advance thank you for your assistance.
>
>
> .VECTEN S=E9bastien
>
>
> To: netfilter@lists.netfilter.org
>     netfilter-failover@lists.netfilter.org
>
>
>
>
>


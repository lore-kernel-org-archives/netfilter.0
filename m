From: Franck JONCOURT <franck.mail@dthconnex.com>
Subject: Re: NAT session tracking
Date: Sat, 29 Mar 2008 18:27:14 +0100
Message-ID: <b50c8cb36f98921e579ba99d3c17b9ac@localhost>
References: <47EE7881.6090607@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47EE7881.6090607@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org


On Sat, 29 Mar 2008 18:12:33 +0100, Pascal Hambourg=0D
<pascal.mail@plouf.fr.eu.org> wrote:=0D
> Hello,=0D
=0D
Hi,=0D
 =0D
> Ganesh Kumar N M a =C3=A9crit :=0D
>> I am trying to understanding the nat connection tracking. my doubt i=
s=0D
>> how can I see the existing nat sessions=0D
> =0D
> cat /proc/net/ip_conntrack (/proc/net/nf_conntrack on recent kernels)=
,=0D
> or netstat-nat.=0D
=0D
Have a look at http://people.netfilter.org/pablo/conntrack-tools/=0D
and its man page.=0D
=0D
---=0D
=46ranck Joncourt=0D
http://www.debian.org/ - http://smhteam.info/wiki/=0D



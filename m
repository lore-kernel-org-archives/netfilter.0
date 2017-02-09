From: "Mario Leone" <mario.leone@certimeter.it>
Subject: Re: R: Bridge
Date: Thu,  9 Feb 2017 12:28:17 +0100
Message-ID: <OL3UJ5$797E6AA5BE1DAA47DF6B1377D7EE4A4C@certimeter.it>
References: <20170209105749.GA2149@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20170209105749.GA2149@salvia>
References: =?iso-8859-1?q?=3C008c01d28229=2487da0cd0=24978e2670=24=40certimeter?=
        =?iso-8859-1?q?=2Eit=3E_=3C001001d282be=24beec73d0=243cc55b70=24=40ce?=
        =?iso-8859-1?q?rtimeter=2Eit=3E_=3C20170209105749=2EGA2149=40salvia?=
        =?iso-8859-1?q?=3E?=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aruba.it; s=a1;
        t=1486639697; bh=iKpeNtiffq2jNSvuGNkp1bUhLkXs8ASnJi/RHAU3Etc=;
        h=Date:Subject:MIME-Version:Content-Type:From:To;
        b=oOMD9RfBmmxtmyG+lL2BobQmERD+JsN5u7jr0AthT7iB/vuivqDE6uc2cxlQlS24X
         WQgTadgK13YZpvYEsGevGd4AypJbTcgq3rRMeLoWiyC1aAF7dd5MYPNAxrYn5Pvp4q
         0ppAtjXXnNNNKmWnwY6ctYG95cjnnZEQhYCJ14ifXzzQbgvL4i7fNLDt688yFkqnyh
         yN4YmMDPrXepl8g9QkHSNBF7we807DjqTs9wtUorpWCX2r8QYpK3Jqqx59MRTV6Pws
         x3LmKn57xA3Gze3bHFMcxZu1KdgI4RjbRsK6Fuw03O88oxzLR2vOiT+EfMmwtT+hWT
         VhF51sr3uPiKQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: pablo@netfilter.org
Cc: netfilter@vger.kernel.org

> On Thu, Feb 09, 2017 at 11:24:49AM +0100, Mario Leone wrote:=0A> > As s=
aid here: http://ebtables.netfilter.org/documentation/bridge-nf.html=0A> =
> =0A> > bridge-nf-call-arptables=0A> > bridge-nf-call-iptables=0A> > bri=
dge-nf-call-ip6tables=0A> > =0A> > are enabled by default=0A> > =0A> > ec=
ho 1 > bridge-nf-filter-vlan-tagged=0A> > does nothing=0A> > =0A> > echo =
1> bridge-nf-filter-pppoe-tagged=0A> > drops the connection=0A> =0A> What=
 kernel and userspace tooling versions are you using?=0A=0Aroot@zotac:~# =
uname -r=0A4.9.0-kali1-amd64=0Aroot@zotac:~# ebtables -V=0Aebtables v2.0.=
10-4 (December 2011)=0Aroot@zotac:~# iptables -V=0Aiptables v1.6.0=0A=0A=0A=
tail -n +1 /proc/sys/net/bridge/bridge-nf-*=0A=3D=3D> /proc/sys/net/bridg=
e/bridge-nf-call-arptables <=3D=3D=0A1=0A=0A=3D=3D> /proc/sys/net/bridge/=
bridge-nf-call-ip6tables <=3D=3D=0A1=0A=0A=3D=3D> /proc/sys/net/bridge/br=
idge-nf-call-iptables <=3D=3D=0A1=0A=0A=3D=3D> /proc/sys/net/bridge/bridg=
e-nf-filter-pppoe-tagged <=3D=3D=0A0=0A=0A=3D=3D> /proc/sys/net/bridge/br=
idge-nf-filter-vlan-tagged <=3D=3D=0A1=0A=0A=3D=3D> /proc/sys/net/bridge/=
bridge-nf-pass-vlan-input-dev <=3D=3D=0A0=0A=0A=0A> --=0A> To unsubscribe=
 from this list: send the line "unsubscribe netfilter" in=0A> the body of=
 a message to majordomo@vger.kernel.org=0A> More majordomo info at  http:=
//vger.kernel.org/majordomo-info.html=0A> =0A=0A=0A

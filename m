From: =?iso-8859-1?Q?Andr=E9_Paulsberg-Csibi_=28IBM_Consultant=29?= 
        <Andre.Paulsberg-Csibi@evry.com>
Subject: RE: nf_conntrack_max
Date: Fri, 2 Sep 2016 06:27:20 +0000
Message-ID: <7fcee9a08e254004b9a4517bf46a29a0@CCDEX021.corp.corpcommon.com>
References: <000e01d203d5$3e576d00$bb064700$@bluemarble.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <000e01d203d5$3e576d00$bb064700$@bluemarble.net>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: John Ratliff <jratliff@bluemarble.net>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi John ,

You should try to identify WHY your sessions are reaching as much as 80-90k=
 connections ,
as I would say that this is some sort of anomaly ( from my experience ) .

In the meantime there is no real issues increasing you the connection table=
 while you figure that out ,
and you can also GLOBALY fix the UDP timeouts if you so desire as most like=
ly this can be lowered significantly from
the defaults , here you can see one example from a smaller FW then yours ( =
but still applicable ) :

zotac:~ # grep netfilter /etc/sysctl.conf
net.netfilter.nf_conntrack_max =3D 10000
net.netfilter.nf_conntrack_tcp_timeout_established =3D 3600
net.netfilter.nf_conntrack_tcp_timeout_close_wait =3D 40
net.netfilter.nf_conntrack_tcp_timeout_fin_wait =3D 40
net.netfilter.nf_conntrack_tcp_timeout_syn_recv =3D 40
net.netfilter.nf_conntrack_tcp_timeout_syn_sent =3D 40
net.netfilter.nf_conntrack_tcp_timeout_time_wait =3D 40
net.netfilter.nf_conntrack_udp_timeout_stream =3D 60
net.netfilter.nf_conntrack_udp_timeout =3D 10

You can most likely use lower values depending on your sessions in the FW a=
nd how the communicate ,
and you should also look at statistics about WHAT sessions are being left o=
ver and adjust any "problem" sessions lower ...


Typically DNS use mostly UDP , so with a default timeout of 30 you would ne=
ed approx. 3000 UDP sessions
per second without any response to create 90k connections ( which seems exc=
essive for any environment ) .
Having a default of 10 seconds timeout would drop your connections down to =
30k at the same session rate ,
but would obviously not fix your underlying issue of why there are so many =
sessions in the first place .



Best regards
Andr=E9 Paulsberg-Csibi
Senior Network Engineer=20
Fault Handling
IBM Services AS
andre.paulsberg-csibi@evry.com
M +47 9070 5988




-----Original Message-----
From: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.kernel.o=
rg] On Behalf Of John Ratliff
Sent: 1. september 2016 00:16
To: netfilter@vger.kernel.org
Subject: nf_conntrack_max

What are the implications of raising net.ipv4.netfilter.ip_conntrack_max?

I have a pair of firewalls in an active/passive failover setup (using
keepalived and conntrackd) that I want to use to NAT several services
behind. When I added DNS yesterday, I quickly exceeded the default 65536
value. It never appeared to exceed 85000, so I simply doubled it for the
time being.

When I was reading about this online, there were many suggestions for
putting DNS servers outside the firewall. I am ambivalent about this
solution. It will work, but it will require me to duplicate many rules from
my main firewall to the packet filter on the individual DNS servers that I
Would prefer not be duplicated.

Would there be a serious performance penalty to simply raising the
conntrack_max value to 256k, 512k, or 1024k? Is it best to try and avoid
large connection tracking tables like this? I do not know what my average
table would be, but I would expect 100k from the data I have so far.

Thanks.

--John


--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

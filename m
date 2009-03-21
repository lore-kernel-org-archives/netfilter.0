From: Yun Lin <overcloud@gmail.com>
Subject: HELP!! responded Tuple doesn't match after MASQUERADE, and marked
 as IP_CT_NEW,therefor no DNAT will be applied
Date: Sat, 21 Mar 2009 14:54:58 +0100
Message-ID: <49C4F1B2.9070306@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=SckoqceCTu/7rnVMPMrErbJvxMPvXnLXWJVQGaxxgdM=;
        b=ceVBBEcNhRoUHJMn6qIuxz3spvJRHOke4N1TfQ7zAyuBoU6q/M2ijjbl16ii6qi8VI
         E04nXRenZAI9D0XGl8pVM4P3XswYoTHexRMmCvjsUM4KhmYWJnHVThH7kb4D47mC1Jy7
         YyTiTkwbDdIlz+6O0N3xx+GkCDx5a6EVSImMQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

I am going to conntrack and NAT for a udp traffic with destination port
4. So I just changed very a little lines of helper structer in the
nf_conntrack_ftp.c :
ftp[i][j].tuple.src.u.udp.port =3D 4;
ftp[i][j].tuple.dst.protonum =3D IPPROTP_UDP;

and right after it enters the conntrack_helper i printed out the tuple
content of the skbuff.
It looks like this:
for the initiatted Query,
ctinfo =3D IP_CT_NEW;
the original tuple is:
0x0a151615:4 -> 0x0a161717:4 l3num:2 protonum:17
the reply tuple:
0x0a161717:4 -> 0x0a161716:4 l3num:2 protonum:17(here the ipt_MASQUERAD=
E
has altered the reply tuple after SNAT).

and when the Response comes, the output is then:
ctinfo =3D IP_CT_NEW(which i think should be IP_CT_IS_REPLY)
original tuple:
0x0a161717:4 -> 0x0a161716:4 l3num:2 protonum:17
reply tuple:
0x0a161716:4 -> 0x0a161717:4 l3num:2 protonum:17

I think the promblem here is that when the Response get into
"resolve_normal_ct()", it couldn't find the right tuple it belongs to,
so the netfilter initiated a new tuple for it as what i'v printed out.
But the original tuple of Response matched exactly the reply tuple of
Query. It should find the right tuple when it get into PREROUTING hooks=
,
but not initiated a new tuple of it..

Is there someone could help me figure this out??

best regards!!


--=20
Yun Lin
76137 Karlsruhe
Baden-W=A8=B9rttemberg
overcloud@gmail.com


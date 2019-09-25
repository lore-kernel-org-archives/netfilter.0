From: Otto Reinikainen <ottorei@student.uef.fi>
Subject: Regarding flowtables and conntrack
Date: Wed, 25 Sep 2019 02:55:56 +0000
Message-ID: <HE1PR0102MB3290FDE6C3446C3F16CBEA6E94870@HE1PR0102MB3290.eurprd01.prod.exchangelabs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=studentuef.onmicrosoft.com; s=selector2-studentuef-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IaAWW0SNPZF8fiuEvORJ0L/k+JVd+jowqNlKToPZOU=;
 b=e6PmHRM3RiaJRFENYo3X7ZPwuAIWYvB4Qmzbx4oqABhQ/enIXSO101LStUNA6o1FWTC4sqmXa3gy6vUOSbSoXmSczL7wNFEzWNK9U4xJL70Fk6u1wtyfJxNQDl4BQtUqnAhp8R5JEerwW3vNyOKKp3xwwblJf4E++rtWDWdS2xc=
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

 Dear maintainers,=0A=
=0A=
I am using flowtables and conntrack in my testing environment and could not=
 figure some things by reading the man-page. Could you kindly provide some =
assistance with the following questions?=0A=
=0A=
1) How can one resize the flowtable and is it recommended to use some speci=
fic values for example anything with power of 2?=0A=
2) What would happen if the flowtable were to get full? Would the rule that=
 insert a new entry just skip and the packet would follow the traditional f=
orwarding path?=0A=
3) Should I be using one big enough flowtable or use multiple smaller ones?=
 I am expecting around 200k active connections.=0A=
4) I have resized the maximum conntrack size by using the sysctl-variable. =
Should the hashsize of the conntrack-module also be increased and what is t=
he recommended ratio here? Is using 1:1-ratio going to cause any specific i=
ssues other than using more RAM?=0A=
=0A=
I am currently using a rule to add flow entries before accepting packets wi=
th normal CT ESTABLISHED -rule like this:=0A=
add rule ip filter FORWARD ct state established iif $wan-if oif $lan-if cou=
nter flow offload @fastpath comment "LAN <-> INTERNET FASTPATH TEST"=0A=
add rule ip filter FORWARD ct state vmap @ct_map comment "ANY <-> ANY, ESTA=
BLISHED, RELATED"=0A=
[.. other accept-rules]=0A=
add rule ip filter FORWARD log group 31 counter drop comment "POLICY DROP F=
ORWARD"=0A=
=0A=
5) For testing purposes I am matching on conntrack first before adding the =
flow to the flowtable. If I understood correctly, this is not really needed=
 and I should probably remove that match and just add the flow. Is this the=
 way it should be used?=0A=
=0A=
And the flowtable itself looks like this:=0A=
add flowtable ip filter fastpath { hook ingress priority filter ; devices =
=3D { enp6s0f0, enp6s0f1 }; }=0A=
=0A=
The GNU/Linux distribution is the latest Debian testing with kernel 5.2.0-2=
-amd64 #1 SMP Debian 5.2.9-2 (2019-08-21) x86_64 GNU/Linux.=0A=
=0A=

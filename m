From: "Cornu Nicolas" <n.cornu@ifrance.com>
Subject: Re: iptables with iplimit option
Date: Sun, 24 Aug 2003 19:14:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001a01c36a63$3f91eb60$0100a8c0@windows>
References: <BAY7-F298fdFsLowAQZ000006e9@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

unsuscribe
----- Original Message -----=20
From: "Noname Noname" <spphu@hotmail.com>
To: <netfilter@lists.netfilter.org>
Sent: Sunday, August 24, 2003 5:02 AM
Subject: iptables with iplimit option


> Hi all
>
> i'm trying to use iptables with iplimit option, i'm getting the below
> problem
> can any one help what is the caused problem and how can I solve it?
>
> [root@www root]# iptables -A INPUT -p tcp --syn --dport http -m iplimit
> --iplimit-above 4 -j REJECT
> iptables: No chain/target/match by that name
>
> thanks in advanced
>
> _________________________________________________________________
> Add photos to your e-mail with MSN 8. Get 2 months FREE*.
> http://join.msn.com/?page=3Dfeatures/featuredemail
>
>
> _____________________________________________________________________
> Envie de discuter en "live" avec vos amis ? T=E9l=E9charger MSN Messenger
> http://www.ifrance.com/_reloc/m la 1=E8re messagerie instantan=E9e de Fra=
nce

_____________________________________________________________________
Envie de discuter en "live" avec vos amis ? T=E9l=E9charger MSN Messenger
http://www.ifrance.com/_reloc/m la 1=E8re messagerie instantan=E9e de France



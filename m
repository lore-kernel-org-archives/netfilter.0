From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: How to find nvl table?
Date: 15 Apr 2003 09:11:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1050390689.5204.34.camel@elendil.intranet.cartel-securite.net>
References: <20030415065751.DEEDD1C6C8DB0@sm205.163.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030415065751.DEEDD1C6C8DB0@sm205.163.com>
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
To: Bobo <boboaq@163.com>
Cc: Stephane Ouellette <ouellettes@videotron.ca>, "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Le mar 15/04/2003 =E0 09:02, Bobo a =E9crit :
>   While I execute "iptables  -nvL input"
>   I got the following message on screen:
>
>    [root@myfirewall account]# iptables -nvL  input
> iptables: Table does not exist (do you need to insmod?)

Just type what you were told to, respecting the case...

root@elendil:~# iptables -nvL input
iptables: Table does not exist (do you need to insmod?)

root@elendil:~# iptables -nvL INPUT
Chain INPUT (policy DROP 133K packets, 72M bytes)
[...]

>     why?  how to find the talbe? does  it need a special patch?

Won't answer this :))))

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE


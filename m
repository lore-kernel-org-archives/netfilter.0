From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Difference between two policies
Date: 12 Feb 2003 11:06:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045044397.12849.4.camel@elendil.intranet.cartel-securite.net>
References: <20030211185455.1d64ea21.elesouef@nerim.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030211185455.1d64ea21.elesouef@nerim.net>
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
To: Emmanuel lesouef <elesouef@nerim.net>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Le mar 11/02/2003 =E0 18:54, Emmanuel lesouef a =E9crit :
> I would like to know if you see a difference between these two script-p=
arts :
> script 1 :=20
> iptables -P INPUT ACCEPT
> [... some rules related to INPUT...]
> iptables -A INPUT DROP
> script 2 :
> iptables -P INPUT DROP
> [...the same rules related to INPUT...]

Produce the same effect. The second one is, imho, much more clean.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE



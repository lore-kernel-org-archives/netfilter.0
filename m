From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: ebtables
Date: 03 Feb 2003 09:13:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1044260017.9110.4.camel@elendil.intranet.cartel-securite.net>
References: <F1491anbn2gNDSWnV8u0000c14c@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F1491anbn2gNDSWnV8u0000c14c@hotmail.com>
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
To: Afshin Lamei <linux_st@hotmail.com>
Cc: netfilter@lists.netfilter.org

Le sam 01/02/2003 =E0 12:13, Afshin Lamei a =E9crit :
> I've a question about bridging firewall. Is it needed to work with ebta=
bles=20
> module to have both firewall and bridge?

Yes, you do. Netfilter framework has to be built in kernel in order to
use ebtables stuff.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE



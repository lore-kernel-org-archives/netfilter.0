From: "Luis Fernando C. Talora" <talora-listas@talora.com.br>
Subject: Redirect for transparent proxy does not work with https
Date: Fri, 21 Mar 2003 14:57:49 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030321175750.6512.qmail@hm36.locaweb.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
References: 
In-Reply-To: 
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

Fellows,

I've tried to use RedHat Linux 8.0 to build a transparent proxy with squid =
(squid-2.4.STABLE7-4) and netfilter=20
(iptables-1.2.6a-2). Squid is listening on port 8080. When a http packet ar=
rives, the requisition appears on squid=20
log and the page is viewed nicely. When a https requisition is made, squid =
seem not to recieve the redirection=20
from netfilter, though. The nat rule used for redirection follows:

      iptables -t nat A PREROUTING -i $EXTERNAL_INTERFACE -p tcp -d ! $INTE=
RNAL_NETWORK -m multiport --
dports 80,443 -j REDIRECT --to-port 8080

Can anybody please help me?

Thanks a lot!

Regards,

Lu=EDs Fernando C. Talora



From: "Mauricio Gouvea" <mgouvea@cederj.rj.gov.br>
Subject: NAT and DNS
Date: Wed, 11 Sep 2002 09:10:24 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001301c2598c$351f9170$65ba030a@cecierj.adm>
References: <20020829192902.29524.97535.Mailman@kashyyyk>
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

Hi, is it possible to put a DNS server behind a firewall (iptables) doing
NAT ? If I set the FORWARD rules for a valid ip alias 0n my firewall and the
POSTROUTING for an inside IP address this DNS SErver will answer to external
world with no problems ??? I=B4ve never tested this.

Thanks,

Mau



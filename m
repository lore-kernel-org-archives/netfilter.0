From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: FTP and netfilter
Date: Thu, 24 Apr 2003 08:00:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001001c30a26$d068f400$0401000a@sterenborg.info>
References: <002e01c309c6$f6712290$0401000a@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002e01c309c6$f6712290$0401000a@sterenborg.info>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> iptables -A FORWARD -I <eth_lan> -o <eth_inet> -s <net_lan> -j ACCEPT

Mmm.. That should obviously be -i, not -I.

R.



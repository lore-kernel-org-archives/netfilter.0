From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: simply confusing
Date: Thu, 23 Jan 2003 22:41:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003b01c2c328$3c65fc20$0401000a@robbysan.org>
References: <20030123204057.27229.qmail@web11405.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030123204057.27229.qmail@web11405.mail.yahoo.com>
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

> Well, I added a logging rule before that:
>=20
> iptables -A INPUT --source 10.11.0.0/16 \
>   -j LOG --log-level info --log-prefix "iptables "
>=20
> But when ever something gets through, it isn't being
> logged either... If I do "iptables -L -v", then I see
> that both rules (first the LOG, then the DROP) have
> the same packet count.
>=20
> I can try using "-I" instead, but I'd also like to
> log, so how would I do that? Am I missing something fundamental?

iptables -N log_drop
iptables -A log_drop -j LOG --log-level info --log-prefix "ipt:log_drop
"
iptables -A log_drop -j DROP

iptables -I INPUT 1 -s 10.11.0.0/16 -j log_drop

What about this ?


Rob



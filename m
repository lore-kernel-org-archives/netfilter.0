From: "Greg Scott" <GregScott@InfraSupportEtc.com>
Subject: ip_conntrack_pptp: error during exp_gre - what does this mean and
	how do I fix it?
Date: Thu, 15 Sep 2005 09:07:30 -0500
Message-ID: <365871C49598504A9481DDBEC3EB495512329B@MAIL.InfraSupportEtc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Does anyone know what this error means?

Sep 12 00:50:16 xxxxx-fw kernel: ip_conntrack_pptp: error during exp_gre

These ocassionally show up in /var/log/messages on one of my firewalls.

I am using kernel 2.4.27 from kernel.org, iptables 1.2.11, and
patch-o-matic-20040621.

Thanks

- Greg Scott

From: "Filka Michal" <Michal.Filka@sitronicsts.com>
Subject: conntrack and conntrackd
Date: Thu, 30 Aug 2007 13:41:18 +0200
Message-ID: <56FFE36FCA3A3842AE12EE8B3A32229D1B681A@exbbc.stromtelecom.cz>
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
To: netfilter-failover@lists.netfilter.org
Cc: netfilter@lists.netfilter.org

Hi,

I've problem when using conntrack and conntrackd.=20

I tried to create a record using conntrack. But, I didn't see the record
in conntrackd cache neither on MASTER even BACKUP. However, I can see
the record in conntrack (conntrack -L)

Does it meen that conntrackd isn't able to synchronize manually created
conntrack records?

Michal Filka



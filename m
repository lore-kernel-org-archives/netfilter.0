From: "Filka Michal" <Michal.Filka@sitronicsts.com>
Subject: question on conntracd
Date: Wed, 22 Aug 2007 14:10:24 +0200
Message-ID: <56FFE36FCA3A3842AE12EE8B3A32229D18B9C1@exbbc.stromtelecom.cz>
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

Hi,

I have a couple of question on conntrackd

1) could anyone share results of testing highly loaded system with
synchronization of conntrack tables using conntrackd? We plan deploying
on system with >50 of new records per minute and >10000 records in table
in one time. Does anyone have any experiences on similar system?

2) which transport protocol is used for synchronization info exchange?
Did anyone test different ones?

Thanks,

Michal Filka


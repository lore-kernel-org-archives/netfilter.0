From: "Yogini Parkhi" <yparkhi@bivio.net>
Subject: RE: iptables-save file syntax
Date: Thu, 10 Oct 2002 10:46:19 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <385DA3327471554CA86AACAA2BBB813025141C@plstnexc01.corp.networkrobots.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Nicolas Cadilhac <cadilhac@cae.com>, netfilter@lists.netfilter.org

Hi Nicolas,
Those are packet and byte counters. But I think they are ignored while =
doing a restore.
These lines are setting default policies for the default chains.=20
[0:0] means packet and byte counters are zeros.

Hope this helps,
-Yogini

-----Original Message-----
From: Nicolas Cadilhac [mailto:cadilhac@cae.com]
Sent: Thursday, October 10, 2002 10:14 AM
To: 'netfilter@lists.netfilter.org'
Subject: iptables-save file syntax

Hi,

I wonder what are those numbers on these lines :

*nat
:PREROUTING ACCEPT [77070:3730176]
:POSTROUTING ACCEPT [2859:369253]
:OUTPUT ACCEPT [6476:595842]

sometimes it's 0:0 but since they are really big numbers they are not =
ports.
Also are these lines policies ?

Thanks






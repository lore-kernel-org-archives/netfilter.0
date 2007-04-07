From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: packets to local addresses
Date: Sat, 07 Apr 2007 21:27:44 +0200
Message-ID: <4617F0B0.4050903@plouf.fr.eu.org>
References: <fad2fb270704060522r4322a223g4e2e40605b3fb6a@mail.gmail.com>	<46167157.3080409@rtij.nl>	<fad2fb270704070713w37a73f82o3caaf14f987a0f7a@mail.gmail.com>	<4617BC88.102@rtij.nl>
	<Pine.LNX.4.61.0704072040300.22181@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0704072040300.22181@yvahk01.tjqt.qr>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Jan Engelhardt a =E9crit :
>>MKS wrote:
>>
>>>What is the best way to change this behaviour, that is force "general"
>>>packets out a specific interface. iptables route target???
>=20
> Use MARK and iproute2.

This won't work for local addresses. The local routing table is looked=20
up first in the routing process, before any custom ip rule can be=20
examined. So MARK and iproute2 have no effect on the routing of local=20
and broadcast addresses.


From: =?ISO-8859-1?Q?Magnus_M=E5nsson?= <ganja@0x63.nu>
Subject: iptables promisc mode
Date: Wed, 15 Nov 2006 20:43:03 +0100
Message-ID: <455B6DC7.4010904@0x63.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: Quoted-Printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Cc: magnusm@massive.se

Hi, it seems like a couple of people have asked for this before but I=20
havent seen any answers.

I want iptables to get packages that do not belong to the machine,=20
packages that are directed to others but came to me due to promisc mode.=20
I have found a patch from November 2001 that seems to do what I want but=20
after manually trying to patch it in my userspace utils segfaults. I am=20
not a programmer so no surprise I didnt manage. The old patch is here:=20
http://idea.hosting.lv/a/iptables-promisc/


So, why do I want this? (maybe you can tell me that I should do it in=20
another way)
I am having a routing switch that is mirroring the internet traffic into=20
2 interfaces in a linux machine, this machine is for example running=20
ntop to look at what people are doing (that they shouldnt do). One of=20
the things I/we are interested to find out is if people uses peer to=20
peer protocols like Direct Connect / Bittorrent. My idea was to solve=20
this with iptables layer7 filter (l7-filter.sourceforge.net), ulogd and=20
mysql. But since I cant build ULOG rules that catch the packages I am stu=
ck.

The reason to choose iptables is that I can store all the information=20
about the protocols I am interested in. Ntop doesnt have the history=20
that I want.


I am very thankful for whatever help/directions I can get.

--
Magnus M=E5nsson



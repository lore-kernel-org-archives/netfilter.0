From: "johnpeng" <johnpeng@unitytek.com.tw>
Subject: RE: Using SAME target problems
Date: Mon, 26 Feb 2007 11:55:57 +0800
Message-ID: <12511.7737021812$1172462244@news.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: 
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
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

Dear all:
=A0=A0=A0I find two problems of using =93SAME=94 target, I am using =
kernel 2.6.17.7
and iptables 1.3.5
1. =A0Multiple calls of check function:
=A0=A0=A0=A0=A0When we turn on the Debug messages ( by recompiling), I =
find that the
check function of SAME target would be called multiple times,=20
i.e =A0=A0iptables =96t nat =96A PREROUTING =96d 10.10.10.1 -j SAME =
=96to
172.31.0.1-172.31.0.3
=A0=A0=A0=A0=A0iptables =96t nat =96A PREROUTING =96d 10.10.10.2 =96j =
DNAT =96to-destination
192.168.1.1
=A0=A0=A0=A0=A0=A0=A0=A0=A0=85. Other NAT rules

=A0=A0=A0=A0=A0netfilter travels the second DNAT rules, but calls the =
check function
of the first rules of =93SAME=94 target
=A0=A0=A0=A0=A0, so does every following NAT rules.
=A0=A0=A0=A0My question is , I didn=91t see the same situation in kernel =
2.4 , is that
due to some framework change in kernel 2.6 ?

2. Can=92t remove the =93SAME=94 target:
When we issue the removal =93iptables =96t nat =96D PREROUTING =96d =
10.10.10.1 -j
SAME =96to 172.31.0.1-172.31.0.3=94,=20
Iptables get reply of =93iptables: No chain/target/match by that =
name=94,
=A0it seems the memory comparison is not equal with user level and =
kernel
level passed target info data structure,=20
Any solution?

Thanks for your help!!



From: "Igor Osin" <osin@vita-samara.ru>
Subject: Re: pom-ng h323-conntrack-nat failure
Date: Tue, 22 Mar 2005 15:48:13 +0400
Message-ID: <003401c52ed5$0721bb10$7900000a@vita.local>
References: <F8B974E70BDE1745ABB27AF04788FA0025AE74@mail1.dulles.sv.int>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; format="flowed"; charset="koi8-r"; reply-type="original"
To: netfilter@lists.netfilter.org

$ls -l patch-o-matic-ng-20050320/h323-conntrack-nat
total 20
-rw-r--r--  1 5500 5100  864 =E4=C5=CB 18  2003 help
-rw-r--r--  1 5500 5100  195 =E6=C5=D7 22 00:05 info
drwxr-xr-x  5 5500 5100 4096 =ED=C1=D2 21 02:55 linux
drwxr-xr-x  4 5500 5100 4096 =ED=C1=D2 21 02:55 linux-2.6
drwxr-xr-x  4 5500 5100 4096 =ED=C1=D2 21 02:55 linux-2.6.11

$cat patch-o-matic-ng-20050320/h323-conntrack-nat/info
Title: h323 connection tracking and NAT helper
Author: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Max Kellermann=20
<max@duempel.org>
Status: Alpha
Repository: extra
Requires: linux-2.6 >=3D 2.6.11


----- Original Message -----=20
From: "Justin Piszcz" <jpiszcz@servervault.com>
To: "=E9=C7=CF=D2=D8 =EF=D3=C9=CE" <osin@vita-samara.ru>; <netfilter@list=
s.netfilter.org>
Sent: Tuesday, March 22, 2005 3:39 PM
Subject: RE: pom-ng h323-conntrack-nat failure


This patch is for 2.4.x kernels only.




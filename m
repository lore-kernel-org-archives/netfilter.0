From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: H323 and Traffic Control
Date: Fri, 25 Oct 2002 15:35:51 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0210251532110.24794-100000@blackhole.kfki.hu>
References: <64227.193.110.152.118.1035531216.squirrel@munshine.famillemetivier.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <64227.193.110.152.118.1035531216.squirrel@munshine.famillemetivier.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yves@famillemetivier.net
Cc: netfilter@lists.netfilter.org

On Fri, 25 Oct 2002 yves@famillemetivier.net wrote:

> But I have a problem with traffic control :
> I want to give highest priority to real time traffic, like h323.
>
> I was expecting that h323 netfilter module should mark all h323 traffic,
> including RTP and RTCP UDP packets, but it seems that it only marks
> packets from known ports (those explicitely declared in iptables) and
> not UDP related packets.

You can mark the related stream by using the helper matching from
patch-o-matic. In the case of h323, you can match the H.225 and H.245
channels by the following command-fragments:

iptables .... -m helper --helper H.225 ...
iptables .... -m helper --helper H.245 ...

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary



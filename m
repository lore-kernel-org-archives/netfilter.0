From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: strange about netmeeting via iptables?
Date: Tue, 17 Sep 2002 23:54:27 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0209172350230.16587-100000@blackhole.kfki.hu>
References: <3D876911.FF34E7EB@linux.taiwan.hp.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D876911.FF34E7EB@linux.taiwan.hp.com>
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
To: Bird Chen <bird@linux.taiwan.hp.com>
Cc: netfilter@lists.netfilter.org

On Wed, 18 Sep 2002, Bird Chen wrote:

>   I am new to this list. But I have been searching for solution on this
> issue over and over. I have a linux running iptables between my intranet
> and ISP through ADSL link. And my client which is running win2k try to
> netmeeting the internet people. But when the connection was established,
> peer can hear what I am saying but I can't hear the peer's voice.

The possible problems are: either party enabled H.245 tunneling (or 'fast
start') or use RAS/gatekeeper.

The current H.323 helper works for the most simple setups only being a
crude hack.

Regards,

-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary



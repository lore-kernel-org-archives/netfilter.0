From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: RE: ipset not blocking
Date: Wed, 15 Mar 2006 17:39:58 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0603151736340.13611@blackhole.kfki.hu>
References: <D2EA20593E6AAD4DA6D07DE0EC12D1610133D8@ebs-2200.ebasedsecurity.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <D2EA20593E6AAD4DA6D07DE0EC12D1610133D8@ebs-2200.ebasedsecurity.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Raef <traef06@ebasedsecurity.com>
Cc: netfilter@lists.netfilter.org

On Wed, 15 Mar 2006, Thomas Raef wrote:

> I'm using ipset 2.2.8 version 2
> Iptables v1.3.4
> Kernel 2.6.15
>
> If I change the iptables to the INPUT chain it blocks, but more than
> just dst port 25, it blocks everything.

Could you post more details?

What is it you actually want to do? To protect a mail server behind a
firewall, or it is the mail server itself where you want to setup
iptables/ipset? Please send the output of 'iptables -nL' as well.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


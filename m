From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Change ip_conntrack_sip default port
Date: Mon, 27 Aug 2007 09:52:05 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0708270945220.5615@blackhole.kfki.hu>
References: <DIIE.00000DE000044CE3@aressi.fr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <DIIE.00000DE000044CE3@aressi.fr>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Sebastien VECTEN <svecten@aressi.fr>
Cc: netfilter@lists.netfilter.org

On Mon, 27 Aug 2007, Sebastien VECTEN wrote:

> Thank you for your response, the good solution is the helper module to 
> change the defaut port.
>
> -m helper --helper sip-5068 in a rule.

That is absolutely false: that is a *match*, which cannot do whatsoever 
with the ports of the helpers.

The SIP helper supports to specify the ports to listen to:

# modprobe ip_conntrack_sip ports=5060[,up to 8 ports]

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
           H-1525 Budapest 114, POB. 49, Hungary


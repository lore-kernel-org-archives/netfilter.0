From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: TCP connection timeout problem
Date: Mon, 17 Jul 2006 09:50:29 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0607170945190.935@blackhole.kfki.hu>
References: <44ACDDC3.7080907@eld.physics.leidenuniv.nl>
	<44B1FD6A.6010207@eld.physics.leidenuniv.nl>
	<Pine.LNX.4.58.0607100921490.12586@blackhole.kfki.hu>
	<44B3444C.3020503@eld.physics.leidenuniv.nl>
	<Pine.LNX.4.58.0607110843170.24895@blackhole.kfki.hu>
	<44B35ED9.7070008@eld.physics.leidenuniv.nl>
	<44B5FE48.7000503@eld.physics.leidenuniv.nl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44B5FE48.7000503@eld.physics.leidenuniv.nl>
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
To: Arno van Amersfoort <arnova@eld.physics.leidenuniv.nl>
Cc: netfilter@lists.netfilter.org

On Thu, 13 Jul 2006, Arno van Amersfoort wrote:

> Just did some more investigation. Didn't test with tcpdump yet as this
> issue is not reproducable easiely :-S Anyway it turns out that the
> packets shown have state "INVALID" (opposed to ESTABLISHED or NEW). So
> somehow iptables "thinks" they no longer belong to a connection
> (somehow)....

If you enabled logging invalid packets, then the kernel would produce log
lines why those packets were categorized as INVALID.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


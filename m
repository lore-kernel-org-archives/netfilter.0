From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: how to build a routing/packet filtering experimental environment
 on single PC
Date: Wed, 30 Jun 2004 14:14:11 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0406301410001.25868-100000@blackhole.kfki.hu>
References: <BAY8-F96k6GW1lnU0290007fff2@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY8-F96k6GW1lnU0290007fff2@hotmail.com>
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
To: Li Xinyi <xinyeeli@hotmail.com>
Cc: netfilter@lists.netfilter.org

On Tue, 29 Jun 2004, Li Xinyi wrote:

> I started to learn iptables a few weeks ago. I am stuck at moment because I
> dont have many machines to play with. I am wondering is there any tools,
> which can be used to build a virtual envionment to play with routing and
> packet filtering on sinple machine. Tools like VMware would not be my
> choice because I only have 1GHz PIII with 256M memory.

UML (User-Mode Linux) is excellent for such purposes. You can definitely
run several virtual machines in 256M.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary



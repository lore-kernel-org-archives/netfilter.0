From: Fabrice MARIE <fabrice@celestix.com>
Subject: Re: failed to patch the kernel "2.4.19"!
Date: Thu, 19 Sep 2002 10:32:47 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209191032.47457.fabrice@celestix.com>
References: <001e01c25f29$1a3d2d70$0201a8c0@winxp>
Reply-To: fabrice@celestix.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001e01c25f29$1a3d2d70$0201a8c0@winxp>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Bryan Ko <bryanko@i-cable.com>, netfilter@lists.netfilter.org

On Wednesday 18 September 2002 23:36, Bryan Ko wrote:
> Hi there,
> I have some torubles to patch kernel 2.4.19 with the
> patch-o-matic-20020825, below is the error messages:
> [root@zs patch-o-matic-20020825]# ./runme pending
> KERNEL_DIR=/usr/src/linux-2.4.19 ERROR: Invalid option
> KERNEL_DIR=/usr/src/linux-2.4.19
> Would anyone know what is wrong with my command? Thanks a lot!!!! =)
> Bryan Ko

Hello,

you should use it the other way around :
[root@zs patch-o-matic-20020825]# KERNEL_DIR=/usr/src/linux-2.4.19 ./runme pending

Have a nice day,

Fabrice.
--
Fabrice MARIE
Senior R&D Engineer
Celestix Networks
http://www.celestix.com/

"Silly hacker, root is for administrators"
       -Unknown


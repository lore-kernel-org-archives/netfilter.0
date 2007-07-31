From: Gregory Carter <gcarter@aesgi.com>
Subject: Re: compiling extension modules with -std=c99 fails
Date: Mon, 30 Jul 2007 21:37:05 -0500
Message-ID: <46AEA051.1@aesgi.com>
References: <23738f080707301914p65be54c2o9ef6e840c86920e6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <23738f080707301914p65be54c2o9ef6e840c86920e6@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Lots of reasons.

What version of kernel development shipped with your distro?

What version of gcc are you using?

-gc

Sashan Govender wrote:
> Hi
>
> Is there any reason why compiling the iptables extensions should fail
> when using -std=c99?
>
> cc -O2 -Wall -Wunused
> -I/usr/src/kernels/2.6.18-1.2798.fc6-i586/include -Iinclude/
> -DIPTABLES_VERSION=\"1.3.5\"
> -DIPT_LIB_DIR=\"/usr/local/lib/iptables\" -rdynamic -o iptables
> iptables-standalone.c iptables.o libiptc/libiptc.a -ldl -lnsl -std=c99
> In file included from include/libiptc/libiptc.h:6,
>                  from include/iptables.h:5,
>                  from iptables-standalone.c:38:
> /usr/src/kernels/2.6.18-1.2798.fc6-i586/include/linux/netfilter_ipv4/ip_tables.h:43:
> error: IFNAMSIZ undeclared here (not in a function)
>
>
>   



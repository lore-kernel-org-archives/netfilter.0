From: Ionut Spirlea <ionuts@SGI.rdscv.ro>
Subject: Re[2]: reset /proc/net/dev
Date: Fri, 13 Sep 2002 15:09:35 +0300 (EEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209131504590.2815-100000@SGI.rdscv.ro>
References: <5421706552.20020913144508@texlab.com.uz>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5421706552.20020913144508@texlab.com.uz>
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
To: Alexey Talikov <alexey_talikov@texlab.com.uz>
Cc: netfilter@lists.netfilter.org

On Fri, 13 Sep 2002, Alexey Talikov wrote:

> Hello Ionut,

hello Alexey,

> Thursday, September 12, 2002, 5:46:29 PM, you wrote:
[....]

> May be you can add options for this module

ok, download again
http://sgi.rdscv.ro/~ionuts/C/c_dev.tar.gz

insmod c_dev.o            # reset all counters
insmod c_dev.o INT=ppp3   # only for interface ppp3

> F.E.
> insmod c_dev.o eth1
> insmod c_dev.o ppp12
>
> -----------------------------------
> mailto:alexey_talikov@texlab.com.uz
> BR
> Alexey Talikov
> FORTEK
> -----------------------------------
>


-------
Ionut Spirlea, http://sgi.rdscv.ro/~ionuts/
Mind like parachute  -  function only when open!



From: Yann Lejeune <lejeuney@gmail.com>
Subject: Re: Problem with ROUTE target
Date: Mon, 30 Jul 2007 14:24:11 +0200
Message-ID: <20070730122411.GA6610@mano.netyl.org>
References: <2cb453e80707300029m341a5afap295e775ea0572e7c@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <2cb453e80707300029m341a5afap295e775ea0572e7c@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On 2007/07/30-09:29(+0200), Ludovic wrote :
> i'm using kernel 2.6.21.5 and iptables 1.3.7. I have patched it with
> patch-o-matic in order to have the ROUTE target but it doesn't work:
> 
> root@linux:~ $ iptables -t mangle -A POSTROUTING -d 10.8.0.6 -j ROUTE --oif tun0
> iptables: No chain/target/match by that name
> 
> root@linux:~ $ ll /lib/iptables/ | grep ROUTE
> 12 -rwxr-xr-x 1 root root  8216 Jul 26 17:55 libipt_ROUTE.so
> 
 < skip >
> 
> root@linux:~ $ lsmod
> Module                  Size  Used by
> ipt_ROUTE               3760  0
> 
> What can i do to find where my problem is ?
> 

Hi Ludovic,
 Two things:

  - help message on errors is given by iptables in user-land. It seems that
    it's compiled with "ROUTE target" support. So it (iptables) "knows" the
    command line synthax. In this case, it is a "user-land error".

  - The error you get when you send a valid command line, comes from that
    the ROUTE target may not be correctly loaded in the netfilter framework
    but lsmod shows us that you performed a modprobe...

 Can you please send the content of the file proc/net/ip_tables_target


Regards

Yann.



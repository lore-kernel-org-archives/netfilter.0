From: Jason Opperisano <opie@817west.com>
Subject: Re: connlimit against flashget
Date: Mon, 31 Jan 2005 18:31:14 -0500
Message-ID: <1107214274.4330.5.camel@hubcap.ljm.dom>
References: <87vf9fz31o.fsf@c3po.zlatenlist.net>
	<20050131160805.GA24888@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050131160805.GA24888@bender.817west.com>
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
To: netfilter@lists.netfilter.org

On Mon, 2005-01-31 at 11:08, Jason Opperisano wrote:
> just as an FYI--that rule does not limit the "number of parallel TCP
> connections to a server per client IP address."  it limits the total
> number of connections to that destination to 2, regardless of client IP
> address.
> 
> someone more adept with the connlimit match will hopefully jump in and
> correct me, but i *believe* if you want your limit to be 2 connections
> per host IP, you would use:
> 
>   iptables -p tcp --syn --dport 80 --dst www.warez.net -m connlimit \
>     --connlimit-above 2 --connlimit-mask 32 -j REJECT

i just tested this syntax on a test machine with:

  iptables -A INPUT -p tcp --syn --dport 22 \
    -m connlimit --connlimit-above 2 --connlimit-mask 32 \
    -j REJECT --reject-with tcp-reset

and appeared to work just as i thought--i could make 2 ssh connections
per source IP to this host.

test machine details (i know, i know--it needs to be updated):

$ uname -a
Linux vmg2 2.4.26-gentoo-r9 #2 Fri Sep 3 07:13:35 EDT 2004 i686 Intel(R)
Pentium(R) M processor 1.70GHz GenuineIntel GNU/Linux

$ iptables -V
iptables v1.2.11

connlimit match is from patch-o-matic-ng-20040621

HTH...

-j

--
"You must be the man who didn't know whether it was a blister or
 a boil.
 It was a gummi bear."
	--The Simpsons



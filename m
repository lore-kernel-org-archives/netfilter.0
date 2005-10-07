From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: something stupid
Date: Fri, 7 Oct 2005 20:12:36 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510072009340.17798@filer.marasystems.com>
References: <1128493268.31931.9.camel@tholian.starken.com>
	<Pine.LNX.4.61.0510061903060.31577@filer.marasystems.com>
	<1128622733.11829.12.camel@tholian.starken.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1128622733.11829.12.camel@tholian.starken.com>
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
To: Daniel Wittenberg <daniel-wittenberg@starken.com>
Cc: netfilter@lists.netfilter.org

On Thu, 6 Oct 2005, Daniel Wittenberg wrote:

> yeah, I do realize they are on the same interface, just wanted to make
> sure it was understood what I have.  The very first rule right now in my
> script:
>
> iptables -t filter -A INPUT -i eth1 -p tcp -d 1.1.1.188 --dport 25 -j
> LOG --log-prefix " SMTP_HERE " --log-level notice
>
> eth1    has IP of 1.1.1.189
> eth1:0  has IP of 1.1.1.188

Works here.

iptables -t filter -A INPUT -i br0 -p tcp -d 1.1.1.188 --dport 25 -j LOG 
--log-prefix " SMTP_HERE " --log-level notice

Oct  7 20:11:24 henrik kernel:  SMTP_HERE IN=br0 OUT= PHYSIN=eth0 
MAC=00:90:27:cc:0e:14:00:d0:b7:a7:6d:40:08:00 SRC=192.168.1.1 
DST=1.1.1.188 LEN=60 TOS=0x10 PREC=0x00 TTL=64 ID=2497 DF PROTO=TCP 
SPT=33342 DPT=25 WINDOW=5840 RES=0x00 SYN URGP=0

Regards
Henrik


From: "Craig Bernstein" <cbernstein@cbernstein.com>
Subject: Re: Logging NAT Translations
Date: Tue, 5 Jun 2007 19:10:09 -0700
Message-ID: <ae1f24730706051910o2538955drfc7ec59cf9aa3927@mail.gmail.com>
References: <ae1f24730705182015j533102bah985e9ad0e905cd2a@mail.gmail.com>
	<Pine.LNX.4.61.0705222208440.4452@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0705222208440.4452@yvahk01.tjqt.qr>
Content-Disposition: inline
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
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: netfilter@lists.netfilter.org

On 5/22/07, Jan Engelhardt <jengelh@linux01.gwdg.de> wrote:
> iptables -t nat -N yes_do_me_1
> iptables -t nat -A yes_do_me_1 -j LOG ...
> iptables -t nat -A yes_do_me_1 -j SNAT ...
>
> iptables -t nat -s 134.76.0.0/16 -d whatever -p tcp -j yes_do_me_1
>
> Or you could use `conntrack -E`... or conntrack -L for a momentary
> state.

Jan, thank you for your suggestion, but setting it up that way gives
me the same results as before.  The log entry looks like this:

IN= OUT=eth0 SRC=10.1.2.3 DST=209.85.139.147 LEN=48 TOS=0x00 PREC=0x00
TTL=125 ID=52743 DF PROTO=TCP SPT=1535 DPT=80 WINDOW=16384 RES=0x00
SYN URGP=0

"SRC" is the inside client address.  "DST" is the outside server
address.  I still need to log the outside address the client is SNATed
to, i.e. the public Internet address the server will see.

`cat /proc/net/ip_conntrack` will give me the momentary state, but I
want each connection syslogged at set-up and/or tear-down.

Petr recommended the conntrack tool, which may work but will require
upgrading a box that is currently running Debian Sarge.  Is that my
only option?

Thanks,
Craig


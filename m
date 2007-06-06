From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Logging NAT Translations
Date: Wed, 6 Jun 2007 08:01:31 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0706060759470.1547@yvahk01.tjqt.qr>
References: <ae1f24730705182015j533102bah985e9ad0e905cd2a@mail.gmail.com> 
	<Pine.LNX.4.61.0705222208440.4452@yvahk01.tjqt.qr>
	<ae1f24730706051910o2538955drfc7ec59cf9aa3927@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <ae1f24730706051910o2538955drfc7ec59cf9aa3927@mail.gmail.com>
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
To: Craig Bernstein <cbernstein@cbernstein.com>
Cc: netfilter@lists.netfilter.org


On Jun 5 2007 19:10, Craig Bernstein wrote:
> On 5/22/07, Jan Engelhardt <jengelh@linux01.gwdg.de> wrote:
>> iptables -t nat -N yes_do_me_1
>> iptables -t nat -A yes_do_me_1 -j LOG ...
>> iptables -t nat -A yes_do_me_1 -j SNAT ...
>> 
>> iptables -t nat -s 134.76.0.0/16 -d whatever -p tcp -j yes_do_me_1
>> 
>> Or you could use `conntrack -E`... or conntrack -L for a momentary
>> state.
>
> Jan, thank you for your suggestion, but setting it up that way gives
> me the same results as before.  The log entry looks like this:
>
> IN= OUT=eth0 SRC=10.1.2.3 DST=209.85.139.147 LEN=48 TOS=0x00 PREC=0x00
> TTL=125 ID=52743 DF PROTO=TCP SPT=1535 DPT=80 WINDOW=16384 RES=0x00
> SYN URGP=0
>
> "SRC" is the inside client address.  "DST" is the outside server
> address.  I still need to log the outside address the client is SNATed
> to, i.e. the public Internet address the server will see.

iptables -t nat -N ydm1
iptables -t nat -A ydm1 -j LOG "[Adress got SNATed to 134.76.13.21] "
iptables -t nat -A ydm1 -j SNAT --to 134.76.13.21

iptables -t nat -A POSTROUTING <-d condition -m condition or whatever> -j ydm1

It already was a complete example. When you SNAT, you know you do.

> Petr recommended the conntrack tool, which may work but will require
> upgrading a box that is currently running Debian Sarge.  Is that my
> only option?

Teardown logging: yes. Setup: See above and/or conntrack.


	Jan
-- 


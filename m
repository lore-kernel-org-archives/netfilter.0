From: vikrant@saysnetsoft.com
Subject: Re: match nth
Date: Mon, 9 Jan 2006 19:45:51 -0600 (CST)
Message-ID: <32925.61.246.44.47.1136857551.squirrel@saysnetsoft.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: Pedro Drimel Neto <pedrodrimel@uol.com.br>
Cc: netfilter@lists.netfilter.org

Pedro Drimel Neto wrote:

> Hi all,
>
> I'm using the module nth... and I know that is support only --packet 0
--packet 1 and --packet 2 what means that I can use only 3 IP with it...
right ?
>
> If I add a network card (-o eth1) could I use more IP's ?
>
> Regards...
>
>
>

Please read the docs carefully:-
http://netfilter.org/projects/patch-o-matic/pom-base.html#pom-base-nth

If u want to add more IP's then what u have to do  just increase the
--every value .
for example:-

iptables -t nat -A POSTROUTING -o eth0 -m nth --counter 7 --every 5 \
--packet 0 -j SNAT --to-source 10.0.0.5
iptables -t nat -A POSTROUTING -o eth0 -m nth --counter 7 --every 5 \
--packet 1 -j SNAT --to-source 10.0.0.6
iptables -t nat -A POSTROUTING -o eth0 -m nth --counter 7 --every 5 \
--packet 2 -j SNAT --to-source 10.0.0.7
iptables -t nat -A POSTROUTING -o eth0 -m nth --counter 7 --every 5 \
--packet 3 -j SNAT --to-source 10.0.0.8
iptables -t nat -A POSTROUTING -o eth0 -m nth --counter 7 --every 5 \
--packet 4 -j SNAT --to-source 10.0.0.9

i think there is no need to add more interface card.
Please correct me if i am wrong.

Thanks
Vikrant



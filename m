From: jamal <hadi@cyberus.ca>
Subject: Re: [Linux Diffserv] ANNOUNCE: tc filter extensions
Date: Sun, 5 Jan 2003 11:43:28 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030105114201.S55522__1805.74634946442$1041975202@shell.cyberus.ca>
References: <20030104125252.J48869@shell.cyberus.ca> <3E172729.2070707@promo.ro>
 <20030104133257.I48869@shell.cyberus.ca> <20030104165244.S48869@shell.cyberus.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030104165244.S48869@shell.cyberus.ca>
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
To: Ciprian Niculescu <ciprian@promo.ro>
Cc: diffserv-general <diffserv-general@lists.sourceforge.net>, lartc@mailman.ds9a.nl, netfilter@lists.samba.org, netfilter-devel@lists.samba.org



A small cutnpaste error below in the script

On Sat, 4 Jan 2003, jamal wrote:

>
> Ok, i tested basic stuff and it works. Not very useful example but
> should serve to illustrate things:
> Example below will log every packet with src ip 127.1.1.1/32 seen at
> ingres of dev lo every time it exceeds its allocated rate. the nfmark
> is also set to 2 every time the rate is exceeded.
>
> ---------- script -------
> #
> tc qdisc add dev lo ingress
> #
> tc filter add dev lo parent ffff: protocol ip prio 1 u32  \
> match ip src 127.1.1.1/32 \

match ip src 127.1.1.1/32  flowid 1:20 \

Note: "flowid 1:20" was missing.

> action police mtu 5000  rate 2500kbit burst 90k pipe \
> action ipt -j LOG --log-prefix "1:20 exceeded 2.5mbps" \
> action ipt -j mark --set-mark 2
>
> -----------------------------------------------
>
> Now try to list what we installed
>
> ------------------ listing ----------------
> jroot# tc filter show parent ffff: dev lo
> filter protocol ip pref 1 u32
> filter protocol ip pref 1 u32 fh 800: ht divisor 1
> filter protocol ip pref 1 u32 fh 800::800 order 2048 key ht 800 bkt 0
> flowid 1:20
>
>    action order 1: police 1 action pipe rate 2500Kbit burst 86153b mtu 5000b
>
>    action order 2: tablename: mangle  hook: NF_IP_PRE_ROUTING
>         target LOG level warning prefix `1:20 exceded 2.5mbps'  index 1
>
>    action order 3: tablename: mangle  hook: NF_IP_PRE_ROUTING
>         target MARK set 0x2  index 2
>
>   match 7f010101/ffffffff at 12
>
> -----------------------------
>
> Of course this is a 5 minute test.
>
> cheers,
> jamal
>


From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: problems converting iptables script from eth2 ....
Date: Wed, 29 Jan 2003 19:55:29 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301291955.29061.netfilter@newkirk.us>
References: <3E37CA31.3010907@optushome.com.au> <20030129150523.A14273@spawar.navy.mil>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030129150523.A14273@spawar.navy.mil>
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
To: seberino@spawar.navy.mil
Cc: netfilter@lists.netfilter.org

On Wednesday 29 January 2003 06:05 pm, seberino@spawar.navy.mil wrote:
> This firewall has 2 NICs for private LAN and 1 to connect
> to Internet.  I can access Internet from firewall
> fine with new DSL service if I kill iptables filtering.
>
> I tried to modify old static ip script for DSL.
> (eth2 became ppp0)
>
> Now I have a new guess...
>
> Does DSL/PPPoE need to open certain other ports, etc.
> I don't know about?? If so that would explain why
> it don't work with old static ip script that closes
> all ports it don't need.

No other communications needed, unless there's some custom client that=20
the ISP has made you install.

You are going to have problems with $INTERNET_ADDRESS in your rules,=20
though, since that is now subject to change.  Is it truly dynamic?  If=20
it usually only changes on reboot, you can get around it by setting=20
$INTERNET_ADDRESS in the start of the script equal to:
$(/sbin/ifconfig "$EXTIF" | grep inet | cut -d":" -f 2 | cut -d" " -f 1)
($EXTIF is what I use, I believe you had INTERNET_INTERFACE?)

If your IP is 'really' dynamic, you will probably need to remove that=20
match from the rules, and change "-j SNAT --to $INTERNET_ADDRESS" to "-j=20
MASQUERADE", also adding "echo 1 > /proc/sys/net/ipv4/ip_dynaddr" to=20
enable automatic tracking of the dynamic IP.

I also have a suspicion, which will take you but a moment to explore. =20
With your connection up, go to console and try "ifconfig ppp0" and "cat=20
/etc/resolv.conf" and see if you have any conflict with your=20
"reserved_networks" list.  For my service, my own IP and the nameservers=20
are public, but the P-t-P server (the 'gateway' that I talk to) is a=20
10.10.x.x IP.  I have encountered setups before where the assigned IP or=20
the nameservers are also in a 'reserved' private range, which would mean=20
problems with your script.

j



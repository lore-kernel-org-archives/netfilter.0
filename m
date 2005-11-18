From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Bad mac address
Date: Fri, 18 Nov 2005 10:34:06 +0100 (CET)
Message-ID: <62556.193.173.147.3.1132306446.squirrel@webmail.sterenborg.info>
References: <437D9BBA.9020805@eccotours.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <437D9BBA.9020805@eccotours.co.za>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Fri, November 18, 2005 10:15, Brent Clark wrote:
> Hi all
>
> I just added this to my FW
>
> $IPT -t nat -A PREROUTING -i eth0 -p tcp -s 1.2.3.4 -m mac
> --mac-source 00:00:21:41:59:e6:00:13:80:9d:38:82:08:00
> --dport 3389 -j DNAT --to 192.168.111.124:3389
> $IPT -t filter -A FORWARD -i eth0 -p tcp -s 1.2.3.4 -m mac
> --mac-source 00:00:21:41:59:e6:00:13:80:9d:38:82:08:00
> --dport 3389 -d 192.168.111.124 -j ACCEP
>
> And I keep getting this message
>
> iptables v1.3.3: Bad mac address
> `00:00:21:41:59:e6:00:13:80:9d:38:82:08:00'
>
> I did a check on the message logs, and I see this in the line for MAC
> address, the and line matches
>
> [INPUT  ]: IN=3Deth0 OUT=3D MAC=3D00:00:21:41:59:e6:00:13:80:9d:38:82:0=
8:00
>
> If someone would be so kind as to help me understand this, I would be
> most grateful.

http://www.google.com/search?q=3Diptables+log+mac
Leads to this :
http://lists.debian.org/debian-user/2000/10/msg00107.html

[quote]
The MAC=3D field is read as dst-mac:src-mac:08:00.
I don't know that the last 2 bytes mean.
[/quote]
So, it would be something like :

$IPT -t nat -A PREROUTING -i eth0 -p tcp -s 1.2.3.4 -m mac \
  --mac-source 00:13:80:9d:38:82 --dport 3389 \
  -j DNAT --to 192.168.111.124:3389

> Is it possible to get the mac address for a mac on the internet, line
> above I thought I could use this.

Only those that are on your physical network segment, which would
typically not be many.


Gr,
Rob




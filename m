From: cky@arcor.de
Subject: Re: Dinamic (www list) IP BAN ...
Date: Thu, 22 Apr 2004 19:16:57 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <19160336.1082654217586.JavaMail.ngmail@webmail07.arcor-online.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi,

just write a little script and call it by a cronjob every 30 minutes or so.

I assume your banlistfile is splitted into 2 or more tables (as you show), =
like:

192.168.0.3     #comment 1
10.10.3.2         #comment 2
192.168.44.2   #comment 3

and so on.

So take a look at this (very simple) script (if you've more iptables rules,=
 you've to change the script, of course):


#!/bin/bash

banfile=3D"/path/to/banlist.txt"

iptables -F
iptables -Z

for ip in `cat $banfile | awk '{print $1}'`; do
=09iptables -A INPUT -s $ip -j DROP
done


That's all.


Best regards,
Thomas


On Thu, 22 Apr 2004 17:47:19 +0100
Roque <roque@lpgc.net> wrote:

> Hi all, i wonder if someone could help me with a little problem ...
> I need to ban a number of IP=B4s that are posted in a plain text file on
> a web site; the file changes every 30Min. The file is as simple as
>=20
> banned-ip1    #Reason1
> banned-ip2    #Reason
> ...
>=20
> The url can be reached in this way: http://www.url.com/ip/banned.txt
>=20
> I have read the iptables man pages and haven=B4t seen nothing similar.
> Is it really posible to do so?
> Thanks in Advance. roque@lpgc.net







From: gabrix <sickuser@gmail.com>
Subject: change from eth0 ---- router interface , to ppp0 --- ethernet modem
 interface
Date: Tue, 14 Aug 2007 22:32:39 +0200
Message-ID: <46C21167.8050005@gabrix.ath.cx>
Reply-To: gabrix@gabrix.ath.cx
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:received:message-id:date:reply-to:organization:user-agent:mime-version:to:subject:x-enigmail-version:content-type:content-transfer-encoding:from;
	b=CuPQlv9IaIrGqOMohU8QsQxRKCdKCmGEAfz0Y1I2XSfih+Fgn89ZJeKp80eBwIucWtPd1eEaIMrYcEgd3ORhRQZ30gscVWPB7Uga7ufYIcvUg5gFdKhGfMqxPL2tUjXc11lClQOVaL++iv0LthLWqu8CIxptsos0OAc3W9XF4zA=
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I finally changed device to connect to internet on my gateway linux box
, from a netgear router to an ethernet modem device.
Offcourse occourred some changes in my iptables script , what before was
192.168.0.2 ip for eth0 and 192.168.0.1 for my front router now has a
eth0 with no ip and a ethernet router with my dynamic isp ip i grab with
this script :

> EXTIF=ppp0
> EXTIP="`ifconfig $EXTIF | grep inet | cut -d : -f 2 | cut -d \  -f 1`"

- -------
behind my gateway linuxbox (Debian etch) i have two more servers a mail
server and a web ftp server .Mail is working great with this iptables:
> ARGO="`ifconfig ppp0 | grep inet | cut -d : -f 2 | cut -d \  -f 1`"
> $IPT -t nat -A PREROUTING -p tcp -i $IF0 -d $ARGO --dport 25 -j DNAT --to $MAIL:25
> $IPT -A FORWARD -i $IF0 -o $IF1 -p tcp --dport 25 -d $MAIL -j ACCEPT


I have problems with http e https where i'm using this code:
> IF0=ppp0
> IF1=eth1
> $IPT -t nat -A PREROUTING -p tcp -i $IF0 -d $ARGO --dport 80 -j DNAT --to $WWW:80
> $IPT -t nat -A PREROUTING -p tcp -i $IF0 -d $ARGO --dport 443 -j DNAT --to $WWW:443
> $IPT -A FORWARD -i $IF0 -o $IF1 -p tcp --dport 80 -d $WWW -j ACCEPT
> $IPT -A FORWARD -i $IF0 -o $IF1 -p tcp --dport 443 -d $WWW -j ACCEPT

I'm using apache2 with mod_rewrite rewriting connecions from port 80 to 443.
What's wrong with my configuration ? I will try to remove that -d $ARGO
like this:
>$IPT -t nat -A PREROUTING -p tcp -i $IF0 --dport 80 -j DNAT --to $WWW:80
>$IPT -t nat -A PREROUTING -p tcp -i $IF0 --dport 443 -j DNAT --to $WWW:443
And invite you to give it a try http://www.gabrix.ath.cx let's see how
it goes.
Thanks for the attenction !
gabriele



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFGwhFnaSnKyogvewwRAhpMAKCsepaqX5XZZpuY7/Zg+cmNwNdtcACfSAyC
vLmZeFzdXaXnqio8fXXTouo=
=UdWg
-----END PGP SIGNATURE-----


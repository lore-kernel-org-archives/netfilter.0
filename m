From: "Annette Meriste" <annette.meriste@cablecom.ch>
Subject: Antw: ipmaq, success: ip_ftp, need help
Date: Thu, 13 Jun 2002 21:20:09 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <sd090c8d.096@cablecom.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: payal99@cyberspace.org
Cc: netfilter@lists.samba.org

Hi Payal,

Try this:=20

insmod ip_nat_ftp

Regards,
Annette

>>> rpayal@indiainfo.com 13.06.02 21.11 Uhr >>>
Hi,
After fiddling with iptables a lot and with a looooooot of help from list =
I=20
finally managed to get it working.
I did,
#modprobe iptable_nat
#echo 1 > /proc/sys/net/ipv4/ip_forward
#iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

Now my client machines can ping and browse the network.
Now the real problem,
My clients can ftp into many sites but there is this particular site =
where=20
when they ftp in they get=20
150 Opening ASCII mode data connection for /bin/ls.
[a long delay ]

426-Maximum disk quota limited to 10000 Kbytes
Used disk quota 364 Kbytes, available 9635 Kbytes
426 Data connection closed, transfer aborted.

It simply refuses to connect.
The server at other end is running Serv-U FTP-Server v2.5 for Winsock.
It happened a long time ago when I was using ipchains with kernel 2.2, =
then I=20
got it solved with using insmod ip_masq_ftp.
What is the solution for this now? Please tell.

Thanks a lot in advance and waiting eagerly for the answers. pLease make a =
cc=20
to payal99 @ cyberspace.org cos' this email address has a problem for a =
while.
With regards.
-Payal




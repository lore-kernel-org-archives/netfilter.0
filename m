From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: how to set ports for ip_conntrack_ftp
Date: Sat, 02 Sep 2006 17:17:05 +0200
Message-ID: <44F9A071.7070603@plouf.fr.eu.org>
References: <20060831151130.GA32342@freesources.org>	<000601c6cd14$e07a28a0$0101000a@tanjian>	<20060831155749.GC32342@freesources.org>	<44F711D4.5090002@plouf.fr.eu.org>	<20060901012054.GB23094@freesources.org>	<44F7996C.9010504@plouf.fr.eu.org>
	<20060902142712.GA31352@freesources.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060902142712.GA31352@freesources.org>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Jonas Meurer a =E9crit :
>>
>>>>What do the "-d **.**.***.**/31" address ranges represent ?
>=20
> the ftp servers listen on both ips. so both are server addresses.
>=20
> do you think that i should change the "-d ..." at -A OUTPUT to "-s ..."=
?

Obviously yes. I just wonder how these rules could accept the control=20
connection, as they did not accept the return packets from the server.

[...]
> i would like to support both active and passive mode.

To allow active mode you'll have to perform two actions :

1) Look into your FTP server configuration for an option named "passive=20
mode local port range" or the like. You must define a port range that is=20
not likely to be used by other local processes (so for example don't=20
overlap /proc/sys/net/ipv4/ip_local_port_range). The number of ports in=20
the interval must be bigger enough than the expected maximum number of=20
simultaneous data connections from FTP clients.

2) Set iptables rules in INPUT and OUTPUT which allow incoming TCP=20
connections to the port range you defined in the previous step.

[...]
> user@home~$ lftp user@62.75.128.98:9621
> lftp user@62.75.128.98:/> debug
>=20
> lftp user@62.75.128.98:/> set ftp:passive-mode on
>=20
> lftp user@62.75.128.98:/> ls
> ---> PASV
> <--- 227 Entering Passive Mode (62,75,128,98,180,236)
> ---- Connecting data socket to (62.75.128.98) port 46316
> `ls' at 0 [Making data connection...]

I guess your ruleset does not allow incoming TCP connections to the port=20
46316, so the data connection fails. Don't bother to allow this port, as=20
it is dynamic and a different one is chosen by the server for each=20
passive data connection.

> lftp user@62.75.128.98:/> set ftp:passive-mode off
>=20
> lftp user@62.75.128.98:/> ls
[...]
> ---> PORT 192,168,3,34,197,115
> <--- 200 PORT command successful.
> ---> LIST
> <--- 150 Opening ASCII mode data connection for file list
> <--- 426 Connection closed; transfer aborted
> ---- Closing data socket

That's probably the effect of the -d option in the second OUTPUT rule.=20
The server tries to open a data connection to the TCP port 50547 of=20
192.168.3.34, but this destination address doesn't match the -d option.=20
Try to change -d to -s. Check also that there is no packet filter on the=20
client which may block FTP data connections.


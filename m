From: "Stanislav Puffler DiS." <stanislav.puffler@seznam.cz>
Subject: ping to internet hosts through NameServer of provider
Date: Tue, 09 Mar 2004 10:29:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <404D8E6C.2070107@seznam.cz>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,
i=B4m newbie to fw, have just installed iptables and configured. Have 3
interfaces, eth0 - internet, eth1 - DMZ (squid, postfix), eth2 - LAN. My
provider has connected my firewall to the Internet via 1 public IP (on
eth0). Internet hosts are resolved via provider=B4s Name Server (this IP
is in /etc/resolv.conf). If I tried ping to (for example) www.rb.cz
before installing iptables, there was no problem. Now, after installing
iptables, I can=B4t ping to internet hosts correctly (only on IP - it is
without need of contacting providers NS) - it is working like this :

[user@machine]$ ping www.rb.cz
IN=3Deth0 OUT=3D MAC=3D.............. SRC=3D"my_providers_nameserver_ip"
DST=3D"ip_on_my_eth0" LEN=3D127 TOS=3D0x00 PREC=3D0x00 TTL=3D61 ID=3D3268 DF
PROTO=3DUDP SPT=3D53 DPT=3D32792 LEN=3D107

Ping to resolved IP of www.rb.cz is no problem (ping 193.86.103.40 -
returns a normal replay). Could anyone help me please how to set up
carefully and secure rule to maintain this problem - to permit my
provider=B4s NS to resolv internet hosts ?

PS : The same problem is when I ping to localhost or 127.0.0.1 (lo), my
own public ip (eth0), my DMZ ip (eth1), my LAN ip (eth2). And the very
strange thing is that when I=B4m not working in shell (only prompt is
visible) it starts time to time showing some strings (the same as I have
described above), looking like pinging my machine from some public ip in
internet. I can see these strange things in /var/log/messages. Have
tried to find anything similar in mailing list archive, nothing is there...



From: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solucoesip.net>
Subject: question on ip_conntrack log entries and behavior
Date: Thu, 20 Mar 2003 10:22:09 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00d101c2eee3$b64a6170$3201a8c0@ESTACAO>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_00CE_01C2EECA.90537BF0"
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
To: netfilter ML <netfilter@lists.samba.org>

This is a multi-part message in MIME format.

------=_NextPart_000_00CE_01C2EECA.90537BF0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit


    Hello Guys,

    I got a firewall running kernel 2.4.20 with some p-o-m patches,
including tcp-window-tracking which allows me change timeout stuff in
runtime.

    Well ...... my /proc/net/ip_conntrack log is PLENTY of CLOSE
connections, just like:

tcp 6 386819 CLOSE src=192.168.1.2 dst=200.220.254.156 sport=47617 dport=80
src=200.220.254.156 dst=200.241.238.254 sport=80 dport=47617 use=1
tcp 6 21172 CLOSE src=192.168.1.2 dst=200.208.28.191 sport=41786 dport=80
src=200.208.28.191 dst=200.241.238.254 sport=80 dport=41786 use=1
tcp 6 340817 CLOSE src=192.168.1.2 dst=216.136.226.78 sport=60094 dport=80
src=216.136.226.78 dst=200.241.238.254 sport=80 dport=60094 use=1
tcp 6 87811 CLOSE src=192.168.1.2 dst=200.208.28.224 sport=58142 dport=80
src=200.208.28.224 dst=200.241.238.254 sport=80 dport=58142 use=1
tcp 6 399392 CLOSE src=192.168.1.2 dst=200.220.254.156 sport=52780 dport=80
src=200.220.254.156 dst=200.241.238.254 sport=80 dport=52780 use=1
tcp 6 379271 CLOSE src=192.168.1.2 dst=64.191.34.195 sport=44823 dport=80
src=64.191.34.195 dst=200.241.238.254 sport=80 dport=44823 use=1

    These entries seems to be NOT cleaned after timeout, which are:

[root@firewall netfilter]# pwd
/proc/sys/net/ipv4/netfilter
[root@firewall netfilter]# cat ip_conntrack_tcp_timeout_close
10
[root@firewall netfilter]# cat ip_conntrack_tcp_timeout_close_wait
300

    These timeout values are changed in the very beggining of script
firewall.

    Seems to me that connections are not being erased because i got NO night
traffic and amount of connections seems to be stable ( please check MRTG
graph attached ).

    And, the most strange at all, I got exactly same configuration ( kernel
version, kernel patchs, iptables 1.2.7a and firewall script ) running in
other machines that do NOT shows this problem ....

    Have you ever seen something like this ? Any hint ? Any configuration
change ? Any idea ? :)


    Sincerily and thanks for your replies,
    Leonardo Rodrigues

------=_NextPart_000_00CE_01C2EECA.90537BF0
Content-Type: image/png;
	name="conexoes-day.png"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="conexoes-day.png"

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
pUL5/7KPAAAAAElFTkSuQmCC

------=_NextPart_000_00CE_01C2EECA.90537BF0--



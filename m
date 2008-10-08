From: okahei@gmail.com
Subject: Problems with DNAT UDP
Date: Wed, 8 Oct 2008 13:43:28 +0200
Message-ID: <ab52e4180810080443q48743098u4becd5cd029bd087@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=XlRtNR2beiYXb0WLiLM29Vdhkc/jIRLhQsd1NxxMUOY=;
        b=r1kCHFQseNQ23jMYZRXMwRg/FGu68wBQnV0lfKqnh5WQkfgxoW4F/Os/xI7asJmLrt
         w0hStmJa+KM9fbs3fLy5tlBYFISwyk/T8+IZ/q8i7dTMGgSXWV2T2MzleiWq/XV63uzw
         2ph3WqBZAskackUGscUl+G0SspYB04kfyBGnQ=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello List.

I have some strange problems. (i tested it with Centos 2.4 kernel and
Debian 2.6 kernel) with UDP traffic.

One of my rules :

0     0 DNAT       udp  --  eth3   *       0.0.0.0/0
0.0.0.0/0           udp dpt:6977 to:192.168.3.4:6977

port UDP 6977 on public interface DNATS to 192.168.3.4

(i must say that i have six openvpn-tunnels through this firewall with
no problems)

The udp packet never match the iptable rule, and with tcpdump running
on the firewall i see this :

fir1:~# tcpdump -i any -qn host 189.XX.XX.XX
tcpdump: WARNING: Promiscuous mode not supported on the "any" device
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on any, link-type LINUX_SLL (Linux cooked), capture size 96 bytes
15:21:18.356144 IP 189.XX.XX.XX.6977 > 213.XX.XX.XX.6977: UDP, length 60
15:21:18.356206 IP 213.XX.XX.XX > 189.XX.XX.XX: ICMP 213.XX.XX.XX udp
port 6977 unreachable, length 96
15:21:22.114444 IP 189.XX.XX.XX.6977 > 213.XX.XX.XX.6977: UDP, length 108
15:21:22.114453 IP 213.XX.XX.XX > 189.XX.XX.XX: ICMP 213.XX.XX.XX udp
port 6977 unreachable, length 144
15:21:28.314972 IP 189.XX.XX.XX.6977 > 213.XX.XX.XX.6977: UDP, length 60
15:21:28.314982 IP 213.XX.XX.XX > 189.XX.XX.XX: ICMP 213.XX.XX.XX udp
port 6977 unreachable, length 96
15:21:32.117147 IP 189.XX.XX.XX.6977 > 213.XX.XX.XX.6977: UDP, length 108
15:21:32.117157 IP 213.XX.XX.XX > 189.XX.XX.XX: ICMP 213.XX.XX.XX udp
port 6977 unreachable, length 144


Well, if i switch openvpn conf to TCP-tunnel, i works great, but with
UPD the traffic never goes inside the Kernel, never match iptables
rules.

With tcpdump i see that our firewall sends back "icmp udp port 6977 unreachable"

But with netcat i can reach this udp port from the firewall to
192.168.3.4 and other six udp tunnels work great.

Anyone knows what is happening ?

Regards

From: Gerry Reno <greno@verizon.net>
Subject: Re: fwknop: use with Fedora?
Date: Sun, 23 Sep 2007 22:47:21 -0400
Message-ID: <46F72539.1090901@verizon.net>
References: <46F5B7F8.2060502@verizon.net> <46F5C161.7090908@verizon.net>
 <46F5CF0C.3060004@verizon.net> <20070923043058.GA2940@minastirith>
 <46F65D0E.6050005@verizon.net> <46F65EBE.30502@verizon.net>
 <46F66A11.5000901@verizon.net> <46F66E89.1000809@verizon.net>
 <46F6755D.9070407@verizon.net> <46F693D1.2060909@verizon.net>
 <46F6FBCD.2070203@verizon.net> <46F71690.6040106@verizon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <46F71690.6040106@verizon.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I ran the daemon in debug mode but still no luck:

# fwknopd --debug
[+] ** Starting fwknopd (debug mode) **
[+] Building iptables config info.
/sbin/iptables -t filter -n -L INPUT
[+] starting fwknopd
[+] flushing existing iptables IPT_AUTO_CHAIN chains
/sbin/iptables -t filter -n -L FWKNOP_INPUT
/sbin/iptables -t filter -F FWKNOP_INPUT
/sbin/iptables -nL INPUT
[-] warning, could not find iptables state tracking rules in INPUT chain
[+] imported access directives (1 SOURCE definitions).
[+] Sniffing (promisc) packet data from interface: eth0
[+] pcap_loop()

After a good knock sequence is received this is all the output that I 
see from fwknopd in debug mode.

Gerry




From: Tim Evans <tkevans@tkevans.com>
Subject: ntpdate works; ntpd doesn't
Date: Fri, 2 Apr 2004 14:50:44 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404021950.i32JoiCO012686@osprey.tkevans.com>
Reply-To: Tim Evans <tkevans@tkevans.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-MD5: fJMZX0nx1+1qcsxooWML8w==
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I can manually set the time on my system with ntpdate:

# ntpdate time.nist.gov
 2 Apr 14:38:16 ntpdate[16583]: step time server 192.43.244.18 offset -48.173770 
sec

However, once I start ntpd, it never adjusts the time.

This is on a firewall system running iptables, with these rules:

$IPT -A OUT_NETWORK -m state --state NEW -p udp --dport 123 -j ACCEPT # time
$IPT -A OUT_FIREWALL -m state --state NEW -p udp --dport 123 -j ACCEPT # ntpd
$IPT -A OUT_NETWORK -m state --state NEW -p tcp --dport 123 -j ACCEPT # time
$IPT -A OUT_FIREWALL -m state --state NEW -p tcp --dport 123 -j ACCEPT # ntpd

What's wrong here?
--
Tim Evans, TKEvans.com, Inc.	|    5 Chestnut Court
tkevans@tkevans.com		|    Owings Mills, MD 21117
http://www.tkevans.com/		|    443-394-3864
http://www.come-here.com/News/	|    



From: "T. Take" <t_takejp@hotmail.com>
Subject: ULOG:  invalid argument
Date: Thu, 19 Feb 2004 20:46:12 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <LAW12-F18Uhyx9w8OjU000276ef@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="iso-2022-jp"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I cannot use "ULOG".

#iptables -A INPUT -i $OUTER_PORT -s $INNER_IP -j ULOG --ulog-nlgroup 32 
--ulog-prefix "spoofed packet "
#iptables: Invalid argument

Although I updated iptables to version 1.2.9 and installed ulogd by apt-get 
install (Debian),  I have not used ULOG yet. And there is ipt_ULOG.o in 
"/lib/modules/2.4.24/kernel/net/ipv4/netfilter".

Did you have the same problem about ULOG?
I hope your advises.

_________________________________________________________________
友達と24時間ホットライン「MSN メッセンジャー」、今すぐダウンロード！  
http://messenger.msn.co.jp 



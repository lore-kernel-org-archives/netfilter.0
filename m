From: "Michael K" <micke@klintan.se>
Subject: string module with kernel 2.4.20
Date: Mon, 28 Jul 2003 17:17:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c3551b$65930e00$c800a8c0@klintan.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

After adding string module to my kernel and compiled the kernel source.
I can't find the string module.
Did find this message on the netfilter homepage.
--
string [string.patch] [string.patch.config.in]
[string.patch.configure.help] [string.patch.help]
[string.patch.makefile] 
Author: Emmanuel Roger <winfield@freegates.be>
Status: Working, not with kernel 2.4.9

This patch adds CONFIG_IP_NF_MATCH_STRING which allows you to
match a string in a whole packet.

THIS PATCH DOES NOT WORK WITH KERNEL 2.4.9 !!!
---

Does this men that it won't work with NEWER kernels than 2.4.9? If so,
is there a replacement.

I would like to add a rule like this one.
iptables -A INPUT -p tcp --dport 80 \
-m string --string "cmd.exe" -j DROP

But error shows
iptables v1.2.7a: Couldn't load match
`string':/lib/iptables/libipt_string.so: cannot open shared object file:
No such file or directory

/Klintan




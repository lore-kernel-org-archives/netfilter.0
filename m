From: Oleg Savostyanov <savostyanov@internetplustravel.ru>
Subject: Invalid argument in -j SNAT
Date: Tue, 2 Dec 2003 21:50:27 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <13211830200.20031202215027@internetplustravel.ru>
Reply-To: Oleg Savostyanov <savostyanov@internetplustravel.ru>
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

Hello All,

After N iterations of compiling kernel, installing iptables, applying
patch-o-matic...

the following command in a script from NAT HOWTO failed to execute
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source XXX.XXX.XXX.XXX
with an error "iptables: Invalid argument" I suspect, that an argument
is XXX.XXX.XXX.XXX
yesterday everything was fine (even more - it used to work with
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE but now
to the command -j MASQUERADE it says - "iptables: Invalid argument")
ok
I changed -j MASQUERADE to -j SNAT - it demanded --to-source
I issued the above and got stuck on that


Anybody has a clue on it?
Debian 3.0
iptables v1.2.9
kernel 2.4.22

I even tryed to reboot with an old kernel - the result is the same.
Please help

-- 

Oleg                          mailto:savostyanov@internetplustravel.ru



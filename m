From: "Louie Miranda" <louie@axishift.ath.cx>
Subject: Re: Are IP ALIASES supported by iptables?
Date: Tue, 29 Jul 2003 14:03:01 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <017101c35597$13603280$020119ac@ADMWEBDEVWS>
References: <008301c3558f$22b075e0$080a0a0a@medannic> <00c401c35590$cd0c8ff0$020119ac@ADMWEBDEVWS>
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
To: HTB <kerasakti@nusa.net.id>, netfilter@lists.netfilter.org

Oh, wait i've read it wrong.. sorry..

--
Thank you,
Louie Miranda (louie@axishift.ath.cx)



----- Original Message -----
From: Louie Miranda
To: HTB ; netfilter@lists.netfilter.org
Sent: Tuesday, July 29, 2003 1:18 PM
Subject: Re: Are IP ALIASES supported by iptables?


Hi, it must be Is your Kernel compiled with IP Aliasing?
Yes, Iptables support ip aliasing.

--
Thank you,
Louie Miranda (louie@axishift.ath.cx)



----- Original Message -----
From: HTB
To: netfilter@lists.netfilter.org
Sent: Tuesday, July 29, 2003 1:06 PM
Subject: Are IP ALIASES supported by iptables?


When i want to active nat using iptable on eth0:0 (aliasing) "error appear"
# /sbin/iptables -A POSTROUTING -j MASQUERADE -t nat -s 192.168.0.0/24 -o
eth0:0
Warning: wierd character in interface `eth0:0' (No aliases, :, ! or *).

Are IP ALIASES supported by iptables?

regards
HTB



From: "blkcore" <netfilter@blackcore.net>
Subject: Re: 2.4.20 - ntfilter (owner) problems
Date: Tue, 7 Jan 2003 17:26:49 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <009701c2b6b5$04580b90$0200a8c0@void>
References: <006301c2b61f$9f88cfa0$0200a8c0@void> <200301071852.00836.tscherf@web.de>
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

You don't need a -j target to use the owner module, I use it for bandwidth
byte/counter logging, but heres some output for you to read.

[root@scsi1 root]# uname -r
2.4.20-grsec
[root@scsi1 root]# iptables -I OUTPUT -m owner --uid-owner root -j ACCEPT
iptables: Target problem

laptop:~# uname -r
2.4.19
laptop:~# iptables -I OUTPUT -m owner --uid-owner root
laptop:~# iptables -I OUTPUT -m owner --uid-owner root -j ACCEPT
laptop:~#

----- Original Message -----
From: "Thorsten Scherf" <tscherf@web.de>
To: "blkcore" <netfilter@blackcore.net>; <netfilter@lists.netfilter.org>
Sent: Tuesday, January 07, 2003 3:19 PM
Subject: Re: 2.4.20 - ntfilter (owner) problems


> I recently compiled 2.4.20 with netfilter support, with the owner module
> (-m owner), and after several attempts of trying to use it (worked for
> 2.4.18), it gives an error.
>
> [root@scsi1 slinksi]# iptables -I OUTPUT -m owner --uid-owner root
> iptables: Target problem

Where is your target?! Is see no one!





From: Oleg Savostyanov <savostyanov@internetplustravel.ru>
Subject: Re: Invalid argument in -j SNAT
Date: Mon, 8 Dec 2003 15:34:23 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <93362378993.20031208153423@internetplustravel.ru>
References: <13211830200.20031202215027@internetplustravel.ru>
Reply-To: Oleg Savostyanov <savostyanov@internetplustravel.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <13211830200.20031202215027@internetplustravel.ru>
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

I noticed some problem in my dmesq
NETIF_F_SG - what does it mean?
And could my problem be because of that problem, whyle booting the
kernel


00:09.0: 3Com PCI 3c905B Cyclone 100baseTx at 0xb000. Vers LK1.1.18-ac
 00:01:02:72:20:83, IRQ 12
  product code 4347 rev 00.12 date 07-11-00
  Internal config register is 1800000, transceivers 0xa.
  8K byte-wide RAM 5:3 Rx:Tx split, autoselect/Autonegotiate interface.
  MII transceiver found at address 24, status 7849.
  Enabling bus-master transmits and whole-frame receives.
00:09.0: scatter/gather enabled. h/w checksums enabled
PCI: Found IRQ 10 for device 00:0b.0
See Documentation/networking/vortex.txt
00:0b.0: 3Com PCI 3c905 Boomerang 100baseTx at 0xa800. Vers LK1.1.18-ac
 00:60:08:ca:51:c4, IRQ 10
  product code 4b4b rev 00.0 date 12-05-97
  Internal config register is 16302d8, transceivers 0xe040.
  8K word-wide RAM 3:5 Rx:Tx split, autoselect/MII interface.
  MII transceiver found at address 24, status 786d.
  Enabling bus-master transmits and whole-frame receives.
00:0b.0: scatter/gather enabled. h/w checksums disabled
eth1: Dropping NETIF_F_SG since no checksum feature.

Hello Oleg,


Tuesday, December 2, 2003, 9:50:27 PM, you wrote:

OS> Hello All,

OS> After N iterations of compiling kernel, installing iptables, applying
OS> patch-o-matic...

OS> the following command in a script from NAT HOWTO failed to execute
OS> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source XXX.XXX.XXX.XXX
OS> with an error "iptables: Invalid argument" I suspect, that an argument
OS> is XXX.XXX.XXX.XXX
OS> yesterday everything was fine (even more - it used to work with
OS> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE but now
OS> to the command -j MASQUERADE it says - "iptables: Invalid argument")
OS> ok
OS> I changed -j MASQUERADE to -j SNAT - it demanded --to-source
OS> I issued the above and got stuck on that


OS> Anybody has a clue on it?
OS> Debian 3.0
OS> iptables v1.2.9
OS> kernel 2.4.22

OS> I even tryed to reboot with an old kernel - the result is the same.
OS> Please help



-- 
Best regards,
 Oleg                            mailto:savostyanov@internetplustravel.ru



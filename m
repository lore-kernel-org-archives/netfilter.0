From: Herman <Herman@AerospaceSoftware.com>
Subject: Re: Port forwarding doesn't work.
Date: Sun, 12 Oct 2003 19:30:04 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310121930.04757.Herman@AerospaceSoftware.com>
References: <LFEHKEBEBHAFGJBMNKAOKELACCAA.markee@bandwidthco.com> <1066005882.1151.23.camel@valhalla> <200310121917.08663.Herman@AerospaceSoftware.com>
Reply-To: Herman@AerospaceSoftware.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200310121917.08663.Herman@AerospaceSoftware.com>
Content-Disposition: inline
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

Hmm, as far as I can see iptable_nat handles nat, and it is loaded:

lsmod
Module                  Size  Used by    Not tainted
iptable_nat            16312   1  (autoclean)
ip_conntrack           18624   1  (autoclean) [iptable_nat]
appletalk              21636   1  (autoclean)
ipx                    17188   1  (autoclean)
iptable_filter          1644   1  (autoclean)
ip_tables              11736   4  [iptable_nat iptable_filter]
lp                      6752   0
parport_pc             21736   1
parport                23840   1  [lp parport_pc]
i810_audio             23720   1
soundcore               3684   0  [i810_audio]
ac97_codec             10024   0  [i810_audio]
nfsd                   66832   8  (autoclean)
lockd                  46896   1  (autoclean) [nfsd]
sunrpc                 63356   1  (autoclean) [nfsd lockd]
ppp_async               7456   0  (unused)
ppp_generic            20092   0  [ppp_async]
slhc                    5072   0  [ppp_generic]
af_packet              13000   3  (autoclean)
ip_vs                  74424   0  (autoclean)
sr_mod                 15096   0  (autoclean)
floppy                 49244   0
3c59x                  27248   1  (autoclean)
tulip                  41088   1  (autoclean)
supermount             14116   2  (autoclean)
ide-cd                 30560   0
cdrom                  27008   0  [sr_mod ide-cd]
ide-scsi                9552   0
scsi_mod               91060   2  [sr_mod ide-scsi]
printer                 6944   0  (unused)
usb-uhci               21804   0  (unused)
usbcore                58368   1  [printer usb-uhci]
rtc                     6556   0  (autoclean)
ext3                   59916   4
jbd                    38972   4  [ext3]

So, why O why, doesn't nat work?
(My Bonnie lies over the ocean...)

Am I missing something in the kernel?

Cheers,
-- 
Herman Oosthuysen 
B.Eng(E), MIEEE
Aerospace Software Ltd.
Ph: 1.403.241-8773, Cell: 1.403.852-5545, Fx: 1.403.241-8841
Herman@AerospaceSoftware.com, http://www.AerospaceSoftware.com


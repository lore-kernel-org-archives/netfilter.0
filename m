From: Payal Rathod <payal-iptables@staticky.com>
Subject: resolving ftp servers
Date: Tue, 26 Aug 2003 09:14:21 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030826091421.GB10217@staticky.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: Netfilter ML <netfilter@lists.netfilter.org>

Hi,
I have installed Linux on RH 7.3 with iptables v 1.2.3
But when I try to connect to a Microsoft FTP Service (Version 5.0) it
hangs up afrter,
220 erecording Microsoft FTP Service (Version 5.0).
Name (208.253.196.145:root): administrator

It does not prompt for password. What must be the problem?
On some servers I it hangs when given ls command on remote hosts (Linux
machine, proftpd servers).
My lsmod gives,

# lsmod
Module                  Size  Used by
ipt_state               1152   4  (autoclean)
ipt_MASQUERADE          1824   1  (autoclean)
iptable_filter          2256   0  (autoclean) (unused)
ip_nat_ftp              3680   0  (unused)
ip_conntrack_ftp        4080   0  (unused)
iptable_nat            18224   1  [ipt_MASQUERADE ip_nat_ftp]
ip_conntrack           16944   3  [ipt_state ipt_MASQUERADE ip_nat_ftp
ip_conntrack_ftp iptable_nat]
ip_tables              11392   6  [ipt_state ipt_MASQUERADE
iptable_filter iptable_nat]
autofs                 11520   0  (autoclean) (unused)
8139too                12832   1
eepro100               17664   1
usb-ohci               18544   0  (unused)
usbcore                51712   1  [usb-ohci]
ext3                   64624   6
jbd                    40992   6  [ext3]
aic7xxx               114544   7
sd_mod                 11584   7
scsi_mod               95664   2  [aic7xxx sd_mod]

Thanks a lot and eagerly waiting for the reply.
With warm regards,
-Payal

-- 
For GNU/Linux Success Stories and Articles visit:
          http://payal.staticky.com


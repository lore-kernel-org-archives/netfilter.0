From: "Ruben Cardenal" <rubenc@arrakis.es>
Subject: Problem adding connlimit rule
Date: Tue, 10 May 2005 13:26:24 +0200
Message-ID: <41898.1624221944$1115723968@news.gmane.org>
References: <1115723584l.29661l.0l@server.moose.blogdns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1115723584l.29661l.0l@server.moose.blogdns.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

  I'm trying to add a quite simple rule but I get an error:

# iptables -I INPUT -p tcp --syn --dport 25 -m connlimit --connlimit-above
10 -j REJECT
iptables: No chain/target/match by that name

But:

# lsmod
Module                  Size  Used by    Tainted: PF 
ipt_REJECT              3160   0  (unused)
ipt_conntrack           1176   0  (unused)
ipt_limit               1048   0  (unused)
ipt_iplimit             1560   0  (unused)
ipt_TARPIT              2104   0  (unused)
af_packet              14792   0  (autoclean)
esm                    71503   1 
nls_cp437               4348   1  (autoclean)
nls_iso8859-1           2844   1  (autoclean)
smbfs                  40144   1  (autoclean)
nfsd                   85168   0  (autoclean)
abi-ibcs                6604   0  (autoclean) (unused)
abi-svr4               79620   0  (autoclean) [abi-ibcs]
lcall7                  1728   0  (autoclean) [abi-ibcs]
abi-util                2176   0  (autoclean) [abi-svr4 lcall7]
iptable_nat            17638   0  (autoclean) (unused)
ip_conntrack           19384   3  (autoclean) [ipt_conntrack ipt_iplimit
iptable_nat]
iptable_mangle          2200   0  (autoclean) (unused)
iptable_filter          1708   1  (autoclean)
ip_tables              11808  10  [ipt_REJECT ipt_conntrack ipt_limit
ipt_iplimit ipt_TARPIT iptable_nat iptable_mangle iptable_filter]
ide-cd                 32252   0  (autoclean)
isa-pnp                32520   0  (unused)
ipv6                  179508  -1  (autoclean)
st                     30740   0  (autoclean) (unused)
sr_mod                 13624   0  (autoclean) (unused)
cdrom                  30496   0  (autoclean) [ide-cd sr_mod]
sg                     29276   0  (autoclean)
mousedev                4536   0  (unused)
joydev                  5984   0  (unused)
evdev                   4352   0  (unused)
input                   3488   0  [mousedev joydev evdev]
usb-ohci               22056   0  (unused)
usbcore                66508   1  [usb-ohci]
raw1394                16756   0  (unused)
ieee1394               38064   0  [raw1394]
bcm5700                82948   1 
e100                   56328   1 
perle-serial           43144   1 
lvm-mod                70500   0  (autoclean)
quota_v2                7408   0 
reiserfs              227988   4 
aacraid                27748   8 

  Am I missing any module?

  I'm using iptables v1.3.1 on a SuSe.

  Regards,

- Ruben



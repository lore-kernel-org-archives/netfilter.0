From: "Daniel Wittenberg" <daniel-wittenberg@starken.com>
Subject: Re: state table not working
Date: Fri, 18 Jun 2004 15:16:31 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087589791.40d34d9f4907f@securemail.starken.com>
References: <Pine.LNX.4.33.0406182201160.25898-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0406182201160.25898-100000@blackhole.kfki.hu>
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

tcpdump I won't be able to get until it fails again, but it's 
2.4.22-1.2188.nptl (did it with kernel-2.4.22-1.2174.nptl too).

The full ruleset is almost 200 lines, and will take awhile for me to sanitize
it, but will work on it (not a static script, dynamically generated).
 
# lsmod
Module                  Size  Used by    Not tainted
iptable_filter          2444   1  (autoclean)
ipt_state               1080   8
ipt_REJECT              4248   2
ipt_REDIRECT            1400   0  (unused)
ipt_MASQUERADE          2200   2
ipt_mark                 984   0  (unused)
ipt_LOG                 4248  62
ipt_limit               1560  28
ip_nat_ftp              3728   0  (unused)
iptable_nat            21848   2  [ipt_REDIRECT ipt_MASQUERADE ip_nat_ftp]
ip_tables              15136  11  [iptable_filter ipt_state ipt_REJECT
ipt_REDIRECT ipt_MASQUERADE ipt_mark ipt_LOG ipt_limit iptable_nat]
ip_conntrack_ftp        4944   1
ip_conntrack           28552   3  [ipt_state ipt_REDIRECT ipt_MASQUERADE
ip_nat_ftp iptable_nat ip_conntrack_ftp]
natsemi                19232   3
keybdev                 2656   0  (unused)
mousedev                5268   0  (unused)
hid                    23908   0  (unused)
input                   5888   0  [keybdev mousedev hid]
usb-uhci               26124   0  (unused)
usbcore                78752   1  [hid usb-uhci]
ext3                   71620   2
jbd                    51276   2  [ext3]



Quoting Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>:

> 
> Please post your exact kernel version number, loaded in kernel modules,
> your complete ruleset *and* a real tcpdump output.
> 
> Server SYN/ACK response does not reach the client: that's all one can say.
> 
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>           H-1525 Budapest 114, POB. 49, Hungary
> 
> 


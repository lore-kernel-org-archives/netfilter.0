From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: string is not working, any help?
Date: Wed, 11 Jun 2003 10:35:00 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6E2F@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Esteban <eribicic@sinectis.com>, netfilter@lists.netfilter.org
Cc: winfield@freegates.be

Incorrect syntax


-m string --string "search for this"

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698
=20

-----Original Message-----
From: Esteban [mailto:eribicic@sinectis.com]
Sent: Wednesday, June 11, 2003 9:59 AM
To: netfilter@lists.netfilter.org
Cc: winfield@freegates.be
Subject: string is not working, any help?


root@dejawu:/lib/modules/2.4.20/kernel/net/ipv4/netfilter# lsmod=20
Module                  Size  Used by    Tainted: P =20
ipt_unclean             6712   0  (unused)
ipt_string              1688   0  (unused)
iptable_nat            18872   0  (autoclean) (unused)
ip_conntrack           24224   1  (autoclean) [iptable_nat]
ip_tables              12952   5  [ipt_unclean ipt_string iptable_nat]
i810_audio             20680   0=20
ac97_codec              9992   0  [i810_audio]
8139too                16424   1=20
mii                     2272   0  [8139too]
root@dejawu:/lib/modules/2.4.20/kernel/net/ipv4/netfilter#=20
root@dejawu:/lib/modules/2.4.20/kernel/net/ipv4/netfilter#=20
root@dejawu:/lib/modules/2.4.20/kernel/net/ipv4/netfilter# cd=20
root@dejawu:~#=20
root@dejawu:~#=20
root@dejawu:~# iptables -t mangle -A PREROUTING -p tcp -m --string
"pepee" -j DROP
iptables v1.2.7a: Couldn't load match
`--string':/lib/iptables/libipt_--string.so: cannot open shared object
file: No such file or directory

Try `iptables -h' or 'iptables --help' for more information.

why is not working --string match??
im using pom version patch-o-matic-20030107 under 2.4.20 kernel.








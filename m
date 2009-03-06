From: "Andrew O. Zhukov" <andre@telegroup.com.ua>
Subject: conntrack modules in fedora
Date: Fri, 06 Mar 2009 16:27:37 +0200
Message-ID: <49B132D9.3090303@telegroup.com.ua>
References: <49B122A0.7080905@telegroup.com.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49B122A0.7080905@telegroup.com.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

=EBernel 2.6.25.14-69.fc8
iptables-1.4.1.1-1.fc8.x86_64.rpm

Is it somehow possible to switch off conntrack modules in this=20
configuration.

conntrack_ftp =C1nd conntrack_sip possible exclude by rmod, modprobe -r
lsmod don't show it. In iptables.config IPTABLES_MODULES=3D""
Multiple reload iptables and linux itself. No result.

In any case I can access outside passive ftp and
I see corrected SIP packets on the outside registar.

Any ideas?


--=20
Andrew O. Zhukov
Telegroup Ukraine

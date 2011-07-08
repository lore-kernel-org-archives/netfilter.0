From: "Christian S. Perone" <christian.perone@gmail.com>
Subject: Protocol wrong type for socket
Date: Fri, 8 Jul 2011 15:11:35 -0300
Message-ID: <CAMxMOAtKyKPBk=5Z9kQSpMWw9cwwdCHbSnRSWB5V21eNHF4RAw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=J2NcX66HC4xQ/vcI7NgD3u6Ni/LIfqH2fOzLSzoR5UM=;
        b=DZnhQDJphyMy1OXG/4RRkIR4UScqvBfl8FAd5SACTijCeK1afvPtDNKGsAdCO4gClD
         TQsTTcobqTfSIRLeq45qy8sfx1HMZxd9Ai6Y32a5jOKTa4gF1AsGdwYBaRfu52gJpiXk
         ZtxO+GN3IBNk5km4me5n1n3pY5tlbXlZXCRYw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm try to run:
ip6tables -t mangle -A PREROUTING -i eth1 -p icmpv6 --icmpv6-type
router-advertisement -j TEE --gateway ff02::1 --oif eth0

But ip6tables shows the error:
ip6tables: Protocol wrong type for socket.

Does anyone knows what could be the problem ? I'm using ip6tables
1.4.10 (powerpc), this is the strace:

open("/etc/protocols", O_RDONLY)        = 3
ioctl(3, TCGETS or TCGETS, 0x7fab19a8)  = -1 ENOTTY (Inappropriate
ioctl for device)
read(3, "# /etc/protocols:\n# : protocols,"..., 4096) = 1535
read(3, "", 4096)                       = 0
close(3)                                = 0
socket(PF_INET6, SOCK_RAW, IPPROTO_RAW) = 3
getsockopt(3, SOL_IPV6, 64,
"mangle\0|\177\253\33\0000\0\21\4\0\0\0\0\0\0\0\0\0\0\0"..., [84]) = 0
getsockopt(3, SOL_IPV6, 65, "mangle\0008    IPv6-ICMP       # IC"...,
[1312]) = 0
setsockopt(3, SOL_IPV6, 64,
"mangle\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 1648) =
-1 EPROTOTYPE (Protocol wrong type for socket)
close(3)                                = 0
write(2, "ip6tables: ", 11ip6tables: )             = 11
write(2, "Protocol wrong type for socket", 30Protocol wrong type for
socket) = 30
write(2, ".\n", 2.
)                      = 2
exit(1)                                 = ?

Thank you !
--
"Forgive, O Lord, my little jokes on Thee, and I'll forgive Thy great
big joke on me."
http://pyevolve.sourceforge.net/wordpress/

From: "John Paul" <john@pinoylinux.sytes.net>
Subject: SO HOW! iptables: invalid argument
Date: Sat, 25 Oct 2003 21:40:28 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01e801c39afd$8da3c6f0$63000a0a@pooh>
References: <7C9884991ADAE0479C14F10C858BCDF52E375B@alderaan.smgtec.com><6.0.0.22.0.20031021210350.01b66818@pop3.uol.com.br><009501c39837$e1883850$2800a8c0@karu><20031022215549.4b028338.arnt@c2i.net> <20031023134537.21954912.arnt@c2i.net>
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

Hello Folks,

Just want to find the real answer with this. sorry but ans to google is not
clear for me. I did upgrade my iptables to iptables-1.2.9rc1.tar. steps
done;

--> installed new iptables source (iptables-1.2.9rc1.tar)
        - make KERNEL_DIR=/usr/local/linux
        - make install KERNEL_DIR=/usr/local/linux

--> applied POM (patch-o-matic-20030912.tar) to my latest kernel
(linux-2.4.22.tar)

--> recompile the kernel
        - make dep; make clean; make bzImage; make modules; make
modules_install
        - all went fine

--> reboot the machine

all went fine but when NAT/MASQUERADE is used, i got this "iptables: invalid
argument"

anything i missed?

Thanks.
-JP



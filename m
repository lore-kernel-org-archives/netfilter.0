From: =?UTF-8?B?U2FtdWVsIETDrWF6IEdhcmPDrWE=?= <samueldg@arcoscom.com>
Subject: Re: missing  ip_set_ipporthash.h
Date: Thu, 09 Feb 2006 18:50:28 +0100
Message-ID: <43EB80E4.1090400@arcoscom.com>
References: <D2EA20593E6AAD4DA6D07DE0EC12D161013331@ebs-2200.ebasedsecurity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <D2EA20593E6AAD4DA6D07DE0EC12D161013331@ebs-2200.ebasedsecurity.com>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Thomas Raef <traef06@ebasedsecurity.com>
Cc: netfilter@lists.netfilter.org

I compile fine with 2.6.x (from 2.6.12 to 2.6.15.3 tested).

In README says that you need to apply "set" patch from patch-o-matic.

I always make kernel, and iptables with "all" patches without problems.

Create a link called linux into /usr/src to your kernel sources root (for 
example "ln -s /usr/src/linux-2.6.15.3 /usr/src/linux)

The same with iptables ("ln -s /usr/src/iptables-1.3.5 /usr/src/iptables").

Put your pom-ng directory where you want, cd into your pom-ng directory and do 
"./runme set"

Compile and install your kernel.

Disable your iptables boot scripts before reboot ("chkconfig --level 2345 
iptables off" under Fedora).

Reboot with your new kernel.

Goto your iptables sources directory, make and make install. Remember to 
uninstall your previous iptables package before install the new iptables or 
rename old binaries/libs/libs directories.

The next is go into your ipset-2.2.8 directory and "make clean && make && make 
install"

That's all (as I remember).

Good luck.

Thomas Raef wrote:
> I'm trying to compile ipset-2.2.8 on my Debian Sarge 2.6.15 system I
> keep getting:
> 
> linux/netfilter_ipv4/ip_set_ipporthash.h no such file or directory
> 
> When I do:
> 
> Find / -name ip_set_ipporthash.h
> 
> It finds nothing.
> 
> Please help
> 
> Thank you in advance.
> 
> 
> Thomas J. Raef
> e-Based Security, Inc.
> www.ebasedsecurity.com
> "You're either hardened, or you're hacked!"
> 
> 
> 

-- 
    Samuel Díaz García
     Director Gerente
ArcosCom Wireless, S.L.L.

CIF: B11828068
c/ Romero Gago, 19
Arcos de la Frontera
11630 - Cadiz

http://www.arcoscom.com

mailto:samueldg@arcoscom.com
msn: samueldg@arcoscom.com

Móvil: 651 93 72 48
Tlfn.: 956 70 13 15
Fax:   956 70 34 83


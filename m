From: "nino scuparacci" <roccox@mail.com>
Subject: NAT H323 for netmeeting
Date: Thu, 26 Sep 2002 01:59:43 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020926065943.18658.qmail@mail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hello, 
I've built a firewall/router for a company with a debian3 - iptables. 
My company have a LAN(192.168.1.0/24) which accross my debian to visit internet. Some computers of this LAN need to be called by netmmeeting. 
I've read than I had to patch my kernel 2.4.18 with patch-o-matic and to update iptables 1.2.6 to 1.2.7. 

So I patched my kernel. I ve added the H323 module and compile it : make dep; make clean; make bzImage; make modules; make modules_install. 
I reboot with this new kernel. I try to install the new iptable-1.2.7 but always the same error : 

Extensions found: IPv4:CONNMARK IPv4:IPV4OPTSSTRIP IPv4:NETMAP IPv4:ROUTE IPv4:connmark IPv4:ipv4options IPv4:mport IPv4:nth IPv4:pool IPv4:POOL IPv4:psd IPv4:quota IPv4:random IPv4:realm IPv4:recent IPv4:string IPv4:time IPv6:REJECT IPv6:ah IPv6:esp IPv6:frag IPv6:ipv6header IPv6:hbh IPv6:dst IPv6:rt 
cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/ -DIPTABLES_VERSION=\"1.2.7a\" -fPIC -o extensions/libipt_conntrack_sh.o -c extensions/libipt_conntrack.c 
***[extensions/libipt_conntrack_sh.o] error 1 
-------------------------------------
????????????????? 
Can u help me?
-- 
__________________________________________________________
Sign-up for your own FREE Personalized E-mail at Mail.com
http://www.mail.com/?sr=signup



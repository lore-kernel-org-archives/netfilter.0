From: Hampus Soderstrom <hampus.soderstrom@aptilo.com>
Subject: PPTP, newnat and masquerading not working
Date: Fri, 28 Feb 2003 17:17:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E5F8B8D.50705@aptilo.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I want to use PPTP behind a masquerading router but I have problems 
getting it to work.

This is how I install masquerading PPTP:

1. I upack a vanilla kernel-2.4.20
2. I patch with newnat
(http://roeder.goe.net/~koepi/newnat/helpers-2.4.20.patch.gz)
3. I do a make menuconfig and add PPTP and GRE Proto support
4. I install iptables v1.2.7a
5. I do the rest of the kernel building (make dep && make modules && 
make modules_install && make bzImage).
6. I fix my lilo and reboot with the new kernel.
7. I add masquerading with iptables:
iptables -I POSTROUTING -t nat --jump MASQUERADE
8. I add portforwarding (/proc/sys/net/ipv4/ip_forward)
9. I modprobe ip_nat_pptp and verify that ip_nat_pptp and 
ip_nat_proto_gre is loaded with lsmod.


Now I have a setup that looks like this:

PPTP Client1 ===> Masquerading Router ===> PoPToP Server
PPTP Client2 ===>

8. I start upp pptp in a win2k machine (Client1) I get:
error: 619 The specified port is not connected and error 651.

I have verified that masquerading works for http and that pptp works if 
I bypass the Masquerading router.

What have I overlooked in getting it to work?


/Hampus




From: Peter Schobel <pschobel@porchlight.ca>
Subject: Re: Problems with Transparent Proxy using IPTables, Squid and 2.6 kernel
Date: Thu, 8 Jan 2004 15:05:23 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FE0E2967-4215-11D8-AFEE-000393677A36@porchlight.ca>
References: <200401081851.59512.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0 (Apple Message framework v553)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200401081851.59512.Antony@Soft-Solutions.co.uk>
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


ok, I downloaded the source ball for iptables 1.2.9, and compiled using

make KERNEL_DIR=/usr/src/linux-2.6.0-1.107

i got an error from config.h telling me to use the glibc version so i 
symlinked /usr/src/linux-2.6.0-1.107 to /usr/include/linux/config.h

then i compiled successfully and installed using

make install KERNEL_DIR=/usr/src/linux-2.6.0-1.107

without incident

i checked the timestamp on the iptables binary to make sure that it had 
been overwritten

I rmmod'd all the iptables modules and then reloaded my iptables rule

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT 
--to-port 3128

lsmod gives me

Module                  Size  Used by
ipt_REDIRECT            2048  1
iptable_nat            20140  2 ipt_REDIRECT
ip_tables              15104  2 ipt_REDIRECT,iptable_nat
ip_conntrack           28464  2 ipt_REDIRECT,iptable_nat

iptables -t nat -L gives me

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
REDIRECT   tcp  --  anywhere             anywhere            tcp 
dpt:http redir ports 3128

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

testing it reveals that it is still not working - did i do anything 
wrong in the above steps? what further steps would you recommend to 
troubleshoot this problem?

Peter Schobel
~



From: "Allan Dover" <bigaldover@hotmail.com>
Subject: RH 8.0 iptables nf-bridge  help please
Date: Wed, 09 Apr 2003 15:51:54 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F83sNfTjD4EXKduNqBQ000229cd@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello Everyone,

I have searched through the archives and havent found an answer to my
problem, o here it is.
I am running RH 8.0 Kernel 2.4.19-8.5.27
Used Netfilter patch bridge-nf-0.0.7-against-2.4.19.diff
IPTABLES v1.2.6a
followed the instructions line for line in Firewalling for free.
Enabled 802.1b bridging and Netfilter options as well as IPTABLES firewall 
in the kernel config.

The Bridge works great packets go throught it no problem.
eth0 0.0.0.0 promisc
eth1 0.0.0.0 promisc
bridge 127.0.0.1 promisc up

I am running Snort 2 and I see the traffice going from host to internet and 
Vice versa.

I have copied the IPTABLES Script from Firewalling for Free and added a few 
extra lines to suit my DNS Servers and different Web Servers.

IPTables doesnt seem to be doing anything I can scan using NMAP from my HOME 
PC. Iptables is Loaded at boot, and when i type iptable -L i see all my 
rules and chains, just as they appear in the docs.

Anyone have any ideas How I can get the IPTables portion to stop hackers 
from snooping around my network, I have also created rules that should stop 
the Slammer virus from getting in and messing up any servers that users may 
have forgotten to patch.

Any help on this is appreciated.

Thanx,
Allan
bigaldover@hotmail.com


_________________________________________________________________
Protect your PC - get McAfee.com VirusScan Online  
http://clinic.mcafee.com/clinic/ibuy/campaign.asp?cid=3963



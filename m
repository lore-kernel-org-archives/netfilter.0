From: richard hauswald <staenker@rhcs.de>
Subject: Re: Adding variables to iptables file
Date: Tue, 08 Mar 2005 13:09:45 +0100
Message-ID: <422D9609.9020601@rhcs.de>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAQrQTl2OGOEWpZSe7NzzKncKAAAAQAAAAc3JzitFkUE6dTyLL0qVAQQEAAAAA@bigpond.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAQrQTl2OGOEWpZSe7NzzKncKAAAAQAAAAc3JzitFkUE6dTyLL0qVAQQEAAAAA@bigpond.net.au>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: netfilter@lists.netfilter.org

Hello,

i do not know what a syntax the iptables restore programm uses. But i 
know that you should write a shell script containing your iptables 
system calls.
Ok, a verry short example:

(I use this script for disabling my firewall and enabling routing and Nat.)
---------------------------------------------------------------------
#! /bin/bash

ext_int="ppp0"

iptables -F
iptables -t nat -F
iptables -t mangle -F
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

iptables -t nat -A POSTROUTING -o $ext_int -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward
---------------------------------------------------------------------

After you started this script, you can do an iptables-save and the you 
are able to restore your rules.
But i would prefer starting this script instead of using iptables-save 
and iptables-restore.

If you have a dial in account with dynamic ipadresses an a huge 
firewallscript i would prefer the use of 3 files:
static.var
dynamic.var
rc.firewall

static.var contains static definitions of your network, for example your 
internal ip adsress, internal interfacename, .....
dynamic.var contains dynamicly changing informations like external ip, 
dns servers, external interfacename, ...
rc.firewall contains the following 2 lines:
. /path/to/file/static.var
. /path/to/file/dynamic.var

and your firewall rules.
if you want i can provide an example how to get the dynamic information.

regards
richard hauswald


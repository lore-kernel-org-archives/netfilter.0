From: Walther@gehag-dsk.de
Subject: FreeS/WAN + static NAT + 2 machines
Date: Mon, 23 Sep 2002 11:33:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF4CF55ADA.1F646FD5-ONC1256C3D.003385BB-C1256C3D.003482E1@GEHAG-DSK.DE>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hi folks,

i have the following problem:

my setup is this one:

<LAN>---<firewall>---<freeswan gateway>---<firewall with static 
nat>--<cisco(only routing)>---<internet>

i want to nat incoming connections for the freeswan gateway. but up to now 
i wasn't able to do this. i tried the following:


<--snip-->

iptables -t nat -A POSTROUTING -o $EXT -s <internal_ip_for_freeswan> -j 
SNAT --to <external_ip_for_freeswan>
iptables -t nat -A PREROUTING -i $EXT -d <external_ip_for_freeswan> -j 
DNAT --to <internal_ip_for_freeswan>
iptables -A FORWARD -p 50 -d <internal_ip_for_freeswan> -j ACCEPT
iptables -A FORWARD -p 51 -d <internal_ip_for_freeswan> -j ACCEPT
iptables -A FORWARD -p udp --dport 500 -d <internal_ip_for_freeswan> -j 
ACCEPT

<--snip-->

but this won't work for me. maybe somebody of you can help me with fixing 
this issue.

THX

Best Regards,
MfG.

Stefan Walther
stefan_walther@gehag-dsk.de
dienst.: +4930/89786448
Funk: +49172/3943961
http://www.gehag-dsk.de

-------------------------------------------------------------- 
Linux/UNIX is like an Indian Tipi:
No Windows, no Gates and Apache inside.

Outgoing Mail is certified mistake-free. 
Examined by DOGMATIC infallibility system. 
Version 6.04


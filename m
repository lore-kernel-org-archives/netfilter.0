From: Johnoel Ancheta <johnoel@hawaii.edu>
Subject: RE: PPTP server behind firewall
Date: Tue, 24 Jun 2003 13:15:20 -1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <23b26c23ece5.23ece523b26c@hawaii.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-language: en
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

> Have you used the pptp connection tracking modules? are they loaded?

> > compiled the kernel with GRE and PPTP support 
    built in no modules.

i building a floppy router.  it works except for the vpn
support.  i've had this working before using Brian Kuschak
pptp kernel patches a long time ago.  since then i lost my notes.

what are some minumum rules that would completely open up the firewall
and forward port 1723 and ip 47 to the internal private vpn server?

i am going to try

iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD MASQ

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 1723 -j DNAT
--to-destination 192.168.0.200:1723
iptables -t nat -A PREROUTING -i eth0 -p 47 -j DNAT --to-destination
192.168.0.200

any advice would be appreciated,
johnoel@hawaii.edu



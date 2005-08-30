From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Allowing access only some sites - onely some mac address
Date: Mon, 29 Aug 2005 21:27:51 -0500
Message-ID: <4313C427.2020605@riverviewtech.net>
References: <006801c5acd1$b2ce1600$0301010a@pivt>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <006801c5acd1$b2ce1600$0301010a@pivt>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Sebasti=E3o Ant=F4nio Campos (GWA) wrote:
> I have a list of the mac address 00:0c:6E:11:E8:B0, 00:D8:02:D8:C8:DF,
> 00:E7:05:C9:07:EA............ and and I'd like that only these mac addr=
ess
> could access only the following IP: 200.221.2.128, 200.221.2.129,
> 200.221.2.130, 200.221.2.131, 200.205.144.75, 200.205.144.76. But the o=
ther
> mac address could access everything.

I would be tempted to do something like the following:

# Create a new chain to put the allowed sites in for filtered MACs.
iptables -t filter -N MACFilteredSites

# Watch for a specific MAC address and jump to said chain on matches.
iptables -t filter -A FORWARD -i ${LAN} -o ${INet} -m mac --mac-source 00=
:0c:6E:11:E8:B0 -j MACFilterdSites
iptables -t filter -A FORWARD -i ${LAN} -o ${INet} -m mac --mac-source 00=
:D8:02:D8:C8:DF -j MACFilterdSites
iptables -t filter -A FORWARD -i ${LAN} -o ${INet} -m mac --mac-source 00=
:E7:05:C9:07:EA -j MACFilterdSites

# Only allow the filtered MACs to go to these sites (IP addresses).
# Note:  We do not need to test for -i and -o interfaces b/c we tested fo=
r this before we got to this chain.
iptables -t filter -A MACFilteredSites -d 200.221.2.128 -j RETURN
iptables -t filter -A MACFilteredSites -d 200.221.2.129 -j RETURN
iptables -t filter -A MACFilteredSites -d 200.221.2.130 -j RETURN
iptables -t filter -A MACFilteredSites -d 200.221.2.131 -j RETURN
iptables -t filter -A MACFilteredSites -d 200.205.144.75 -j RETURN
iptables -t filter -A MACFilteredSites -d 200.205.144.76 -j RETURN
iptables -t filter -A MACFilteredSites -j LOG
iptables -t filter -A MACFilteredSites -j DROP



Grant. . . .


From: Rowan Reid <rreid@studio3arc.com>
Subject: Getting Netfilter to play nice.
Date: Mon, 24 Mar 2003 10:50:21 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000201c2f236$391b9560$1001a8c0@s3ac>
References: <3E7F2C5B.9040601@giganet.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <3E7F2C5B.9040601@giganet.cz>
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




I'm setting up a freeswan vpn, or well trying. One important step is to
get freeswan to play nice.

Here are the free swan req.
<SNIPPET>
IKE uses the UDP protocol and port 500. 
Unless you are using only (less secure, not recommended) manual keying,
you need IKE to negotiate connection parameters, acceptable algorithms,
key sizes and key setup. IKE handles everything required to set up,
rekey, repair or tear down IPsec connections. 
ESP is protocol number 50 
This is required for encrypted connections. 
AH is protocol number 51 
This can be used where only authentication, not encryption, is required.

</SNIpPET>
It also mentions not masquarading packates destined to the vpn network.
My rulesets that apply arre posted below

<snippet>
# VPN - Enable the following lines to allow incomming VPN connections
#
echo -e "      - Allowing EXTERNAL access for VPN traffic"
$IPTABLES -A INPUT -i $EXTIF -m state --state NEW,ESTABLISHED,RELATED -p
udp -s $INGLEWOOD -d $EXTIP --dport 500 -j ACCEPT
$IPTABLES -A INPUT -i $EXTIF -m state --state NEW,ESTABLISHED,RELATED -p
esp -s $INGLEWOOD -d $EXTIP -j ACCEPT
$IPTABLES -A INPUT -i $EXTIF -m state --state NEW,ESTABLISHED,RELATED -p
ah -s $INGLEWOOD -d $EXTIP -j ACCEPT

echo "     - FWD: Allow all connections OUT and only existing/related
IN"
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state
NEW,ESTABLISHED,RELATED -s $INGLEWOOD -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT

$IPTABLES -t nat -A POSTROUTING -o $EXTIF ! -d 10.0.0.0/24 -j SNAT --to
$EXTIP
</snippet>

Where 10.0.0.0 is the net of the private address of the other end of the
vpn.
Have I covered all my bases ?




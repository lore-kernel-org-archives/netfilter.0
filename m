From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: How to block sending mail from local network.
Date: Sat, 7 Feb 2004 21:17:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040207201732.93A41382@sterenborg.info>
References: <4024C335.7080705@ergolight-sw.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4024C335.7080705@ergolight-sw.com>
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

> I want to block smtp operations from the local network so the 
> viruses/worms will be blocked.
> 
> I tried a command:
> $IPTABLES -A OUTPUT -p TCP -i $LAN_IFACE -s $LAN_IP_RANGE 
> --dport smtp 
> -j DROP
> but it did nothing.

No, the INPUT and OUTPUT chains are for filtering the local machine : de
firewall itself.
If you want to block clients, you should use the FORWARD chain.

You could use a rule like this one :
$IPTABLES -A FORWARD -i $LAN_IFACE -s $LAN_IP_RANGE -p tcp --dport 25 -j
DROP
or
$IPTABLES -A FORWARD -i $LAN_IFACE -s $LAN_IP_RANGE -p tcp --dport 25 -j
REJECT --reject-with tcp-reset

I suppose you're running your own mailserver ? Otherwise none of your
clients are able to send email.


Gr,
Rob



From: Eric Marchionni <mailing-lists@gmx.ch>
Subject: ICQ file transfer => sending!
Date: Sat, 30 Aug 2003 14:02:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F509259.3060902@gmx.ch>
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

hi

thx to the following lines i'm anle to receive files with icq
(i had to tell my icq-client the incomming ports):

# portforwarding ICQ Filetransfer
iptables -A FORWARD -i $WAN_IFACE -p tcp --dport 2010:2030 \
-j ACCEPT
iptables -t nat -A PREROUTING -i $WAN_IFACE -p tcp \
--dport 5010:5030 -j DNAT --to-destination $ICQ_CLIENT

but unfortunately i'm still not able to send files, though
i have rules like:
iptables -A FORWARD -i $LAN_IFACE -o $WAN_IFACE -j ACCEPT
iptables -t nat -A POSTROUTING -o $WAN_IFACE -j MASQUERADE

anybody got an idea?
-eric



From: "Steffen Bisgaard" <sbisgaard@xtrasource.com>
Subject: SMTP
Date: Tue, 21 Jan 2003 16:24:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NEBBICCJKLGJHMMNBPIKGEIJEDAA.sbisgaard@xtrasource.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hallo all,

Can anybody tell me why the following doesn't allow me to send and receive
email?

# POP server (110)
# ----------------
iptables -A INPUT -i $EXTERNAL_INTERFACE -p tcp \
--source-port $UNPRIVPORTS \
-d $IPADDR --destination-port 110 -j ACCEPT
iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp ! --syn \
-s $IPADDR --source-port 110 \
--destination-port $UNPRIVPORTS -j ACCEPT
# POP client (110)
# ----------------
iptables -A INPUT -i $EXTERNAL_INTERFACE -p tcp ! --syn \
--source-port 110 \
-d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT
iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp \
-s $IPADDR --source-port $UNPRIVPORTS \
--destination-port 110 -j ACCEPT


# ------------------------------------------------------------------
# SMTP server (25)
# ----------------
iptables -A INPUT -i $EXTERNAL_INTERFACE -p tcp \
--source-port $UNPRIVPORTS \
-d $IPADDR --destination-port 25 -j ACCEPT
iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp ! --syn \
-s $IPADDR --source-port 25 \
--destination-port $UNPRIVPORTS -j ACCEPT
#
#
#
# ------------------------------------------------------------------
# SMTP client (25)
# ----------------
iptables -A INPUT -i $EXTERNAL_INTERFACE -p tcp ! --syn \
--source-port 25 \
-d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT
iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp \
-s $IPADDR --source-port $UNPRIVPORTS \
--destination-port 25 -j ACCEPT



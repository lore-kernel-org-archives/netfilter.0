From: "Kancha ." <kancha2np@yahoo.com>
Subject: iptables smtp
Date: Thu, 24 Oct 2002 23:20:47 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021025062047.69633.qmail@web14906.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Below is my iptables rules:

# create allowed chain
/sbin/iptables -N allowed
/sbin/iptables -A allowed -p TCP --syn -j ACCEPT
/sbin/iptables -A allowed -p TCP -m state --state
ESTABLISHED, RELATED -j ACCEPT


/sbin/iptables -A FORWARD -p tcp -i $EXT_IF -o $DMZ_IF
-d $MAILSERVER --dport 25 -j allowed

/sbin/iptables -A FORWARD -p tcp -o $EXT_IF -i $DMZ_IF
-s $MAILSERVER --dport 25 -j allowed


$DMZ_IF and $EXT_IF are interfaces connected DMZ and
External network respectively. An SMTP connection can
be established from external network to dmz, but the
same cannot be done from DMZ to external network.
What's wrong with my script ?? Isnt' the last iptables
rule suppose to allow smtp connection from dmz to
external network ??

kancha.

__________________________________________________
Do you Yahoo!?
Y! Web Hosting - Let the expert host your web site
http://webhosting.yahoo.com/


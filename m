From: Subba Rao <subba9@cablespeed.com>
Subject: Logging
Date: Tue, 14 Jan 2003 13:23:10 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030114182310.GA23089@cablespeed.com>
Reply-To: Subba Rao <subba9@cablespeed.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: Netfilter/Iptables Users <netfilter@lists.netfilter.org>

Hi

I have the following rules to allow traffic on SMTP port.

--------------------
iptables -A INPUT -i $EXTERNAL_IF -p tcp --destination-port 25 -j LOG \
                --log-level 4 --log-prefix "Incoming Mail Traffic "
iptables -A INPUT -i $EXTERNAL_IF -p tcp --destination-port 25 -j ACCEPT
--------------------

The default policy is on the INPUT chain is to drop the packets.  How do I capture
what is being dropped?

My goal is to log the inbound traffic and my syslog has the following
configuration:

--------------------
*.=info;*.=notice;mail.none                     /usr/adm/messages
*.=alert                                        /usr/adm/messages
*.=crit                                         /usr/adm/debug
mail.*                                          /var/log/mail-log
kern.*                                          /var/log/messages
user.*                                          /var/log/messages
syslog.*                                        /var/log/messages
auth.*                                          /var/log/messages
authpriv.*                                      /var/log/messages
--------------------

Is this configuration sufficient to capture the inbound connections?

-- 

Subba Rao
subba9@cablespeed.com


From: Real Cucumber <monkcucumber@yahoo.com>
Subject: Fwd: Re: Help with ICMP Ruls
Date: Thu, 15 Jul 2004 12:55:26 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040715195526.1368.qmail@web40709.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="0-1198197969-1089921326=:391"
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

--0-1198197969-1089921326=:391
Content-Type: text/plain; charset=us-ascii
Content-Id: 
Content-Disposition: inline

I do have a state rule already for allowing any
established,related connections.

So should I add another one such as:

iptables -A FORWARD -p icmp -m state --state RELATED
-j ACCEPT

The current ruleset is attached (I've only excluded
the variables and logging sections of it).



		
__________________________________
Do you Yahoo!?
Yahoo! Mail - 50x more storage than other providers!
http://promotions.yahoo.com/new_mail
--0-1198197969-1089921326=:391
Content-Type: message/rfc822
Content-Transfer-Encoding: 8bit

X-Apparently-To: monkcucumber@yahoo.com via 66.218.78.159; Thu, 15 Jul 2004 12:35:35 -0700
X-Originating-IP: [62.128.28.23]
Return-Path: <netfilter-admin@lists.netfilter.org>
Received: from 62.128.28.23  (EHLO lakshmi.netfilter.org) (62.128.28.23)
  by mta128.mail.re2.yahoo.com with SMTP; Thu, 15 Jul 2004 12:35:34 -0700
Received: from vishnu.netfilter.org ([213.95.27.115])
	by lakshmi.netfilter.org with esmtp (Exim 4.22 #1 (Debian))
	id 1BlC0W-0003G6-Tx; Thu, 15 Jul 2004 21:35:04 +0200
Received: from smtp.open.source.it ([213.218.253.29] helo=Jasper.Rockstone.co.uk)
	by vishnu.netfilter.org with esmtp (Exim 4.22 #1 (Debian))
	id 1BlByk-0003u8-Kz
	for <netfilter@lists.netfilter.org>; Thu, 15 Jul 2004 21:33:14 +0200
Received: from advent ([192.168.42.100])
	by Jasper.Rockstone.co.uk (8.11.4/8.11.4) with ESMTP id i6FJX2s19707
	for <netfilter@lists.netfilter.org>; Thu, 15 Jul 2004 20:33:02 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Antony Stone <Antony@Soft-Solutions.co.uk>
Reply-To: netfilter@lists.netfilter.org
To: netfilter@lists.netfilter.org
Subject: Re: Help with ICMP Ruls
X-Mailer: KMail [version 1.4]
References: <20040715192110.11412.qmail@web40702.mail.yahoo.com>
In-Reply-To: <20040715192110.11412.qmail@web40702.mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Networker-Information: Contact MailScanner@Rockstone.co.uk for further information
X-Networker-Viruscheck: Clean
X-Networker-SpamCheck: not spam, SpamAssassin (score=-2.5, required 5,
	EMAIL_ATTRIBUTION=-0.50, IN_REP_TO=-0.50, QUOTED_EMAIL_TEXT=-0.48,
	REFERENCES=-0.50, REPLY_WITH_QUOTES=-0.50)
X-Spam-Score: -7.2 (-------)
Sender: netfilter-admin@lists.netfilter.org
Errors-To: netfilter-admin@lists.netfilter.org
X-BeenThere: netfilter@lists.netfilter.org
X-Mailman-Version: 2.0.11
Precedence: bulk
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: General discussion and user questions <netfilter.lists.netfilter.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Date: Thu, 15 Jul 2004 20:32:54 +0100
Content-Length: 712

On Thursday 15 July 2004 8:21 pm, Real Cucumber wrote:

> > I would allow the firewall to send ICMP messages through its OUTPUT chain,
> > and if it can generate any connections from itself, then you should allow
> > them in through the INPUT chain as well, however you say you do not allow
> > outgoing connections (not even DNS??), so this may not be needed.
>
> The fedora box doesn't do dns or anything. It's sole purpose is a packet
> forwarding router that doesnt' allow any input or output, just forwards.
>
> That is why I'm not sure if I need ICMP supported on it or not, and not sure
> where do add the ICMP support (input, output, forward).

I would allow the machine to forward ICMP messages which are RELATED to the 
existing SSH sessions, so that means the rule should go in the FORWARD chain.

If you want more specific advice, please post the current ruleset.

Regards,

Antony.

-- 
In Heaven, the police are British, the chefs are Italian, the beer is Belgian, 
the mechanics are German, the lovers are French, the entertainment is 
American, and everything is organised by the Swiss.

In Hell, the police are German, the chefs are British, the beer is American, 
the mechanics are French, the lovers are Swiss, the entertainment is Belgian, 
and everything is organised by the Italians.

                                                     Please reply to the list;
                                                           please don't CC me.



--0-1198197969-1089921326=:391
Content-Type: text/plain; name="firewall.sh"
Content-Description: firewall.sh
Content-Disposition: inline; filename="firewall.sh"


# This will set all default policies to DROP
iptables -P FORWARD DROP
iptables -P INPUT DROP
iptables -P OUTPUT DROP

# Enable Loopback Interface
iptables -A INPUT -i $LOOPBACK_INTERFACE -j ACCEPT
iptables -A OUTPUT -o $LOOPBACK_INTERFACE -j ACCEPT

# Protect against Source-Address Spoofing (Ingress/Egress)
iptables -A FORWARD -i $WAN_INTERFACE -s $WAN_ADDRESSES -j DROP
iptables -A FORWARD -i $WAN_INTERFACE -s $LAN_ADDRESSES -j DROP
iptables -A FORWARD -o $WAN_INTERFACE -s $WAN_ADDRESSES -j DROP

# Allow previously initiated and accepted connections
# to bypass firewall tests (state matching)
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# Remove INVALID state packets to stablize state connections
iptables -A INPUT -m state --state INVALID -j DROP
iptables -A OUTPUT -m state --state INVALID -j DROP
iptables -A FORWARD -m state --state INVALID -j DROP

# This will allow SSH in/out from TIC ADMIN IP to LAN interface
iptables -A INPUT -p tcp --dport $WAN_SSH_PORT -i $LAN_INTERFACE -j ACCEPT
iptables -A OUTPUT -p tcp --sport $WAN_SSH_PORT -o $LAN_INTERFACE -j ACCEPT


# This will allow SSH forwarding from/to INT_SERVER Server
iptables -A FORWARD -s $INT_SERVER_IP -j ACCEPT
iptables -A FORWARD -d $INT_SERVER_IP -j ACCEPT


# This will forward inbound WAN SSH to LAN INT_SERVER with port remapping
iptables -t nat -A PREROUTING -p tcp --dport $WAN_SSH_PORT -i $WAN_INTERFACE -j DNAT --to $INT_SERVER_IP:$INT_SERVER_SSH_PORT

--0-1198197969-1089921326=:391--


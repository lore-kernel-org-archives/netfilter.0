From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: DNS and iptables : is this rule bad ??
Date: Fri, 28 May 2004 21:41:49 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405290441.i4T4fqou002420@server5.bandwidthco.com>
References: <BAY16-F99Flatq6TnSL0003998f@hotmail.com>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY16-F99Flatq6TnSL0003998f@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: 'Mark Alzino' <tirixil@hotmail.com>, netfilter@lists.netfilter.org

=20

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Mark Alzino
Sent: Friday, May 28, 2004 8:27 AM
To: netfilter@lists.netfilter.org
Subject: DNS and iptables : is this rule bad ??

Hello,

Here is my problem more simply explained ...

An user (IP address : 10.0.0.1) has a DNS server IP address specified in his
configuration (we don't know the address, and maybe this address is invalid
so we want to change it with a iptables rules).

His gateway is 10.0.0.254. The gateway has another interface at
192.168.100.254 where a DNS server is launch (by named).
At the gateway, a iptables rule send all his DNS packets at the DNS server
(192.168.100.254)
The rule is :
iptables -A PREROUTING -t nat -s 10.0.0.1 -p UDP --dport 53 -j DNAT
--to-destination 192.168.100.254

** BUT ** this rule is not effective immediately, and take fews minutes
before to be active !!!
Same thing if you flush the nat table (iptables -F PREROUTING -t nat ) : the
last DNS is active during some minutes (sometimes immediately but not
systematically)...

To easely see that : just put an invalid DNS server in the configuration of
the client, and a real one at the gateway (192.168.100.254). You will see
that rules are not immediately active !!!

Is someone know why ???

Thanks.
-- Mark

_________________________________________________________________
Bloquez les fen=EAtres pop-up, c'est gratuit ! http://toolbar.msn.fr


This doesn't appear to be a problem with netfilter/iptables, but rather, I
would guess, DNS. The rule will "take effect" immediately once it is loaded,
and trigger upon match. I would venture to say you may have some
interference from an entry in the /etc/hosts file or cached DNS entries. I
would try flushing the DNS cache instead of the NAT table.



########################################################
This message has been scanned for viruses and dangerous=20
content by MailScanner, and is believed to be clean.

postmaster@bandwidthco.com
MailScanner at bandwidthco.com is for your absolute protection.
########################################################



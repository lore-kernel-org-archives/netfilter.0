From: "Kellogg, Chris" <Chris.Kellogg@dyncorp.com>
Subject: DNAT on the OUTPUT chain.
Date: Fri, 7 Jun 2002 17:37:39 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <BC6421B0F2CC4C43897842092E0E00A94C149B@TX1EX1NT.dyncorp.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

Hey, everyone.

I've written the following iptables command:

iptables -A OUTPUT -s 192.168.0.0/24 -p tcp --dport 80 -t nat -j DNAT
--to-destination 192.168.4.4:80

iptables returns: "iptables: Invalid argument"

If I write the same command using '-A PREROUTING', the command is accepted.
However, the application I am using this for does not allow for this command
to be used in the PREROUTING chain.  The manpage does not indicate any
difference between placing the DNAT target on the PREROUTING chain versus
the PREROUTING chain as far as I've seen - I've been known to be blind in
the past however. :)

Anyone have any ideas?  Perhaps another method to do what I'm attempting to
do: I would like all traffic that has not matched previous rules associated
with port 80 to have their destination host changed to a single webserver to
display a warning message.  I have a series of previous rules that ACCEPT
port 80 traffic from specific hosts and/or to specific hosts, so this rule
is a catch-all.

Cheers,

Chris.


From: "Ing. Christian Ogris" <ogris@mazda.at>
Subject: Flag SYN not necessarily state NEW?
Date: Wed, 08 May 2002 08:45:47 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <3CD8C99B.E81155B5@mazda.at>
References: <20020507115906.8B112471A@lists.samba.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.samba.org

Good morning,

just wondering if the behavior i discovered yesterday on our iptables-
firewall is "ok":

I connect from Box A via SSH to Box B, where the firewall runs, and i
get the state "NEW" on the first packet.
Then - the first connection is still established - i connect AGAIN from
Box A to Box B and do NOT get the state "NEW" anymore. (So obviously
it's already accepted by the ESTABLISHED,RELATED -j ACCEPT rule).
Is this behavior correct?

Meaning that a (second, third, ...) connection to the firewall will 
never get the state "NEW" for the first packet when there IS already
a connection to the same port, from the same host?

	
		regards, Chris



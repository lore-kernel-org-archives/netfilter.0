From: "Daniel Khan" <dk@webcluster.at>
Subject: DNAT in OUTPUT chain
Date: Thu, 27 Jun 2002 22:28:49 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <FIEPIOLBGHKEOJANBEKMKELHCCAA.dk@webcluster.at>
Reply-To: <dk@webcluster.at>
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

Hello List,

I have a Problem with NAT on RedHat 7.3/iptables v1.2.5.

I have 2 Hosts. I want to redirect every connection to Port 3306 on Host1 to
Port 3306 on Host2.
That is no problem as long I make an external connection (Prerouting).

I also need to redirect connections to localhost:3306.
According to the Howto's I need to set this in the OUTPUT chain.
So I use exactly the syntax from the HOWTO's:

iptables -A OUTPUT -t nat -p tcp --dport 3306 -j DNAT --to 10.1.0.212:3306

iptables reports:
"Invalid Argument"

I've allready played arround using -i lo, etc. The same errors.
It simply seems as if DNAT on OUTPUT isn't possible, but the HOWTO's say it
is.

I also read, that OUTPUT DNAT was a Problem in 2001, but that's long ago I
think.

Please help!

Thanks in advance

Daniel Khan



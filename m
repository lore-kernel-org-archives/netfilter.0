From: "Jamie Harris" <jamie@jharris.homeip.net>
Subject: Packet mangling latency
Date: Wed, 1 Oct 2003 22:06:13 +0100 (BST)
Sender: lartc-admin@mailman.ds9a.nl
Message-ID: <33751.192.168.1.2.1065042373.squirrel@rincewind.jharris.homeip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <lartc-admin@mailman.ds9a.nl>
Errors-To: lartc-admin@mailman.ds9a.nl
List-Help: <mailto:lartc-request@mailman.ds9a.nl?subject=help>
List-Post: <mailto:lartc@mailman.ds9a.nl>
List-Subscribe: <http://mailman.ds9a.nl/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://mailman.ds9a.nl/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=unsubscribe>
List-Archive: <http://mailman.ds9a.nl/pipermail/lartc/>
Content-Type: text/plain; charset="us-ascii"
To: lartc@mailman.ds9a.nl, netfilter@lists.netfilter.org

Firstly... sorry to those of you on both the netfilter and lartc list
who'll end up with this message twice...

I am trying to find out what kind of latency I can expect when dNAT'ing
UDP packets on (probably) a mid-range P3 server, 32-bit 33MHz PCI bus with
Intel EEPro NICs.  It'll most likely be running whatever the latest 2.4
kernel will be at the time, unless there are significant boosts in packet
mangling performace in 2.6.

Sorry that this is such vague set of specs, but this is just a vague idea
at the moment.  Any suggestions for hardware that would be particuarly
suited to shifting packets with the lowest possibly latency would be much
appreciated.

cheers.

Jamie...

PS Thanks to the Netfilter team for producing such a cracking frame work,
thanks to the LARTC guys for making me feel like a newbie again :)

-- 
**  This message was transmitted on 100% recycled electrons **

_______________________________________________
LARTC mailing list / LARTC@mailman.ds9a.nl
http://mailman.ds9a.nl/mailman/listinfo/lartc HOWTO: http://lartc.org/

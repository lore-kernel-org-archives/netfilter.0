From: "Knight, Steve" <Steve.Knight@bskyb.com>
Subject: quick questions ---
Date: Thu, 27 Nov 2003 13:02:06 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDB52A0429DFD31196FB0008C7D972D50EA57B26@OST_EXCH_USR5>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi chaps

Had a bit of a google, and of course consulted Ziegler, but I'm still not
100% on either of these, so ---

1) can iptables use eth0:0 as a valid interface distinct from eth0 ?  So I
can use eth0 as LAN internal i/f and eth0:0 as DMZ internal i/f.

and ...

2) Back when I did my checkpoint certs we covered "static NAT" - simple
one-to-one address translation, rather than "hide NAT" - aka iptables SNAT /
MASQUERADE....

...the question I have is - 

is the example given in Ziegler starting on p280 and table 7.1 "Host
Forwarding to Servers in a Privately Addressed DMZ" an example of "static
NAT"?

Thanks for any pointers

Steve



-----------------------------------------------------------------------
Information in this email may be privileged, confidential and is 
intended exclusively for the addressee.  The views expressed may
not be official policy, but the personal views of the originator.
If you have received it in error, please notify the sender by return
e-mail and delete it from your system.  You should not reproduce, 
distribute, store, retransmit, use or disclose its contents to anyone.
 
Please note we reserve the right to monitor all e-mail
communication through our internal and external networks.
-----------------------------------------------------------------------



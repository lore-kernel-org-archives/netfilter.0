From: David Cary Hart <dch@TQMcube.com>
Subject: Samba "Leak"
Date: Wed, 07 Jul 2004 15:23:05 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1089228185.30076.14.camel@localhost>
Reply-To: netfilter <netfilter@lists.netfilter.org>
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
To: netfilter <netfilter@lists.netfilter.org>

I cannot figure this out. Our server - running IPTables - has very few
ports open to input and the default is Drop. While a substantial number
of 139 and 445 packets show up in the log as rejected, I am seeing a few
attempts to connect to Samba in the log. These are identified by WAN IPs
so they are not spoofing localhost or a LAN IP.

I also have INVALID and fragmented packets rejected so that path is
closed.

So far, nobody has actually gained access, yet it is disconcerting. Any
ideas how these are getting past the firewall?

-- 
                            David Cary Hart
Hart's PGP key: http://pgp.mit.edu:11371/pks/lookup?op=get&search=0x58A60BB1



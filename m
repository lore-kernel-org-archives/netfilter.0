From: Khanh Tran <khanh@slc.edu>
Subject: RE: DNAT probs
Date: Mon, 10 Feb 2003 08:47:41 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01CEA3A5B8B2D511890F0002A5870AEC5FB598@EXCHANGE>
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
To: Roy Sigurd Karlsbakk <roy@karlsbakk.net>, netfilter@lists.netfilter.org

The short answer is that you should be running a "DMZ" or internal DNS for
those 192.168.0.0 computers.  This way, it also takes an unnecessary load
off that firewall.  I'm no netfilter programmer, but it just has problems
exiting and entering the same interface.  It has to do with the way the
packets are marked during the masquerade process (I'm assuming you have MASQ
enabled on your public interface).  Anyway, I've found a not-so-elegant
solution, which again isn't recommended, but necessary for one of my setups:

Configure a second official IP (alias) on the interface going out to your
router.

Second, change either the DNS entry for all your DMZ computers to this new
official IP or your default route (plus your POSTROUTING and SNAT for
MASQuerading) to this new official IP.

Now, you should basically have your DMZ computers exiting/NAT as one of the
official IPs, and trying to enter back on the second of the official IPs.
Hopefully that will help, but I'd really suggest the internal DNS addition
to your network...

Khanh Tran
Network Operations
Sarah Lawrence College


-----Original Message-----
From: Roy Sigurd Karlsbakk [mailto:roy@karlsbakk.net]
Sent: Monday, February 10, 2003 8:12 AM
To: netfilter@lists.netfilter.org
Subject: DNAT probs


hi all

I've got this network as sketched below...

                  internal net
                      |
                      |
                +-----+----+
+--------+      |          |
| router +------+ Firewall |------ dmz
+--------+      |          |
                +----------+


The computers on the dmz and the internal net have all unofficial addresses 
with DNATing into the DMZ for those that should be available from the 
outside.

The problem occurs when a computer on the dmz (192.168.x.y) tries to address

another computer there by its official address (resolved from DNS). The 
firewall (netfilter/iptables) doesn't seem to be able to do the dmz -> 
netfilter -> dmz NATing.

Any ideas?

roy

-- 
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.





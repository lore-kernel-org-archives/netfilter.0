From: Trevor Cordes <netfilter@tecnopolis.ca>
Subject: success story using native 2.6 ipsec with NAT/MASQ
Date: Tue, 21 Dec 2004 20:50:14 -0600 (CST)
Message-ID: <200412220250.iBM2oEXv002652@pog.tecnopolis.ca>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I just wanted to drop a line to this list after having much trouble with
the new 2.6 native ipsec (ie: setkey-based).  (NONE OF THIS APPLIES TO
free/openSWAN setups!)  I finally have it working! Here's some tips for
others:

1. SNAT/MASQUERADE targets don't work as expected with stock FC3 (as of
   the time of this writing: 2.6.9-1.681) kernels without some kernel
   patches. The guys on the netfilter-devel list have the patches and
   there's some good discussions of the issue from Jan 2004 archives.
   Without MASQ, it's tough to do privatesubnet->gw->gw traffic.

2. What happens in the unpatched kernel is ipsec will gobble the packet
   packet before it hits POSTROUTING where MASQing gets done.  The
   result is no MASQing and weird packets coming in at the other side of
   the ipsec tunnel.

3. The patches (not yet in the netfilter PoM for the latest 2.6.9
   kernels?) work perfectly if applied to the stock FC3 kernel srcrpm by
   inserting them into the SPEC file and running rpmbuild.  I was scared
   of this part, but it was actually really easy!

4. Make sure you setup a transport ipsec for your gw->gw (including
   MASQ'd) traffic.  ipsec tunnel mode isn't the correct thing here(?).

5. The ipsec worked at first but then I noticed large packets were being
   eaten and I was showing ICMP 3 CODE 4 packets on the sending side.
   Turns out MTU size and fragmentation were important here.  If your
   app connects at first then goes dead or haywire, you probably have
   this problem.

   Putting the following rule in fixed the problem:

   # must force a lower mtu for packets to be ipsec'd
   # 1492-36-40=1416
   # (36=apparent ipsec overhead based on empirical tests) (40=mtu to
   # mss conversion) (1492=mtu for pppoe)
   iptables -A fsec -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --set-mss \
	1416

   Where fsec is a chain that gets executed for all FORWARD traffic out
   the ispec VPN (based on destination IP).

   I'm really not sure if this is a "bug" or just a fact of life.  It
   kind of makes sense, but seems a little unruly that one must manually
   make a rule for it.

6. QoS (using HTB et al.) (see lartc) work great and easy over native
   ipsec.  Big contrast to the hellish QoS over freeS/WAN over PPPoE
   which never worked and frequently kernel panic'd (with HTB on
   ipsec0).

7. I've opened a RH bugzilla bug with regards to the ipsec/nat patch
   issue:
   https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=143374

   I hope to see the patches in a future FC update soon!

Thanks to all the guys who helped, esp the guys on netfilter-devel!



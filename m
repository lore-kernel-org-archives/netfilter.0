From: "Andrew Smith" <nfml@k1k2.com>
Subject: Un-MASQ'd Packets
Date: Fri, 25 Oct 2002 18:53:38 +1000 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <36337.192.168.7.14.1035536018.squirrel@iw.k1k2.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,
this is probably something very simple and it must be very commonly
done and is documented somewhere obvious - but I can't seem to work
out how to identify the packets coming back matching outgoing
MASQUERADE packets:

iptables -t nat -A POSTROUTING -o $inetif -s 192.168.a.b -j MASQUERADE

this of course MASQUERADE's 192.168.a.b to my outgoing DHCP IP address
on the device $inetif (yes it works fine :-)


How do I identify reply packets coming in that come to 192.168.a.b?

I'd like to be able to count incoming packets/bytes to 192.168.a.b
that are of course just replies back to 192.168.a.b since nothing
will actually be able to connect to 192.168.a.b (I have no DNAT/SNAT
rules to these machines) so I want something like:

iptables -A FORWARD -i $inetif -d 192.168.a.b -j ACCEPT

but of course this isn't correct - is it somehow identified coming in
the FORWARD table? Or some other way? (some other standard module needs
to be loaded? - hopefully not a p-o-m) I'm running RH7.3 at the moment
and it has RedHat iptables-1.2.5-3 (there appear to have been no updates
for iptables on RH 7.3)

When I count the packets/bytes going out from 192.168.a.b I do that in
the FORWARD table (well actually a table I create that comes from the
FORWARD table)
so it could be just the following for simplification:
iptables -A FORWARD -o $inetif -s 192.168.a.b -j ACCEPT
(but mine is more complex - but essentially the same)

but I really have no idea how to identify the return packets after
they have been de-MASQUERADEd (of course they will have the DCHP
address in the FORWARD table - but I have more than 1 machine being
MASQUERADE'd and also of course the DHCP address is not constant)

any help greatly appreciated

-- 
-Cheers
-Andrew

MS ... if only he hadn't been hang gliding!



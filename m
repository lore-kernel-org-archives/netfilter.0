From: erich@uruk.org
Subject: Only MASQ/NAT, no FORWARDing?
Date: Wed, 22 Jan 2003 11:35:58 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E18bQfG-0007hN-00@trillium-hollow.org>
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
To: netfilter@lists.samba.org


Please respond to my email address "erich@uruk.org", as I'm not on
the email list...

Sorry if this is a FAQ, but I couldn't figure this out from the HOWTO,
FAQs I could find, nor from the experimentation I've done so far (though
it arguably hasn't been exhaustive).

My question is:  On a Redhat 8.0 machine (most recent patch kernel,
based on 2.4.18) with 2 ethernet cards "eth0" and "eth1", I want to
Masquerade/NAT connections originating from the eth1 side going out
the eth0 side ONLY.

I figured out how to keep masquerading only going one direction, but
what I can't figure out is how to disable all normal packet forwarding
other than the masqueraded connections with iptables.  I.e. someone
on the other side who knows my internal IP addressing can still send
crafted packets through my firewall.

Telling the "FORWARD" rule to drop all packets blocks the masq/NAT
connections.  The same thing happens if I only tell it to drop packets
that come from eth0 and go out eth1.

So, I'm not quite sure how to do this...  can someone help here?

Thanks...

--
    Erich Stefan Boleyn     <erich@uruk.org>     http://www.uruk.org/
"Reality is truly stranger than fiction; Probably why fiction is so popular"


From: "Jan" <Oblivion@tiscali.be>
Subject: Netfilter and multiple internet connections
Date: Tue, 15 Oct 2002 13:55:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00d701c27441$c9578e90$0100a8c0@obsidian>
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
To: netfilter@lists.netfilter.org

Hello,

I have a kernel 2.4.19 machine running netfilter (1.2.7a) and performing NAT
for my internal network.  The machine has two internet connections, one ADSL
and one via a cable provider.  I select the provider by changing the default
gateway at the netfilter machine.

The strange thing I noticed:  when I am using cable as the default gateway,
my firewall ruleset shows the multicast query the provider's router is
sending me on a regular base.  But when I change the default gateway to
direct all outgoing traffic via the ADSL link, there are no more log entries
showing the multicast query over the cable modem.

Although when I dump the packets on the cable interface, I do see the
Multicast queries.  The firewall ruleset stays the same.  I compared the
loaded version, only different in packet counters.

I suspect one of the kernel parameters (/proc/sys/net/...) influences this
behaviour.  But I don't know which one.
Or is this behaviour netfilter specific?
Do the packets which netfilter doesn't see get further into my machine?  Or
are they dropped by the kernel?

Thanks,
Jan




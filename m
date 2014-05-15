From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: randomly SNATed devices after reboot
Date: Thu, 15 May 2014 10:42:38 -0300
Message-ID: <20140515104238.26ce6626@pulsar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hi All

I have this setup in which there are lots of static IPs "SNATed" IP-Phones
behind a Linux machine. A very simply NAT machine. Just one SNAT rule for the
phones' network.

At every Linux machine reboot, some of those phones, randomly, simply does not
register at some outside-nat SIP server.

Investigating with tcpdump I can see, at the external interface, "not snated"
packets from those not registered phones. Packets from the other phones are
correctly "snatted".

Rebooting the Linux machine scatters this behavior among the phones: some are
randomly registered and some not. Rebooting the phone, and just the phone
itself, does not change anything.

Some background I think relevant:

	1) The Linux ip address is added (one interface, two IPs in two
	different nets) further during boot, at rc.local, immediately before
	the SNAT rule; No NAT rule was added up to this point.

	2) if I change the ip address, under the same netmask, of any
	non-registered phone, it registers immediately; But this does not assure
	it will register again after a new Linux reboot. In fact it may not
	register again after that. Already happened.

	3) All IP-Phones have "keep alive SIP connection" active.

I have a suspicious about what is going on: some race condition. 
But I'd like your thoughts.

Thanx in advance

Regards

Ethy

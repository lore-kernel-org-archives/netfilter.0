From: "Matthew Hellman" <mhellman@raccoon.com>
Subject: Re: iptables, stateful checking using tcp sequence numbers
Date: Thu, 13 Jun 2002 18:18:20 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <000c01c21330$9c3a4e60$020aa8c0@matttm9svd8lrh>
References: <67024BB66045D511A9380000F6B2EF85F20C1F@RBGMSG02>
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
To: "Williamson, Fionn" <FWilliamson@fnb.co.za>, netfilter@lists.samba.org

> "Although the TCP sequence numbers may get sent to the log file (if
> logging is turned on for a rule), if it not present in the "state table"
> (/proc/net/ip_conntrack), then it is not used to maintain state.
> However, I cannot verify that Firewall-1 does this as well (although any
> good firewall should), and tests conducted on older versions of
> Firewall-1 indicate that it did not used to use sequence numbers as part
> of state verification (and may still not use them). "

Can you explain how you're expecting sequence numbers to be used in the
state table specifically?
The Cisco Pix has the ability to "randomize" initial TCP sequence numbers on
behalf of clients, but where's the value in that unless you have clients
that do a poor job of it already?.




From: "Nathan Cassano" <nathan@cjhunter.com>
Subject: RE: Need to NAT incomming packets
Date: Thu, 13 Jun 2002 14:38:41 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <0bac01c21322$af6d58f0$2901a8c0@amos>
References: <011e01c21250$32829ee0$cd64a8c0@imagestream.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <011e01c21250$32829ee0$cd64a8c0@imagestream.com>
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
To: 'Eric Plikuhn' <ericgate@imagestream-is.com>, netfilter@lists.samba.org


Hi Eric,

> I was hoping have a SNAT rule for each incoming interface in the
prerouting
> chain on the Core router....  but you can't do SNAT in prerouting with
> iptables.

The problem lies in routing NAT'ed traffic back to it's respective
device. If the devices have the same IP address there cannot be an
intelligent routing decision made. Netfilter does not support forcing a
packet to be sent to a specific device. Packets must be routed to
devices based up routing decisions.


I would suggest setting up a router for each 10.0.0.0/8 network to
properly route traffic.



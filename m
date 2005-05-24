From: Visham Ramsurrun <vishamr2000@gmail.com>
Subject: Help needed with Connection tracking!!!
Date: Tue, 24 May 2005 20:27:42 +0400
Message-ID: <9927912d0505240927492673cb@mail.gmail.com>
References: <4293543d.58d9493d.63ba.000cSMTPIN_ADDED@mx.gmail.com>
Reply-To: Visham Ramsurrun <vishamr2000@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4293543d.58d9493d.63ba.000cSMTPIN_ADDED@mx.gmail.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi to all,

I badly need some help with this one..

I wanted to know what happens when a stateful firewall receives a SYN
packet from client A and the next packet received by the firewall is
not the SYN/ACK packet from server B but rather the first data packet
for the same connection from server B. Let's assume that the SYN/ACK,
the ACK and the first data request packet arrived  to their respective
destinations through some other route. Is the connection considered as
ESTABLISHED at that point on the firewall, which has seen traffic in
both directions?

If the answer to the above is no, would the connection be considered
as ESTABLISHED if the default behaviour of ip_conntrack was used?

Any input will be very much appreciated..

Warm regards,
Visham


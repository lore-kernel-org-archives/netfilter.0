From: "Richard Pickett" <Richard.Pickett@CSRTechnologies.com>
Subject: RE: DROP TCP output to HTTP attackers?
Date: Tue, 27 Dec 2005 10:42:25 -0600
Message-ID: <003701c60b04$86bdd3c0$1101a8c0@quebec>
References: <FAC4E024BF776842876169173CE2F01313B76B@mailbox.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <FAC4E024BF776842876169173CE2F01313B76B@mailbox.vikus.com>
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
To: 'netfilter' <netfilter@lists.netfilter.org>

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of
> Michael D. Berger
> Sent: Friday, December 23, 2005 3:50 PM
> To: netfilter
> Subject: DROP TCP output to HTTP attackers?
>
> Using -j QUEUE, I DROP http packets that I don't like, and I
> DROP all subsequent packets from the offending ipAddress.
> Using ethereal, I note that when I DROP, I send tcp FIN
> packets.  Therefore, I added -j QUEUE to the OUTPUT filter,
> and I block all OUTPUT to the offending ipAddress, including
> the tcp FIN packets, as confirmed with ethereal.  I just
> deployed this in the last 30 minutes.  My preliminary
> observation, thanks to an obliging attacker, is that I get
> less follow-up junk with the OUTPUT filter blocked, although
> there did appear to be a few anomalies, that I assume are to
> to timing issues.
>
> Any opinions on this procedure?

Hmmmm. I DROP everything that is suspicious and follow up with a block
on that IP afterward and have never noticed any packets going out with
the DROP.



From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: [LARTC] MSN keeps disconnecting with load balancing
Date: Sun, 13 Nov 2005 00:36:55 -0400
Message-ID: <65aa6af90511122036q5774b9ffx7b4c0c309ec8eed3@mail.gmail.com>
References: <4376BF51.7040300@phreaker.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4376BF51.7040300@phreaker.net>
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

We have exaclty the same problem in our load-balancing proxy.

Remember that if you are load-balancing, traffic eventually will come
out through another network interface,,, and hence, another source IP.

The problem must be that the MSN service gets "confused" when he sees
that the one session has changed source IPs... or maybe it's a IP
stack problem and not related to the MSN specifically. Anybody can
provide some more feedback on this? The IP session layer is supposed
to keep sessions across changing IPs?

Our "solution" was to tell the MSN clients to use a proxy server that
has a single internet connection (separete from our main proxy server,
which is the one loadbalancing).

On 11/13/05, ro0ot <ro0ot@phreaker.net> wrote:
> Hi,
>
> I have the my gateway with load balancing traffic going out over two
> providers.  Web browsing is fine...working great.
>
> But, my clients (office staff) complains that MSN keeps disconnecting
> (in 5 mins).  Why?
>
> Please help me...
>
> Regards,
> ro0ot
>
>
>
> _______________________________________________
> LARTC mailing list
> LARTC@mailman.ds9a.nl
> http://mailman.ds9a.nl/cgi-bin/mailman/listinfo/lartc
>


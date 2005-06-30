From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: REDIRECT changes DST address of the packet
Date: Thu, 30 Jun 2005 03:46:19 -0400
Message-ID: <3063e505063000462dea1c7d@mail.gmail.com>
References: <20050630072934.80040.qmail@web60815.mail.yahoo.com>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050630072934.80040.qmail@web60815.mail.yahoo.com>
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
To: Venkata Narayana <mesg2nari@yahoo.com>
Cc: netfilter@lists.netfilter.org

Yes, it is changed to a local address i think (or loopback one). The
original address is restored after routing by NAT system to packets
which comes back (as source address).


>  If I lose original DST address, how can I persist
>  that
>  value in that packet.

Well, i didn't quite get this last worry of you.


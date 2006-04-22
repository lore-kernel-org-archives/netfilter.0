From: "Toby DiPasquale" <codeslinger@gmail.com>
Subject: Re: one rule to create per IP connlimits?
Date: Sat, 22 Apr 2006 09:15:01 -0400
Message-ID: <876ef97a0604220615g530bd141uffe611fec9759a8e@mail.gmail.com>
References: <5cc9c8f90604211201keda9583yf0026180cbfe9a75@mail.gmail.com>
	<006201c665f5$00205670$0e01050a@CyberAdmin>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <006201c665f5$00205670$0e01050a@CyberAdmin>
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
To: robee <mlody@elpec.com>
Cc: netfilter@lists.netfilter.org

On 4/22/06, robee <mlody@elpec.com> wrote:
> maybe this way:
>
> iptables -I FORWARD -p tcp --syn -s 10.10.2.96/27 -m
> connlimit --connlimit-above 20 -j REJECT
>
> or
>
> iptables -I FORWARD -p tcp --syn -m iprange --src-range
> 10.10.2.96-10.10.2.127 -m connlimit --connlimit-above 20 -j REJECT

Those both still allow one IP to use up all the connections, leaving
none for the others.

To do this, the connlimit module would have to keep track of
individual conntracks, not just aggregate numbers. It doesn't right
now, but it could be made to do so.

--
Toby DiPasquale
0x636f6465736c696e67657240676d61696c2e636f6d


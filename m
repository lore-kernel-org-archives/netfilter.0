From: "Toby DiPasquale" <codeslinger@gmail.com>
Subject: Re: one rule to create per IP connlimits?
Date: Fri, 21 Apr 2006 18:44:25 -0400
Message-ID: <876ef97a0604211544m5d0731f2o1b9607c975e669ed@mail.gmail.com>
References: <5cc9c8f90604211201keda9583yf0026180cbfe9a75@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5cc9c8f90604211201keda9583yf0026180cbfe9a75@mail.gmail.com>
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
To: rabbtux rabbtux <rabbtux@gmail.com>
Cc: netfilter@lists.netfilter.org

On 4/21/06, rabbtux rabbtux <rabbtux@gmail.com> wrote:
> All,
>
> Is there anyway I could create a rule that would create a tcp
> connection limit (say 20) for traffic from say 10.10.2.96/27 that
> would apply to each of the 32 IPs.  That is each address,
> 10.10.2.96-127 would be limited to 20 connections??  Or do I need to
> make up one iptables rule per address?

One rule per address.

> It sure would be nice if I could do this with one rule per address
> block, as I have several hundred addresses to limit!

Sure would.

--
Toby DiPasquale
0x636f6465736c696e67657240676d61696c2e636f6d


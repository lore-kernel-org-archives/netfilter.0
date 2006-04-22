From: "Toby DiPasquale" <codeslinger@gmail.com>
Subject: Re: one rule to create per IP connlimits?
Date: Sat, 22 Apr 2006 14:48:34 -0400
Message-ID: <876ef97a0604221148t6d68337ex3862a3a641d68674@mail.gmail.com>
References: <5cc9c8f90604211201keda9583yf0026180cbfe9a75@mail.gmail.com>
	<006201c665f5$00205670$0e01050a@CyberAdmin>
	<876ef97a0604220615g530bd141uffe611fec9759a8e@mail.gmail.com>
	<1145720124.2502.2.camel@robee.mars.cyberbajt.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1145720124.2502.2.camel@robee.mars.cyberbajt.pl>
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
To: mlody@elpec.com
Cc: netfilter@lists.netfilter.org

On 4/22/06, robee <mlody@elpec.com> wrote:
> do you mean it shoud be indyvidual rule for each IP separatelly?

Yes, that's right. So, instead of this:

iptables -A FORWARD -p tcp --syn -s 10.10.2.96/27 -m connlimit
--connlimit-above 20 -j REJECT

which will not do what you want, you'd instead use something this:

for i in `seq 97 126`; do
    iptables -A FORWARD \
        -p tcp --syn \
        -s 10.10.2.${i} \
        -m connlimit --connlimit-above 20 \
        -j REJECT
done

--
Toby DiPasquale
0x636f6465736c696e67657240676d61696c2e636f6d


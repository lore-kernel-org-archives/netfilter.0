From: Krzysztof Matusik <kyf@arterm.pl>
Subject: Re: I want to understand the concept
Date: Sun, 5 Feb 2006 16:04:56 +0100
Message-ID: <200602051604.57783.kyf@arterm.pl>
References: <001f01c62a35$c0c66aa0$0101000a@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001f01c62a35$c0c66aa0$0101000a@sterenborg.info>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Dnia niedziela, 5 lutego 2006 10:22, Rob Sterenborg napisa=B3:

> You SHOULD NOT FILTER in tables other than the filter table (the first
> rule).
>

> Using the mangle table you can alter packets in the FORWARD chain.
> In the filter table you cannot.
> In the mangle table you can filter packets, but you SHOUD NOT.

Why one SHOULD NOT filter in the mangle chain? Are there any philosophical=
=20
reasons? Is it a sin? Does it make kernel angry? :->
Performance?

> http://iptables-tutorial.frozentux.net/iptables-tutorial.html
>
> http://www.aptalaska.net/~jclive/IPTablesFlowChart.pdf
>
> http://ebtables.sourceforge.net/br_fw_ia/PacketFlow.png

Thx for links! Really great.

Krzysztof


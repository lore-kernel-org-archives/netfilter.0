From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Looking to exclude certain destinations from masquarade
Date: Fri, 22 Jun 2007 15:29:33 +0200
Message-ID: <467BCEBD.7030309@freemail.hu>
References: <467AEBD1.10009@baywinds.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <467AEBD1.10009@baywinds.org>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Bruce Ferrell <bferrell@baywinds.org>
Cc: netfilter@lists.netfilter.org

Bruce Ferrell =EDrta:
> I am trying to establish an ipsec tunnel from a system that is also a=20
> snat router.  so far I seem to be able to have my masquerade or my vpn =

> tunnel but not both.
>
> the basic rules I'm using are these:
>
> $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state=20
> ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
> $IPTABLES -A FORWARD -j LOG
> $IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
>
These are VERY BASIC rules...
>
> Any suggestions?
>
>
You can use the MARK/CONNMARK target ot mark the vpn/nat packets.
With that information you will be able to do the NATing or leting=20
through the vpn...

Swifty



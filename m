From: Ray Leach <spoons@rchq.co.za>
Subject: Re: Looking to exclude certain destinations from masquarade
Date: Sat, 23 Jun 2007 09:30:03 +0200
Message-ID: <467CCBFB.2080002@rchq.co.za>
References: <467AEBD1.10009@baywinds.org> <467BCEBD.7030309@freemail.hu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------030905010907010902080703"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <467BCEBD.7030309@freemail.hu>
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
To: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: Bruce Ferrell <bferrell@baywinds.org>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------030905010907010902080703
Content-Type: text/plain; charset="iso-8859-2"; format="flowed"
Content-Transfer-Encoding: quoted-printable



G=E1sp=E1r Lajos wrote:
> Bruce Ferrell =EDrta:
>> I am trying to establish an ipsec tunnel from a system that is also a=20
>> snat router.  so far I seem to be able to have my masquerade or my=20
>> vpn tunnel but not both.
>>
>> the basic rules I'm using are these:
>>
>> $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state=20
>> ESTABLISHED,RELATED -j ACCEPT
>> $IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
>> $IPTABLES -A FORWARD -j LOG
or you could use a rule like this:
$IPTABLES -t nat -A POSTROUTING -o $EXITIF -s $EXCLUDED_IP -j RETURN


>> $IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
>>
> These are VERY BASIC rules...
>>
>> Any suggestions?
>>
>>
> You can use the MARK/CONNMARK target ot mark the vpn/nat packets.
> With that information you will be able to do the NATing or leting=20
> through the vpn...
>
> Swifty
>
>
>
>
>

--=20
<img src=3D'http://www.danasoft.com/sig/spoonssig.jpg' />
--------------------------------------------------
RCHQ Hobbies cc
http://www.rchq.co.za and http://store.rchq.co.za
Fax: +27 86 652 2773       eMail: admin@rchq.co.za
P O Box 10376, Vorna Valley, Midrand, 1686
--------------------------------------------------


--------------030905010907010902080703--


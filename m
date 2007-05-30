From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Default deny rule
Date: Wed, 30 May 2007 12:25:07 +0200
Message-ID: <465D5103.3000507@freemail.hu>
References: <d2af4f000705092228x3746eb10u9b81264581a57e46@mail.gmail.com>	
	<464440C4.7000605@freemail.hu>	
	<d2af4f000705132302t3d8b2c8eo6158406d02af9f91@mail.gmail.com>	
	<4648570D.4040308@freemail.hu>	
	<d2af4f000705150134r4d5bbf84r96d0f91aae9a725d@mail.gmail.com>	
	<4651C2EE.2080803@freemail.hu>	
	<d2af4f000705280645j74a57571j65bb21ab0bfcee40@mail.gmail.com>	
	<465C24E0.8010001@freemail.hu>
	<d2af4f000705290744i4518ae7bu11b1fb7e2eb14a68@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------010801080306030404070502"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d2af4f000705290744i4518ae7bu11b1fb7e2eb14a68@mail.gmail.com>
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
To: Gopinath <gopinath.u@gmail.com>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------010801080306030404070502
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: quoted-printable

Gopinath =EDrta:
> Thank your very much Lajos !!!!!!!!!!!!!!!
>
> It is working fine now after adding the line "-m conntrack --ctstate
> DNAT" in the ACCEPT statement of the FORWARD chain as you've said in
> previous mail.
>
> Could you please explain how it works after adding the line "-m
> conntrack --ctstate DNAT" in the ACCEPT stmt of FORWARD chain ? I'm
> very eager to know this :-)
>
Okay... :D

I have attached an image that shows the route of the packet.

In the PREROUTING nat table the destination address gets DNATed IF the=20
client wants to talk to the EXTERNAL address.
But if the INTERNAL address is used at a new connection then this rule=20
does not get hit !!! (No DNAT!!!)

In the FORWARD filter table you were accepting EVERY connection that has =

an INTERNAL destination address.
If you use the conntrack module then ONLY the DNATed packets gets=20
accepted!!!

> Regards,
> Gopinath.U
>
>
> I have also upgraded my iptables to version 1.3.7
Good to hear... :D

Swifty

--------------010801080306030404070502--


From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: RE: Stateful packet inspection
Date: Fri, 4 Mar 2005 19:48:17 +0100
Message-ID: <48197.3847294741$1109962021@news.gmane.org>
References: <005401c520ea$4779ae00$b000a8c0@cybergeneration.com>
Reply-To: edvin.seferovic@kolp.at
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <005401c520ea$4779ae00$b000a8c0@cybergeneration.com>
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

Yes,=20

what you are actually looking for is a filter for applications that send
packets through your firewall =3D> so called LAYER 7 FILTER! Why layer 7 =
- see
OSI Layer model.

Regards,

Edvin Seferovic

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Maxime =
Ducharme
Sent: Freitag, 04. M=E4rz 2005 19:45
To: netfilter@lists.netfilter.org
Subject: Re: Stateful packet inspection


Yes I am not sure of the exact word for
"Layer 7 filter"

Someone can confirm this ?

TIA

Maxime Ducharme
Programmeur / Sp=E9cialiste en s=E9curit=E9 r=E9seau

----- Original Message -----=20
From: "Daniel Lopes" <lopsch@lopsch.com>
To: <netfilter@lists.netfilter.org>
Sent: Friday, March 04, 2005 11:03 AM
Subject: Re: Stateful packet inspection


> I thought SPI means inspecting packets for their state i.e. NEW or
> ESTABLISHED. What you mean is a Layer 7 filter, the link to it was
> posted above ;).
>





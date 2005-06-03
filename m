From: <Chandra.Vempali@infineon.com>
Subject: RE: Where to mark tc_index field in netfiler code
Date: Fri, 3 Jun 2005 18:11:53 +0530
Message-ID: <04EE7AD0450F7B498BA216312943A1A10276E680@blrse201.ap.infineon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: vinod_chandran@multitech.co.in
Cc: netfilter@lists.netfilter.org

Basically I want to mark tc_index in Netfilter based on protocol and=20
I want to use IP QOS based on the protocol.

If I mark tc_index in netfilter code based on protocol ( since netfilter
connection Tracker can
Identify the state of the packet and its protocol ), and then give QoS
according to protocol
in IP QOS code by looking at tc_index marked in netfilter code.

Pls let me know if where to mark tc_index in the Netfilter code ?

Shud it be done in Connection Tracker code ? Or in ip_nat_xxx.c code (
ex.  Ip_nat_tcp.c etc...)
?

Chandra


-----Original Message-----
From: Vinod Chandran [mailto:vinod_chandran@multitech.co.in]=20
Sent: Friday, June 03, 2005 5:46 PM
To: Vempali Chandra Sekhara Rao (IFIN CSW WL)
Subject: Re: Where to mark tc_index field in netfiler code


I dont think it is currently done in the netfilter code. May be u can do

it similar to how a packet mark value is set.
Tc_index field corresponds to the /skb->tc_index/ field located in the=20
packet /sk_buff  structure.
/This field is handled only in the QOS code.
If its possible to let it out, any specific reasons why it has to be=20
done in the netfilter code ?


Chandra.Vempali@infineon.com wrote:

>Hi Vinod,
>Again, the code under /net/sched is IP QoS code.
>And I want to use tc_index field which was already set in Netfiler code

>based on protocol. I don't want to set tc_index in IP QoS which I can=20
>do easily with tc tool
>
>Pls let me correct if I m wrong
>Regards,
>Chandra
>
>
>-----Original Message-----
>From: Vinod Chandran [mailto:vinod_chandran@multitech.co.in]
>Sent: Friday, June 03, 2005 5:25 PM
>To: Vempali Chandra Sekhara Rao (IFIN CSW WL)
>Subject: Re: Where to mark tc_index field in netfiler code
>
>
>Hi,
>
>You can find places where the index is set in the kernel code in one of
>the scheduler files(/net/sched directory).
>
>Regards,
>Vinod C
>
>Chandra.Vempali@infineon.com wrote:
>
> =20
>
>>Hi all,
>>
>>I would like to mark tc_index field of sk_buff with my own value based
>>on protocol type (tcp, udp, sip etc) and later I want to use it for=20
>>specifiying QoS for that packet/connection belonging to specific=20
>>protocol.
>>
>>I believe I can mark this field in Netfilter code in either Connection
>>tacker code or in protocol specific code,
>>
>>Can anybody shed some light on this ?
>>
>>Regards,
>>Chandra
>>
>>*Disclaimer*
>>"This e-mail and any attachments are confidential and may contain=20
>>trade
>>   =20
>>
>
> =20
>
>>secrets or privileged or undisclosed information. They may also be
>>subject to copyright protection. Please do not copy, distribute or=20
>>forward this email to anyone unless authorised. If you are not a named

>>addressee, you must not use, disclose, retain or reproduce all or any=20
>>part of the information contained in this e-mail or any attachments.
If
>>   =20
>>
>
> =20
>
>>you have received this email by mistake please notify the sender
>>immediately by return email and destroy/delete all copies of the=20
>>email."
>>
>>
>>
>>=20
>>
>>   =20
>>
>
> =20
>


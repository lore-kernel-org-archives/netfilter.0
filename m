From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: nat bypass
Date: Wed, 30 Jun 2010 14:54:32 +0530
Message-ID: <AANLkTilxqHHiDfzQbewBe8cnTtvdB9CCTPn9EVCcAf5Q@mail.gmail.com>
References: <AANLkTil_H1QeaCHQYhMjVRFiLwtqF9yLAJZ9BWecOIDW@mail.gmail.com>
	<20100630023718.GU2138@verge.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=u4nXm62VYHW6jyizcrfSf/zDAOXYCA9pmreTgmDAKoI=;
        b=KEQTCAsmSUjkPJe1Q/Gxb4nUYutMxydiFVcY5vNzi9Vk7Mh7vlwHrWTTJpL+9pjMQ/
         TjwHhHwchhGfE2otOD0IBLil031VRN2Gd2Z2JbK3Sc0o3dS3zYBw8AE9+gHie5EwIlwz
         aQFAC8+yn2/Z9Y20ElZX69H4Se7G26RysM9b4=
In-Reply-To: <20100630023718.GU2138@verge.net.au>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Simon Horman <horms@verge.net.au>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>, netdev@vger.kernel.org

> Let me try and understand this.
>
> R is routing between 192.168.1.0/24 and 10.232.18.0/24.
> As A is on the 192.168.1.0/24 side of R.
> But to give A an 10.232.18.0/24 address (dynamically)?
>
> Why?
>

=46or some clients , R should act as a mere bridge , Not a router .


On Wed, Jun 30, 2010 at 8:07 AM, Simon Horman <horms@verge.net.au> wrot=
e:
> On Mon, Jun 28, 2010 at 03:43:46PM +0530, ratheesh k wrote:
>> Hi,
>>
>> =A0 A -------> R ------->S
>>
>> I have a linux machine A is connected to Linux machine R . Machine R
>> is having two network interfaces and acting as a router .
>> It has a dhcp server running =A0. It will assign ip in 192.168.1.0/2=
4
>> subnet to all machine connected on lan side ( A is connected also in
>> lan side ) . Wan side of R is connected to HTTP server S . There is
>> also a DHCP server running on S to assign ip in 10.232.18.0/24 subne=
t
>> . =A0Is there any way , in which NAT should be bypassed to get ip fr=
om
>> DHCP server running =A0on S . My question is : How can A will get =A0=
an ip
>> from 10.232.18.0/24 pool ip .?
>> ebtables is an option ? How can we make it ?
>> Is there any other optimal way ?
>
> Let me try and understand this.
>
> R is routing between 192.168.1.0/24 and 10.232.18.0/24.
> As A is on the 192.168.1.0/24 side of R.
> But to give A an 10.232.18.0/24 address (dynamically)?
>
> Why?
>
>

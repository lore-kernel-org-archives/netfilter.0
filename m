From: Hannes Frederic Sowa <hannes@stressinduktion.org>
Subject: Re: Configure ICMP error source address
Date: Fri, 8 Jan 2016 17:11:43 +0100
Message-ID: <568FDFBF.3010300@stressinduktion.org>
References: <568F8207.9040305@heinlein-support.de>
 <20160108152448.5251154.50977.21786@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	stressinduktion.org; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=kV72cLztN6B4mxUJ
	JecAuwZinHk=; b=Ir5xZQ5iNAlRegjalDZWpieqieQGSpiF67Ohsv95ar7Qco3A
	iCtp/WjjtcVXM5LEN9FbyokH2g4tYR/YVnEKW4pONKSvcwBfZHpiDpJ9lJw/qgnx
	4KDRaZ7Ns+Ie4CkqCEqG10X9vQBQgMXoXUddECpISesiVhBob6a9/oBK6Mo=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=kV72cLztN6B4mxU
	JJecAuwZinHk=; b=o4Ad1RNMx21GPQgFjPrEC5qt/ISsqhBfSflxwouBJMjCtS9
	SrJYwCJAVNQZL5/dl1HfV0rjn26ypvsNBXOqGf+ZiFBXW1PzgH/ynSCfuIFpSGra
	iMviQdr61oqzsMboyoxqF1sqREC0JpF0x2bYQ5gWC/c90Gakh3VE9Rb0NXiA=
In-Reply-To: <20160108152448.5251154.50977.21786@gmail.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: prmarino1@gmail.com, Robert Sander <r.sander@heinlein-support.de>, netfilter@vger.kernel.org, netdev@vger.kernel.org

On 08.01.2016 16:24, prmarino1@gmail.com wrote:
> Don't put a public address on a lo device use a dummy eth interface i=
nstead=E2=80=8E. Any IP address and it's subnet assigned to a lo device=
 is  marked as a marcian address and the traffic is dropped if it tries=
 to leave the lo device.

O_o

> I know that there is som old documentation out there (for example qua=
gga's documentation) that says you can do it =E2=80=8Ebut it's been wro=
ng since the 2.4 version off the kernel.
> Linux treats the lo device differently that what routers call a loopb=
ack device. The dummy driver is the linux equivalent of what routers ca=
ll a loopback device.

What you write seems odd to me, we don't treat lo devices differently t=
o=20
dummy devices in respect if you bind a public ip address on it.

Bye,
Hannes




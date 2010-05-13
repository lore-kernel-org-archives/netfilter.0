From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: printk mac address --hangs
Date: Thu, 13 May 2010 22:54:41 +0530
Message-ID: <AANLkTin6o-SVB10bETHs40Pvb_Cv0HWyIVzh2FA7I2iK@mail.gmail.com>
References: <AANLkTinl1GZIOHaxfD7WgXPc2miKkRi3MDkkcaW4P6Zj@mail.gmail.com>
	 <alpine.LSU.2.01.1005131818450.9398@obet.zrqbmnf.qr>
	 <AANLkTinnqyBwCYQB1rLWI04VBr28DRludbfO9cFcTgAo@mail.gmail.com>
	 <alpine.LSU.2.01.1005131916081.9398@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=eXFFUctmZ+gcMDKDWP6HFBkCbKTF+uQqSUEC3GBj3w0=;
        b=Xv646AJ4CNLwNMowB3S4St+CfU/ITwSzqDfcGzgZVhNJNbgdECCz3+iwto16pp2sxU
         mAz7kRiA6UTXb/CR5cbfMazbBL+d+4AMfq05cj1+SFCVDRKo5E9tst9K1J0r036RRmKp
         NuJ5xCsPB2uJFYWCaqMCLcWR3vV5RGWyxupSg=
In-Reply-To: <alpine.LSU.2.01.1005131916081.9398@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>

On Thu, May 13, 2010 at 10:46 PM, Jan Engelhardt <jengelh@medozas.de> w=
rote:
> Your hook received packets from all interfaces, including lo and
> ethhdr-less tunnels.

Packets from lo will hit NF_IP_LOCAL_OUT hook  ?
Could you please  tell  example for ether less packet  ?

Thanks,
Ratheesh .



On Thu, May 13, 2010 at 10:46 PM, Jan Engelhardt <jengelh@medozas.de> w=
rote:
> On Thursday 2010-05-13 19:07, ratheesh k wrote:
>
>>On Thu, May 13, 2010 at 9:49 PM, an Engelhardt <jengelh@medozas.de> w=
rote:
>>> If you do not have an Ethernet packet, this is going to explode.
>>
>>I have only one =A0ethernet network interface (eth0 ) with 192.168.1.=
5 .
>>I could see in wireshark all =A0packets with ethernet mac addresses .
>>When i try to prink the mac address or copy , =A0it hangs ..
>
> Your hook received packets from all interfaces, including lo and
> ethhdr-less tunnels.
>

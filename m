From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: UDP MSS
Date: Tue, 14 Dec 2010 15:30:47 +0530
Message-ID: <AANLkTi=c1eBB669nmXiTGOOUzrDQWLc3mvw2qWuw8_Cv@mail.gmail.com>
References: <AANLkTi=qOQ0Rmyp78NEE9qSGOTFvgTDFSbDEDCtzoQ04@mail.gmail.com>
	<alpine.LNX.2.01.1012140500230.21495@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=/x5gtt5Oul8yNJ/W6tWT8OWTNawCNZy3LMNErhxMJKY=;
        b=FDPwLp0qxJw3SZPyPOJcQaDL5wuKxDTzJYVDGZRRX+2xbGAwPayCIFSvkaoqGvLtQr
         V+8Pgkv9BuoBKjmCQXo5W2B8o011CQ9cD4nkDm9goKfUTzdCPCfXJWl83pXlNavcIA+d
         TF8WBiIpncSRA0rpoxD/bHD16zbjWmzYEeXvU=
In-Reply-To: <alpine.LNX.2.01.1012140500230.21495@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>

How udp determines maximum sustainable  MSS ?

On Tue, Dec 14, 2010 at 9:30 AM, Jan Engelhardt <jengelh@medozas.de> wr=
ote:
> On Tuesday 2010-12-14 04:46, ratheesh k wrote:
>
>>In udp , there is no mss discovey.So , if we=A0 set DF bit in IP pack=
et =A0=A0 and
>>suppose an intermediate router does have disabled icmp-reply (thru ip=
tables
>>)=A0 and=A0 have less MTU than the sender.
>>
>>Then , router=A0 will drop the packet ,How client know to fragment th=
e=A0 udp
>>packet ?
>
> It won't, that's why ICMP should not be blocked.
>

From: Marco Coda <marco.coda7@gmail.com>
Subject: Re: [half_OT]Traffic shaping with tc and iptables
Date: Thu, 8 Sep 2011 12:54:47 +0200
Message-ID: <CAGRr-qm4gF8ZzvE9D5vXb-RLKXiELsj_P8KrOk9aOHTWRK01kQ@mail.gmail.com>
References: <CAGRr-qktvGncegdp+7X7Xb7Q9L0Q+FAn3+gPHGy+XJhDRtkQYg@mail.gmail.com>
	<4E688763.2060209@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=La1PdgFZ7sVB2Dvl88CevD2ByYzSH+aaVcBzSgNY9cc=;
        b=Rl7Lig5uJxVGk7YZnFxq15Cn9nB8CF+TkNPavGXulX5V9uPy9x2mhtlgkrE1aj2y8T
         N2bAkYtu/1nIF4T+zzXCWDxElOpQdtL1YXLL/C2hOBpF5olfOKnaYqLRMv8iCH/LVetv
         72P5wi1u1RosAB3esWZbgE4vgHMDBPTpFsGQ8=
In-Reply-To: <4E688763.2060209@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Ok, now i ran, as you adviced me:

2011/9/8 G=E1sp=E1r Lajos <swifty@freemail.hu>:

> IPTABLES=3D/sbin/iptables
> nic=3Deth0
> port=3D25
> upload=3D10kbit
> bandwith=3D2Mbit
>
> $IPTABLES -t mangle -A OUTPUT -p tcp -o $nic --sport $port -j MARK --=
set-mark 1
> tc qdisc add dev $nic root handle 1:0 cbq bandwidth $bandwidth avpkt =
1000 mpu 64
> tc class add dev $nic parent 1:0 classid 1:1 cbq rate $upload allot 1=
514 prio 1 avpkt 1000 bounded isolated
>tc filter add dev $nic parent 1:0 protocol ip handle fw flowid 1:1

But with this script I obtain the same result:
I tried to send a mail with an attachment of 3 MB. Between the "client
connection" and the "removed from queue", passed 1'12''
With tail /var/log/maillog | grep "size=3D" I saw that the real mail
size is 4317831B, so the real speed is  (4317831*8)[bits] / 72[s] =3D
479759, 468 Kbps, not 10 Kbps as I set..
I cannot understand the reason of this differences...

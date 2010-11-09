From: Angel Inkov <bl8cki@gmail.com>
Subject: Re: How to transfer a IP packet based on ebtables and iptables?
Date: Wed, 10 Nov 2010 00:30:30 +0200
Message-ID: <AANLkTinCVMXOeWft0qT17khOaPaa3Q06AUSCXzKnO2T6@mail.gmail.com>
References: <B6443739-BE5C-44B0-916D-69C4764DBDF6@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=AlHqJqLMqJz0j5jSrTOxvo1xc4GoVU16AeQHK4XJq9A=;
        b=tlDteK4eT+hMQzSxnUmC1IqQJmKX5epMSf+Y2w65Jvz6NwepEKuyDIALkpx+hId5QT
         k5hd0gLPGXEfxmsdFVmkEuNRnH4h4Bxk5BQyYQqawXNq5UKjnZ62TgXQTCV4dH+MCY3p
         KqTN+tkeHlXWFXsuHuscGQEy0kldVLVXeY85A=
In-Reply-To: <B6443739-BE5C-44B0-916D-69C4764DBDF6@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Sumin Xia <xiasumin1984@gmail.com>, netfilter@vger.kernel.org

it depends, for example if you have ip_forward enabled it will forward
the packet for you, using your default route for example in case dest
ip is not in the same subnet.

On 9 November 2010 20:56, Sumin Xia <xiasumin1984@gmail.com> wrote:
> Hi every one,
>
> According to my understanding, if I implement entables on my Linux sy=
stem, a
> frame should be passed through ebtables modules. Then, if ebtables mo=
dules
> find the destination mac address of the frame is the local mac addres=
s, it
> will transfer the frame to layer-3, that is iptables, right?
>
> Now I want to do a test, which modifies the destination mac address o=
f a
> frame before sending it. Therefore, the frame will be forwarded to an=
other
> destination instead of the real destination, while its destination ip
> address is still the real destination ip address. In this case, when =
the
> frame arrive at pseudo destination machine, will it be transfered to =
lay-3
> of the system? If it is transfered to lqy-3 of the system, the system=
 will
> find the destination ip address is not local ip address. What will ha=
ppen
> next? Drop the packet? or send an arp request to find the real destin=
ation
> mac address and forward it?
>
> Thanks,
>
> Sumin
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

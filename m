From: Emilio Lazo Zaia <emiliolazozaia@gmail.com>
Subject: Re: iptables in promiscuous mode
Date: Thu, 07 Jul 2011 12:33:39 -0430
Message-ID: <4E15E6EB.8070500@gmail.com>
References: <CAPR6_RB_BnxGoozDoQzyNS+Un3pERyYjpxgFHe1orMhMfj7DqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=1W7EJvgCSQMXl5gw/+YkNmJwzhNjiwJOivjLZFdDYbs=;
        b=vGYr8+mEa4rGwW06naOAKt5DLty3xD0CfZhVK3IbY5THaMQTL/WdWz+3tigdPEbWs7
         d7e/7sVe+hkqd7vlqmlJgsVDQLMhahUCiCwzr0i8klc0CkmycNPIbzJobNfOjlCMMvkC
         iR4N18KseESgYDo5tHsRm2c/dw/TShXHylXk8=
In-Reply-To: <CAPR6_RB_BnxGoozDoQzyNS+Un3pERyYjpxgFHe1orMhMfj7DqQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Andrey <andrey@cs.dal.ca>
Cc: netfilter@vger.kernel.org

*Maybe* making the device behaves in promiscuous mode to allow these=20
packets enters into kernel's network stack.

i.e.
# ifconfig [dev] +promisc
# ifconfig [dev] -promisc

or

# ip link set [dev] promisc on
# ip link set [dev] promisc off

What are you doing?

Someone can explain me why when tcpdump or wireshark are capturing=20
packets, neither ifconfig nor iproute shows the =E2=80=9CPROMISC=E2=80=9D=
 flag? but=20
dmesg indeed show =E2=80=9Cdevice [dev] entered promiscuous mode=E2=80=9D=
=2E

On 07/05/2011 11:35 AM, Andrey wrote:
> Hello,
>
> I have traffic that was captured in promiscuous mode, therefore it is
> not destined to my computer.
>  From what I understand netfilter/iptables does not work in promiscuo=
us
> mode therefore it will not see the traffic when I replay it.
> My question is can I make iptables work in promiscuous mode, if I can=
 then how?
>
> Regards,
> Andrey
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


From: Changli Gao <xiaosuo@gmail.com>
Subject: Re: [PATCH] netfilter: add CHECKSUM target
Date: Sun, 11 Jul 2010 20:45:01 +0800
Message-ID: <AANLkTikamhUUuoQ8EjwPn9gB4zHZkeDuzpiqd4XcN3lx@mail.gmail.com>
References: <20100708222913.GA4475@redhat.com> <alpine.LSU.2.01.1007091154120.7235@obet.zrqbmnf.qr> 
	<20100711122708.GA3573@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=4+HL7u5R1CdMdK8gioUIFOf89Jahq0tSdDdQVh6evGc=;
        b=xlagdBRlkIvlu/62Y/b9fXFjoTpenWCl4LHgGHxvQMhzukbEoycbPknhtmtpXnSeJf
         4e5hSHX45oOOXp31K3XKBhLQldJ+9LNdpFndpMG6apAExyCtxhKiv+X3OBfLBgsBt0jF
         gv9CZc+rofZRl0fAc8KR/5o9L09YIWw8JIWe0=
In-Reply-To: <20100711122708.GA3573@redhat.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jan Engelhardt <jengelh@medozas.de>, Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, "Pekka Savola (ipv6)" <pekkas@netcore.fi>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, herbert.xu@redhat.com, kvm@vger.kernel.org

On Sun, Jul 11, 2010 at 8:27 PM, Michael S. Tsirkin <mst@redhat.com> wr=
ote:
> On Fri, Jul 09, 2010 at 11:56:26AM +0200, Jan Engelhardt wrote:
>>
>> On Friday 2010-07-09 00:29, Michael S. Tsirkin wrote:
>> >
>> > include/linux/netfilter_ipv4/ipt_CHECKSUM.h | =A0 18 +++++++
>> > net/ipv4/netfilter/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 16 ++++++
>> > net/ipv4/netfilter/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A01 +
>> > net/ipv4/netfilter/ipt_CHECKSUM.c =A0 =A0 =A0 =A0 =A0 | =A0 72 +++=
++++++++++++++++++++++++
>>
>> New modules should use xt.
>
> I tried moving the module to xt_CHECKSUM but now
> =A0 =A0 =A0 =A0iptables -A POSTROUTING -t mangle -p udp --dport 68 -j=
 CHECKSUM --checksum-fill
> does not to load the module.
> It seems that xt_request_find_target in x_tables uses the prefix 'ip'=
 for a module.
> What am I missing?
>

You should add MODULE_ALIAS clause, i.e.

MODULE_ALIAS("ipt_CHECKSUM");

--=20
Regards,
Changli Gao(xiaosuo@gmail.com)

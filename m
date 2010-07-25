From: ZHOU Xiaobo <xb.zhou@qq.com>
Subject: Re: Problem with arptables et mangle
Date: Sun, 25 Jul 2010 19:55:52 +0800 (CST)
Message-ID: <16565681.321280058952111.JavaMail.ZHOU-PC$@zhou-PC>
References: <4C4B1867.6050006@via.ecp.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s0907;
	t=1280058958; bh=fbOi65l3CLWERsjf0KpevHs6RspdVHQBiN+3u0vUjaI=;
	h=X-QQ-mid:Received:Date:From:To:Message-ID:In-Reply-To:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=R2MY+YKg0ZHVOHD9IEd00O5F+0u3VnPWA5DLTqNUozeT6GJYsyi0rgCeTTLrcv+yf
	 xg3P85TdqTtkZ1Qpz4jJzRfSOl2s5nb0r6VGmrWV9HoBDEDTGQLKj+y3qYiB+m0
In-Reply-To: <4C4B1867.6050006@via.ecp.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Is it --mangle-mac-s?


----- Original Message -----
=46rom: "Antoine Souques" <corum@via.ecp.fr>
To: netfilter@vger.kernel.org
Sent: 2010=E5=B9=B4 7 =E6=9C=88 25=E6=97=A5, =E6=98=9F=E6=9C=9F=E6=97=A5=
 =E4=B8=8A=E5=8D=88 12:44:23 GMT +08:00 Beijing / Chongqing / Hong Kong=
 / Urumqi
Subject: Problem with arptables et mangle

Hi,

I have some trouble to mangle the hardware arddresses with arptables. I=
t=20
works fine with IP adresses, but I cannot enter a rule with=20
--mangle-hw--(d|s)

# arptables -A FORWARD --h-length 6 -s 138.195.130.6 --opcode 2 -j=20
mangle --mangle-hw-s 00:01:30:12:3c:70

And my box tells me : Bad argument `00:01:30:12:3c:70'

kernel :  Debian GNU/Linux, kernel 2.6.26-2-amd64

# lsmod |grep arp
arpt_mangle             6400  0
arptable_filter         6656  0
arp_tables             18832  1 arptable_filter
x_tables               25224  2 arpt_mangle,arp_tables

I have the version 0.0.3.3 of arptables

Thanks,

Antoine
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


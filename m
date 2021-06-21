From: slow_speed@att.net
Subject: Legacy?
Date: Mon, 21 Jun 2021 18:24:11 -0400
Message-ID: <f40a0638-af78-c356-eef4-116b84e652c4@att.net>
References: <f40a0638-af78-c356-eef4-116b84e652c4.ref@att.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024; t=1624314256; bh=LA/R5FolH5Nc3j3cCY1ZmJn0qMznYwfZ3FZ/rRvmtvg=; h=To:From:Subject:Date:References:From:Subject:Reply-To; b=VtJgO+cd2CCEgxrcdKoUszfJ6EHxVZeFrDwogQ34pZj9bNg9ScQQlgjjO+lTIBxIY3Wm57N7+6EsyEUyKJzmxLipbwF3lfEyS+YuGWrvQNEoSkyB3qNq5WPvXsog2PYNOFVQRd5W1o/hNtjrgeEf1QKZ11ovHTxtVL/C8n8x+AI=
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

A particular computer does not have nftables.=C2=A0 It shows rules for=20
iptables and a different set of rules for iptables-legacy.=C2=A0 Why is=20
iptables-legacy active but not the plain iptables?=C2=A0 Does legacy over=
ride=20
the regular?


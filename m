From: =?UTF-8?Q?Lars_Nood=c3=a9n?= <lars.nooden@gmx.com>
Subject: traffic shaping with tc and nft
Date: Sat, 28 May 2022 13:07:12 +0300
Message-ID: <c3bc1649-d70b-ae7b-b306-0d5f2a765857@gmx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1653732433;
        bh=5LKG3OAWj+SfDn5A4Z+NRXII6m3KbHUvme06xKsR1gA=;
        h=X-UI-Sender-Class:Date:To:From:Subject;
        b=kWuf21252qq9nUi44cM58Jkzz1ta52o7ChfB4SbF7jAKnpg4hmOjwBbUNV8g8PbM+
         j2cm8DHPWMmKpB9VGbgleA7ousdX+e4ZLCjZIKGwzpYG3LmC5srqoDQhz0u0/8ojBr
         aRLwkpkRL2qassRipWgyVLe1DXytbh3ZmQipo/u0=
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Netfilter Users List <netfilter@vger.kernel.org>

Hello,

I'm working on traffic shaping with tc and have some old iptables rules
with which I've tried to use iptables-translate to convert legacy
instructions to nftables.  For example, I have the following:

     iptables -t mangle -A OUTPUT -p tcp --match multiport \
	--sports 22,1965 -j MARK --set-mark 100

and the result is,

     nft add rule ip mangle OUTPUT ip protocol tcp \
	tcp sport {22,1965} counter meta mark set 0x64

However, nftables does not like that as-is and responds with an error:

     "Error: Could not process rule: No such file or directory"

I've obviously missed or misinterpreted something there.  What would be
the correct nft instruction(s) including any prerequisites?  Or what
traffic shaping guides are there for nftables with concrete examples?
I've pored over the wiki and it is great for the aspects which have
already become familiar but it is far too abstract for me for new areas.

$ uname -sr
Linux 5.10.63-v7l+

$ apt-cache policy nftables | head -n 2
nftables:
   Installed: 0.9.8-3.1

Thanks.
Lars

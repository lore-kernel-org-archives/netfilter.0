From: =?UTF-8?Q?Remzi_AKY=c3=9cZ?= <linuxliste@gmail.com>
Subject: Re: Linux 4.3.1 regression: -m state returns "Protocol wrong type for
 socket"
Date: Sat, 12 Dec 2015 11:56:03 +0200
Message-ID: <566BEF33.7090501@gmail.com>
References: <n4g4s8$4pr$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-type:content-transfer-encoding;
        bh=Us1ioZqAXMmeVznKAa8hG/Eo6n4smCiDzFkrDWKkyCQ=;
        b=TsMfplyWtSTcXS8mvSVnDpl5jmRq4lEcyrFBr5vgzGXzK+mX4lKZ3ZpAqPkthBCI5H
         Bd5tV325djwQRH4m945EKBHHcX4cJVxzCiI7caM/C94arhdkJAVpd/C47YD0lpvXxKuw
         mulU8PiUbPDCws7kCBX8h3VXyXnDNX9ai6UVyCQ44CcOfxIftVBE1/n702rmwBzxY0F4
         xtYlKpehWrGzvHn+jOUQvJY32tPaTBKjTApKa2pHUlClTtcLltBhNzSIFFRoL3gJ+gZ4
         yza24DqzQbm0y6+W6DnwmrlsPcLmHhZNSJ9nXeM8qELNEffl9BRuNKB7gzN44m9j7vy3
         lJqg==
In-Reply-To: <n4g4s8$4pr$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?Q?D=c3=a2niel_Fraga?= <fragabr@gmail.com>, netfilter@vger.kernel.org

Please use with -p tcp

iptables -A INPUT -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT



12-12-2015 05:38 tarihinde D=C3=A2niel Fraga yazd=C4=B1:
> 	After upgrading the kernel from 4.3.0 to 4.3.1 (with the same
> configuration), -m state doesn't work anymore.
>
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> 	returns:
>
> iptables: Protocol wrong type for socket.
>
> 	I'm using iptables v1.4.21.
>
> 	Any hints?
>


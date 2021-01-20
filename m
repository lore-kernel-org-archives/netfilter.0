From: Nikolai Lusan <nikolai@lusan.id.au>
Subject: Migrate ipsets to nftables
Date: Wed, 20 Jan 2021 20:41:25 +1000
Message-ID: <520e46a0d20803c22d515aca5e8df7045ca09497.camel@lusan.id.au>
Reply-To: nikolai@lusan.id.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lusan.id.au;
        s=KIEV_LUSAN; t=1611139306;
        bh=d1J/40FwwIQsqtiU6059WGVYW3bFlD80xHWQBj6peHs=;
        h=Subject:From:Reply-To:To:Date;
        b=WQsZVw97kk/kiLa49fWkvrTCyehsZpDm3uLT0sqzH5la0CH5XMSJ/XKILXcQYbdYW
         9hbpqc00ImmRXkBhUVZxO5x8Pw2FAAkBS3Iv1t4tllJJ51Q26XG7XFuFFNI8pBX52K
         MjTor4N00XjcXLqxbY8kguFZIeIoCnVeC7Ai6FFQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lusan.id.au;
        s=KIEV_LUSAN; t=1611139300;
        bh=d1J/40FwwIQsqtiU6059WGVYW3bFlD80xHWQBj6peHs=;
        h=Subject:From:Reply-To:To:Date;
        b=Ff+3zQ2SKiYjozJKsfRrEZAD3lVSCQVxLIkIz/uQ2GFKkfTROo+cIhtytTPcTJDr+
         LzbO9Ll/BMp4es2xc9gGattT69stGMqzZLXzkk8nAk5RharPns6XgQXnyeduMFpVgN
         YsoXv9lLO8IhRiqH9K96GvE4ZWSyBr7/qkB3BLQE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lusan.id.au;
        s=KIEV_LUSAN; t=1611139287;
        bh=d1J/40FwwIQsqtiU6059WGVYW3bFlD80xHWQBj6peHs=;
        h=Subject:From:Reply-To:To:Date;
        b=fT37Ad8qY1dH7nIySfV1kx7F5M1/6aT4Pq0cKoziXW9OtW/LAGUAvVw2wk1ZPiL1y
         faJ1uaZF41r9+V/It1ch9cEnelnYxNbUqadxC+ioMwKRLibWC41UinJdpnJnysQ4Ay
         Z/dVLo6W4hqcC08DKWougN4f8gFJJj3TCcUpnJ9I=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hi all,

I am in the process of migrating from iptables+ipsets to nftables. Is
there an easy way to migrate exisiting ipsets to nftables sets.

- -- 
Nikolai Lusan <nikolai@lusan.id.au>
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEVfd4GW6z4nsBxdLo4ZaDRV2VL6QFAmAICNUACgkQ4ZaDRV2V
L6SIgA/+LEuMM+KTNwaeP5VM+ledK7a2XOxt35frdIPhnNRRN7aIg7uMFU+8gATf
OePTeDoB12ILFPrWglUtpxXhzUAopOvpcNyPX4st7oj15mjuCSujIzd9i6aC2dl3
t5OSNeOvIt6QO6gZX4Z3taMh5iAMXSwRXxJwHUypOb5eOZ542HI69l9xpAAry+O5
9Tve0uKeHTW3WaUiW9CHl0Yta164ff6cSxYETk0lzUciB7Oh7+pF7sveNqgisUig
tO6r7ByacsnAB66/TzJEsP7nmtjz2pnhPppATRwmNfLPNszBAMddTyXJMJHKG9uW
63Lmu9VcyhNeKrTBsfJFaLPMLyzQSTYPghDFfXrpDYhjA6JNfbqo7R3DxJpMHnUK
4Ww+X6sXczy7xO6gPbVAOwbVyHcdyH0XLgWfN6nNSNcDAm4DxAClOjn/4e/6YBHC
VqD+HLd1cmS5xf1NNJPe6drgngkLObxoa9PXPN1lg/eNKJnS8s2CGDUf/a8ZrRq1
vxAOpK920b/rHsETBUIc9mNpecX+FYHFPQd71J+Hb7Byqs+ufFOc3pWkq8v7rsbm
ig8FRYdKIeSDQNvA+3fhSdmZdgybWKjBqXVVCwRfhWXnB5Y2WE26pO51Wb0hta0Z
fPYxIDTinOZtxDIE2MTG6NprOWi+2EPRmQ6UXlx6vYoaCN/E/qk=
=/6mU
-----END PGP SIGNATURE-----


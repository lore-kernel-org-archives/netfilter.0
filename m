From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: nftables: Anonymous vs. Named Set (ipv4_addr with netmask)
Date: Mon, 21 Mar 2016 09:01:13 +0100
Message-ID: <CAOkSjBjXUD94N+rZdaMnF5ayS-g61NRMD8tSbwWO5yW1nW+=-w@mail.gmail.com>
References: <CAAcp+HDRi5yGqJ=vkcKm0OzQq+f1T0vepWb8rcdiVrTGBXJ1ZA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=66O7jEidWM6knhNmx4NXbmR6BmfCgKk6ZQHhNFUwpZ0=;
        b=oxa/HhVSuJXsmUYO0a8xaJ0ctlhXss5wZ+nPhaIIzUfNNGRcLgCs9Bv+rXQx3ojSME
         x0sN0sutFqKg/HVnr3LEpKIc4YnOuBVOPEfs98wamyOapMceSBsg3fv6JRkef5izUCFK
         Zh1ZDuCSHdg8XCra2tYgL/A/ReW3OFq/rYACxnm6BOTfSVFKNyspj00bgl3/euiUUw03
         BCNtyN1LbVieuxBpJtIvaVHtcGH5xG/xPbj4dtWxW4jzA4JAP8H0aOwIaV4TvCxg5Y3a
         feCkQbjc4r7ynCacIr2oMyZbSO/k4+nPP5k0bOqn8ot7+qEN2qUTlSx3tWCMYm3K0NVu
         k0EQ==
In-Reply-To: <CAAcp+HDRi5yGqJ=vkcKm0OzQq+f1T0vepWb8rcdiVrTGBXJ1ZA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: "Garrett ." <orthostatic@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 21 March 2016 at 04:44, Garrett . <orthostatic@gmail.com> wrote:
> Example One - Anonymous Set with Subnet
> -------------------
> nft -i
> nft> add rule filter input meta iifname "eth1" ip saddr {
> 10.0.0.0/8,192.168.0.0/16 } counter log drop
> nft> list sets
>
> set set0 {
>     type ipv4_addr
>     flags constant,interval
>     elements =3D { 10.0.0.0/8, 192.168.0.0/16}
> }
>

This case is a fixed bug, see
http://git.netfilter.org/nftables/commit/?id=3Ddf5e71ba390dc574c50f0977=
f741d56cbc137034

>
> Example Two - Named Set, type ipv4_addr, Subnet Add Fails
> -------------------
> nft -i
> nft> add set filter rfc1918 { type ipv4_addr;}
> nft> add element filter rfc1918 { 172.16.0.0/12 }
> *** nft: netlink.c:326: netlink_gen_data: Assertion '0' failed. ***
> nft -i
> nft> list sets
>
> set rfc1918 {
>     type ipv4_addr
> }

Also a bug, however the code has changed since your version.

Please, try to test latest git version.

best regards.
--=20
Arturo Borrero Gonz=C3=A1lez

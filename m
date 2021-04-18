From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: nftables port forward on DHCP interface to static IP
Date: Sun, 18 Apr 2021 15:23:42 -0400
Message-ID: <973b2d85-567a-e9aa-1b64-749a1fb116a5@fhmtech.com>
References: <CABvnMci0-E23tAVE3MVgToSdbNuECqtMOe2wWimMmqZ9HZ9dHg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject; bh=gOB0IKX4TF2xDK33eSQGCVJp6VDllbzMd3wrz1500P4=;
        b=bkgRfz/X5Q0Cj16P7joeX3wEDYAfCg36Nu8pICBxZMO6zulIaol4gB1T95DrFfCbWpLw417+Qxxq3VgZSyy+BEG9gMGnNgX6QEbCQ09nhXjlH5kRjd33H5wCXUq+Np+XvRouUd52wWcERDl5ghivlMLSIOCg5uU8UyQQDbRggJI=;
In-Reply-To: <CABvnMci0-E23tAVE3MVgToSdbNuECqtMOe2wWimMmqZ9HZ9dHg@mail.gmail.com>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?UTF-8?Q?Pekka_J=c3=a4rvinen?= <pekka.jarvinen@gmail.com>, netfilter@vger.kernel.org

On 2021/04/18 11:59, Pekka J=C3=A4rvinen wrote:
> Hi,
>=20
> I'm trying to setup port forward for interface which uses DHCP. I
> don't want to reference the interface's public IP in a rule. Is it
> possible? My attempt:
>=20
> iifname $wanif tcp dport {12345} dnat ip to 192.168.1.11

Hi Pekka,

Try:
iifname $wanif tcp dport 12345 dnat 192.168.1.11

or
iifname $wanif tcp dport {12345} dnat 192.168.1.11
	(but the braces are unnecessary unless you want to add more than one dport)

https://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Addres=
s_Translation_(NAT)#Destination_NAT

Best Regards,
Frank

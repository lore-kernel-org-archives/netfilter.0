From: Arturo Borrero Gonzalez <arturo@netfilter.org>
Subject: Re: nftables set - network/netmask
Date: Thu, 1 Feb 2018 11:03:35 +0100
Message-ID: <CAOkSjBiMZUKBGYNJMaq98KzxDLWPLa_hd6+6Af06JWuAfM8G=A@mail.gmail.com>
References: <39fdc646-1ef4-a42c-c9f1-705c18b709ec@metu.edu.tr> <beb5146e-837f-fb5d-c766-e69547a6287f@metu.edu.tr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <beb5146e-837f-fb5d-c766-e69547a6287f@metu.edu.tr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hdemir <hdemir@metu.edu.tr>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 1 February 2018 at 08:50, hdemir <hdemir@metu.edu.tr> wrote:
> Hi,
>
> I found this conversation;
>
> https://www.spinics.net/lists/netfilter/msg56947.html
>
> It would be useful to have NET function as ipset has.
>
>

Then, using that example:

> hash:net,net

% nft add rule tablename chainname ip saddr and 255.255.255.0 . ip
daddr and 255.255.255.0 vmap { 10.10.10.0 . 10.10.20.0 : accept }

> hash:net,port,net

% nft add rule tablename chainname ip saddr and 255.255.255.0 . tcp
dport . ip daddr and 255.255.255.0 vmap { 10.10.10.0 . 80 . 10.10.20.0
: accept }


> hash:net,iface
>

% nft add rule tablename chainname ip saddr and 255.255.255.0 . iif
vmap { 10.10.10.0 . eth0 : accept }

Will add this to the nftables wiki [0].

[0] https://wiki.nftables.org/wiki-nftables/index.php/Concatenations#Examples

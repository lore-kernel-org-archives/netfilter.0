From: Alex Chapman <ajchapman88@hotmail.co.uk>
Subject: RE: nftables multi-dimensional dictionaries
Date: Fri, 4 Sep 2015 14:32:31 +0100
Message-ID: <DUB109-W37CC9580BFB40296703618E1570@phx.gbl>
References: <DUB109-W834148D76D2B04B8469D05E1690@phx.gbl>,<20150903163519.GA14100@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20150903163519.GA14100@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi Pablo,

Thanks for the response. Do I need kernel 4.2 to support this? I'm on 4=
=2E1 currently and the command below is erroring:

# nft add rule ip firewall forward =A0meta iif . meta oif vmap { eth0 .=
 lo : jump test }
<cmdline>:1:55-79: Error: Could not process rule: Invalid argument
add rule ip firewall forward meta iif . meta oif vmap { eth0 . lo : jum=
p test }
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ^^^^^^^^^^^^^^^^^^^^^^^^^
<cmdline>:1:55-79: Error: Could not process rule: No such file or direc=
tory
add rule ip firewall forward meta iif . meta oif vmap { eth0 . lo : jum=
p test }
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ^^^^^^^^^^^^^^^^^^^^^^^^^
<cmdline>:1:1-79: Error: Could not process rule: No such file or direct=
ory
add rule ip firewall forward meta iif . meta oif vmap { eth0 . lo : jum=
p test }
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^

(table named firewall and both 'forward' and 'test' chains configured).=
=A0

----------------------------------------
> Date: Thu, 3 Sep 2015 18:35:25 +0200
> From: pablo@netfilter.org
> To: ajchapman88@hotmail.co.uk
> CC: netfilter@vger.kernel.org
> Subject: Re: nftables multi-dimensional dictionaries
>
> On Wed, Sep 02, 2015 at 10:17:12AM +0100, Alex Chapman wrote:
>> Hi,
>>
>> Are multi-dimensional dictionaries supported in nftables? For exampl=
e:
>>
>> nft add rule ip filter forward meta iifname . meta oifname { \ eth0 =
=2E eth1 : jump chain \ }
>
> Currently we don't support oifname and oifname, the utility complains
> since it's a variable length datatype. But I think we can fix this by
> using the maximum length.
>
> Anyway, meanwhile you can use iif and oif for device whose device
> index is not expected to change.
>
> So this is how what you need looks like:
>
> nft add rule ip filter forward \
> meta iif . meta oif vmap { eth0 . eth1 : jump test-chain }
 		 	   		  
From: Eric <evil.function@proton.me>
Subject: Updating set elements from command line
Date: Sat, 08 Oct 2022 18:31:01 +0000
Message-ID: <Eio6D1ukecFTMx3qFhiCTbHRPOiSKqei5fvfeaGcMc4SfXxZriRAXGFv_HgaBa-wVulHKr7D-6mE6RNQOJztUM1tooTU5nCqQ1Z9AO_o_IM=@proton.me>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=unbdoqmbg5hnjc74btt2jlcx2e.protonmail; t=1665253868; x=1665513068;
        bh=PCltfir4MVqTANNBKLpRR4CMHxUWKxKXgUi3Loh0KwE=;
        h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID;
        b=WISPZh6NsM2b2DFiQz4nrQuPBUZqjEWj1bE9sxNXaeUBErZNNREvlm1E4p/8flSiv
         HmTnnzBEizAQ9y1L7/RvU33jBCvaT036Q0ohocvSnKQXwAQ9CnMWCEBEEg+vt9f5nt
         KxTD4hgMBlDzjsrOkQjZdinl7WY2hd08CkovODJCVCO+vlfSzA6eYHnR9YMZ9r0/m0
         Ucr79VT2NcKPEXu1Yu0YD8bPF6xyqybvEvzPLHTzQij2N6G3FuBdPtpI3oTn+/Azb9
         dvCkCxQNTG0k0rRG2R3CwoTatcaPP6qx/xy3odyFYlDRA6P+I3ngzvshsen7ym+5Z0
         CgJDsmXN/9qkA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Is it possible to update set elements outside the packet path?
https://wiki.nftables.org/wiki-nftables/index.php/Updating_sets_from_the_pa=
cket_path

I'm using a blacklist set, which is populated from an external source and
updated nightly in a cron job.  Current set definition is:

    table ... {
        set doh_ipv4 {
            typeof ip daddr
            counter
        }
        ...

My update script currently maintains counter values by a kludge,
dump-flush-repopulate:

    # Dump the current set in json
    json=3D$(nft -j list set inet firewall doh_ipv4)
    ... select out the current counts into a map indexed by IP ...

    ips=3D$(curl https://some/ip4.list)
    nft flush set ...  # Thus losing all statistics.
    for ip in $ips; do
        ... fetch $packets and $bytes from map using $ip ...
        nft add element ... { $ip counter packets $packets bytes $bytes }
    done

I would much rather use timeouts to remove old elements, thus eliminating
the kludge.  First, redefine the set with timeouts:

    table ... {
        set doh_ipv4 {
            typeof ip daddr
            counter
            flags timeout
            timeout 3d
            gc_interval 1h
        }
        ...

Then my cron script would just run through the list of addresses something =
like:

    ips=3D$(curl https://some/ip4.list)
    for ip in $ips; do
        nft update element ... { $ip expires 3d }
    done

But...

$ nft -v
nftables v1.0.2 (Lester Gooch)
$ nft update element ... { 1.1.1.1 expires 3d }
Error: syntax error, unexpected update
update element
^^^^^^

The problem is that 'update' only appears to be implemented in the packet p=
ath,
according to the wiki article mentioned at top.

So again, is there some way to get 'update' behavior from the cli tool?

-
As an aside, this would solve two other problems with my current scheme:

  1) There's a windows during the update after the set is flushed, but befo=
re
     the element is added back and queries can sneak past (that window is o=
nly
     5-10sec, so not a real issue);

  2) Sometimes blacklisted hosts "bounce" in and out of the downloaded list
     (this is a real issue, as these hosts might come back online and bypas=
s the
     firewall for the 24h period between cron updates, having a 3d expirati=
on
     would be a significant mitigation).


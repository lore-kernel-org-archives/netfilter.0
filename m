From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: nftables equivalent of "ipset test"?
Date: Mon, 9 Mar 2020 15:48:19 -0400
Message-ID: <3582f3f4-b22a-6841-38ab-c3a595423dc2@fhmtech.com>
References: <633ac5cf-a8db-4142-6ed2-ae335c7e12f1@fhmtech.com>
 <5698be8d-9813-533d-907b-3d420ecd5b7e@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject; bh=tyTlk/w1QGJXg4nYypYlKRvC6Gckb3wkZIxsDx41dSo=;
        b=ZAboWuhH9jkDFnY1E6Kz79StmaDwykeGqBMr5rwkW7wD/Vu+n29kf6qEVbo2UdIao3VI4LcSN0cu6agg8bX+9aXMLD1LNpXhNPkAp+0p2iNLe49Ll2Q3f/ORskdz2R3gboKHLtAFBYgCuegDEL3iyLUxY5qIifyPAK1BBdcqoeA=;
In-Reply-To: <5698be8d-9813-533d-907b-3d420ecd5b7e@plushkava.net>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Linux Netfilter Users List <netfilter@vger.kernel.org>

On 2020/03/09 14:56, kfm@plushkava.net wrote:
> One option would be to use the JSON output format. Here is an example of 
> how it might be done with jshon [1] for a set whose elements contain 
> just a single data type:-
> 
> nft_set_test() {
>      local val=$1
>      shift
>      nft -j list set "$@" |
>          jshon -e nftables -e 1 -a -e elem -a -u |
>          grep -qxF "$val"
> }
> 
> if nft_set_test 1.2.3.4 ip filter myset; then
>      echo "matched 1.2.3.4"
> fi
> 
> Where jshon isn't available, jq [2] could be another option.
> 
> [1] http://kmkeen.com/jshon/
> [2] https://stedolan.github.io/jq/

Kerin,

Thank you very much for the link to jshon and even including a sample 
script! Debian does have a jshon package available, I imagine I'll find 
many uses for it. In this case, I think jshon approach fails for 
interval sets when testing for a single element. (Say, test for 10.0.0.7 
in set containing 10.0.0.0/8.) Right?

Thanks,
Frank

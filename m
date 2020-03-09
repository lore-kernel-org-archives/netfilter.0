From: "" <kfm@plushkava.net>
Subject: Re: nftables equivalent of "ipset test"?
Date: Mon, 9 Mar 2020 18:56:27 +0000
Message-ID: <5698be8d-9813-533d-907b-3d420ecd5b7e@plushkava.net>
References: <633ac5cf-a8db-4142-6ed2-ae335c7e12f1@fhmtech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=7
        M6ML3FzNHbUCjwnZT4xNv1vC+Rc4ftPQbKzowX26WI=; b=e5oh/45omSVsdsUL+
        ELDCKTuPLZW8hLCVYSPGYGe3cwWRZxvnesQk7JyBVdC4GoDW90YaACM/PBSuAiX+
        hQNVyCbMleF8F7S50bbbsCn/z/CVGx7jZkDUyqVfBF2bvBJLn2xUo6J8T4D8BOZd
        XZIzpEYyzBOEmECLLLLte2ygTvSHuj3xXyvYil9MlU7mVkeax0XZ5Y3QecaHSAPE
        fcUsow2ju9Ha8h8pPNItPLlxwt8gGJr+0d3JAlKEVhiY03tjszpsRCnduB+mxHI1
        UTJHXNZ7RZFxaXWyNOjI/GWWz9tCZnGC/t6lsA3pO2p8uVQk8G5+KcpXzM7441FB
        aoC9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=7M6ML3FzNHbUCjwnZT4xNv1vC+Rc4ftPQbKzowX26
        WI=; b=wavtU9XGFh5m0nmqJA7sx+R4nZwJk3MfoaQcF/z/Wj0wUhOQvfLCkBc2m
        VLVjsCBdPuKp6SuQph7yf4g8vBFpR24DN9gNEMiPUP9sgx1sdValxxayQXftyIqr
        hjoNDFwQ3POS8WVB2Iq2181jVz6SfYk8VrG2qmmf1l3LWEFoL5rl4WntBRJ1lD4D
        WNds44IP3DpGqXOjuRZxcdpHR+F7d4Bt3Pk8kFfmDeFtslR9jr7mCiCvY+pS7Dz7
        AHXcZdY72DzTsto+M9ezZ2Ifyxg3Tg9aVD9HCG1ZlbIEGfoln2jhuhB1vBOP0B4N
        qj4yTTmU8Y0+EhXd5DQVh/CeK36Xg==
In-Reply-To: <633ac5cf-a8db-4142-6ed2-ae335c7e12f1@fhmtech.com>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Netfilter Users List <netfilter@vger.kernel.org>

On 09/03/2020 17:53, Frank Myhr wrote:
> Is there a recommended way to test whether an element is a member of an 
> nftables set?

Unfortunately, there doesn't appear to be a straightforward way to 
efficiently look up an element in a set from without the ruleset.

One option would be to use the JSON output format. Here is an example of 
how it might be done with jshon [1] for a set whose elements contain 
just a single data type:-

nft_set_test() {
     local val=$1
     shift
     nft -j list set "$@" |
         jshon -e nftables -e 1 -a -e elem -a -u |
         grep -qxF "$val"
}

if nft_set_test 1.2.3.4 ip filter myset; then
     echo "matched 1.2.3.4"
fi

Where jshon isn't available, jq [2] could be another option.

[1] http://kmkeen.com/jshon/
[2] https://stedolan.github.io/jq/

-- 
Kerin Millar


From: Bruno Meirelles <bmeirelles@gmail.com>
Subject: Re: Rule does not work. This is configuration error or bug?
Date: Sun, 9 Oct 2022 15:14:32 -0300
Message-ID: <9cb837d0-2c24-b1e0-74ca-be77773343fd@gmail.com>
References: <88178cba-fbcf-70d0-bf11-380c4260d0cc@gmail.com>
 <Yz4Ecl0JWtxPYMsc@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aFz5n2dKSVpKX5ElaKEAWK+Hibtn2AIiDqrtIvZjy14=;
        b=hX3hWtIMfS4WYBQN3YttBygZXI1zwTiCpIzPRgVSKbON2SIUyTqZih0E642N3Kf1ru
         oYZ/0NkXFCdb5We5dB/BcVTfowApcH9JppPH8WZQC9d6AKXHk8StLTD6J/0Yp3ol4HbV
         YW3LV0wJBNcYsXuXFCCMVui9XjytxMkeg9Q54ZNvxlvX2tYTHas4i8BTPXRCuB1cm7aB
         /d5RcK3HB3eLHqw6/ucVmJ3Sl6Hda/7ptvkDQmyLdBlgx9PMlHFF3vXMnyN3x/7YDlgo
         URSujMjPXLqlco+M5vV/JqAya0cTV3sJJ0OoAoovTjhH9DJ6ShLRjoWM+jhSrJh8ByxM
         lbHQ==
Content-Language: pt-BR
In-Reply-To: <Yz4Ecl0JWtxPYMsc@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi Pablo,

Thanks a lot for the help.

I did a test replacing the dns dnscrypt-proxy for bind9 and the rule worked.

I asked on the dnscrypt-proxy forum and nobody knows.

The service is configured to listen on [any] and works without port 
redirection. If I apply the rule stop listening to ipv6. IPv4 works 
perfectly.

Very strange. I will continue bind9 for now. Thanks a lot for the help.

Bruno.

Em 05/10/2022 19:25, Pablo Neira Ayuso escreveu:
> Could you check if packets are being marked as invalid by conntrack?
> In such case packets get no conntrack entry attached, in such case NAT
> cannot be applied.

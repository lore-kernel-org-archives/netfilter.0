From: "" <kfm@plushkava.net>
Subject: Re: Documentation Error on
 http://wiki.nftables.org/wiki-nftables/index.php/GeoIP_matching
Date: Fri, 1 May 2020 20:26:04 +0100
Message-ID: <1223898e-3399-4932-8238-ff8820e0e4a0@plushkava.net>
References: <bb194828-4636-4c07-92a4-54f9ff28a55e@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=u
        jWDItFzm5VgzldtDCYSFEjCgJxGU0rSvbTQq1Ln6vc=; b=bH0D4qmc4KTsF15MD
        W6BTZA14Y4quBwmm3Oz7Zj1+tvX8409c+I3+UDHvEHRMP6sh3bzqmAIB+so06/bF
        E8x3fzWWlJlyJ5PIl9GbJjvV6SWvx7G12NJERcctuZcT74m7MuU0fHWP04cAQ8O/
        Kwq4q4FMzLRfRFr6//gSU7odFAhVLvidDaYDpfMbnvI8uaV5dYmc7nHL3RKCBlOM
        hGuvbO3LZi3dtS61w+Go4/0jNllvvuEGLlqKeS+TzJnQnHm/soV60cnoZojgZKMO
        C8DqKn2PFpE0RLk71iI0jp8tNV4Zf4o1HtR0aM5cKlOTEjs/VKZ1Y8asbcrCYSuV
        EGYNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=ujWDItFzm5VgzldtDCYSFEjCgJxGU0rSvbTQq1Ln6
        vc=; b=D3OjgwN+fH0vk2EVs29cvKBKg64QpyxsPejmk5NTpgryUSbMeL9W2hPNW
        NtZhDICUxVKhY+YHoUQAplT5P1rtY1ZGxZj+eM3NotyD9BYcbxpmeJNw0HKG2euA
        Hd2cGxEHQO2F6TrhVKUP179PZKcTZtgMoPRhdXXcX/wgTFbuvILMqqpqMfNFOMoF
        4KiOsCTU7S+3IsC8aiR3noJEy7M3i3fKnempE+k/0Q1aeFVHacGtKt21fh4A3LUZ
        ywAl1ttF6bIq5cZLUrTH3LDSIT++cKouruBFkz4XRnO4RSSTVHkbRiq///V0qRXw
        lYLTh/zq5ee7OmULvsoJRMGShGDqg==
In-Reply-To: <bb194828-4636-4c07-92a4-54f9ff28a55e@comcast.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bob and Sally Public <bobandsally.public@comcast.net>, netfilter@vger.kernel.org

On 01/05/2020 17:58, Bob and Sally Public wrote:
> At the bottom of the page, it reads:
> 
> type filter hook input priority filter; policy accept;
> 
> I believe it should read:
> 
> type filter hook input priority 0 ; policy accept;
> 

The current nft(8) man page documents that filter is a valid symbolic 
name, having a value of 0.

Speaking of which, the man pages at the www.netfilter.org site need to 
be updated. In the meantime, the asciidoc sources can be found below.

https://git.netfilter.org/nftables/tree/doc

-- 
Kerin Millar

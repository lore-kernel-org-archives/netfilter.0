From: iphone4004@meiliboxi.fi
Subject: Flowtable hardware offload
Date: Fri, 22 Oct 2021 19:43:33 +0000
Message-ID: <036440ebac22275ecd9abcaf094294e0@meiliboxi.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=meiliboxi.fi; s=mail;
        t=1634931817; bh=wCLYy2PuHxzuNNjXhBqwJHVHLoSRVUC8zjNIdbDGIDE=;
        h=Date:From:Subject:To:From;
        b=UJNUzYIh7hBVhSppnIrwMUiX+REn5A9OD6k4NYG/DDwsimlsjIgbKDGqq8V4UBOR+
         u5I66KduH7JFZ0BroNiAhsGgAXukyeL5uzXzsQ8sc/yZUqpzBa0EHi0q0wX/6iRTsl
         0YDOAy1jlFLh6lBtbPLO8nA+CQ2eD6xCz+yLJVfw=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=meiliboxi.fi; s=mail;
        t=1634931813; bh=wCLYy2PuHxzuNNjXhBqwJHVHLoSRVUC8zjNIdbDGIDE=;
        h=Date:From:Subject:To:From;
        b=KiMZAcQ0Ks7e+gDol3cizcao5GDqx3hFIZ8tQHfE9kYkIR9ASoGSZeYvpsqHt345e
         lE7SeR4UZ5eAwBiCi/Gr04wAKr4qAuuTvq3+z8Et1kLefqEkvRyHAgy3FNemjZYpCq
         q02LHsEHXPcyAq2HW54+hQDi4TjORtLMTj5ssh98=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi!

1) Is flowtable hardware offload supported in 1.0.0?

2) Which NICs are supported? Mellanox is mentioned [1]

3) How many flows can be hardware offloaded?

4) What happens when the flow limit is exceeded?

- IP

[1] https://wiki.nftables.org/wiki-nftables/index.php/Flowtables

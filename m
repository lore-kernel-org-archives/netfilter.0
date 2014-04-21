From: =?UTF-8?B?U3ZlbiBLw7ZobGVy?= <sven.koehler@gmail.com>
Subject: Re: how to ignore forwarded traffic?
Date: Mon, 21 Apr 2014 18:45:36 +0300
Message-ID: <53553D20.5040401@gmail.com>
References: <lj1rka$f3l$1@ger.gmane.org> <CAEzD07Kz6bh16_YFTv-sgO0ZoXAneOwUUQt7=Kg6fy2b8LCY7w@mail.gmail.com> <535531A6.6090602@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=DdLWynOlUXc7FtRnhQJaxtHmJFwXdDr81jtHJ3d6upE=;
        b=JCq1Awjo3AT0XrbaOsi+LRbNLWvAKBQXfR7RUyozURGo2MhdVkParkKSqgvzhiHNq7
         QfxgqyheCTi7QoRUgs+i1KdD1sbj6CMuDw2FR8d0RrMvyuF04QkNYIFbXUP1nydVhz27
         0Av2RA+L/rXOvV4/TjA1y7j713EPLc3hEVpzk08QttpMzZ2hUAU+BdyE3gRff7Kl1EY8
         qtJyuuZiJLPebqkBQ54lIOEzOD5Ufh/plvVH5Je9gL2XVhzQFlGlECZ/uYbyrWduDUMB
         6AgmS8jmKM4t8MJRHYKXpDxvO9cjbehHNUGOQBVETHlLSQxpI6jeaDZf2OQ517lbADNS
         PdJQ==
In-Reply-To: <535531A6.6090602@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Anton 'EvilMan' Danilov <littlesmilingcloud@gmail.com>
Cc: netfilter@vger.kernel.org

Am 21.04.2014 17:56, schrieb Sven K=C3=B6hler:
> I know have the following three rules:
>=20
> iptables -t raw -A PREROUTING -d <router-ip> -j CT
> iptables -t raw -A PREROUTING -s <router-ip> -j CT
> iptables -t raw -A PREROUTING -j CT --notrack

Correction:
iptables -t raw -A PREROUTING -d <router-ip1> -j CT
iptables -t raw -A PREROUTING -d <router-ip2> -j CT
iptables -t raw -A PREROUTING -j CT --notrack
(again no rules in the OUTPUT chain of the raw table)

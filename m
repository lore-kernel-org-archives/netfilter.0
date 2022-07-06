From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: Bug in the wiki
Date: Wed, 6 Jul 2022 07:40:54 -0400
Message-ID: <e0a0c4e2-e7c0-7cdb-3039-4cff4bd80233@fhmtech.com>
References: <CAEXMXLRwFcx4UdjFe_15Q26iuT4K=coZLvBgYfkow_8o9=iB9Q@mail.gmail.com>
 <600cead8-acad-0be6-bfe4-33cee996ccd9@fhmtech.com>
 <CAEXMXLRqUgFmME_8OKpAWRog3dqRCG+veHbJsZPKh9xOZ98D=Q@mail.gmail.com>
 <16130a18-e4c1-a1b7-1414-7025389efca0@fhmtech.com>
 <CAEXMXLSGWtT_6JrCEFhRgvG4-Ssj1jnVUs_r4JjoFzwjiip=mA@mail.gmail.com>
 <d8aa9eed-4e9f-7385-6908-438e71c8c2d1@fhmtech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID; bh=iTzwKW2xFHZA2cYloip6Tpw0axkSZo8qKsbwjDTogjw=;
        b=uPScqojbrjqDGrkKBRWfdn9Y6Cg6aawN/Nsxyr9no5f15UzR+EfJ2fO+vGMZiLsi62e4Fla0sMAHeYiQRVWle99Ur+YxiUOmJHA9FeiKZy8seomYVkpoq/sATJ8SWCfYMjP+EXf6P2X2yLKLDsbqmwr363f1cyUDV2inDJutbq0=;
Content-Language: en-US
In-Reply-To: <d8aa9eed-4e9f-7385-6908-438e71c8c2d1@fhmtech.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: =?UTF-8?Q?Nuno_Gon=c3=a7alves?= <nunojpg@gmail.com>
Cc: netfilter@vger.kernel.org

Thinking about it some more, maybe a better solution to single-ip ping 
flood is to accept them all as in current ruleset, but limit outgoing 
icmp rate per destination ip address.

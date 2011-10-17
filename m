From: =?UTF-8?B?TWFyY2luIE1pcm9zxYJhdw==?= <marcin@mejor.pl>
Subject: Re: route sorting
Date: Mon, 17 Oct 2011 15:20:38 +0200
Message-ID: <4E9C2BA6.6030507@mejor.pl>
References: <4E9C1E1C.4060309@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mejor.pl; s=cokolwiek;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:Message-ID; bh=byqyeBGFIWZcPLCpxUDBmnjIG1rzzz+iWWP1xxefQHk=;
	b=IVXx7JDd+1MHQby2iqsBYYOOpfIRSMxj78y8z9qzU86oy9mgvk6Z7K0iQsj2b973VfXYdeR6rpktjg5RBl4JXV9WY7WysnVLuc7ZrwQrjTSswspN6vThVtSzsucif4zf;
In-Reply-To: <4E9C1E1C.4060309@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

W dniu 17.10.2011 14:22, Mr Dash Four pisze:
> When I execute "route" to display my routing table all entries are
> sorted by ip address (when -n is specified). This seems to be a bit
> different from previous kernel versions (I am using 3.0.6) - 2.6.38 for
> example - where the routing table used to show the most specific netmask
> first (at the top), which is what I really wanted as it was very easy to
> judge how a particular ip address is going to be routed. When I execute

Hello,
i can't help you with "sorting problem" but i can see the real problem 
is "i want to know which path will be used for given address ip". I 
suggest to use iproute2, e.g.: ip r g <address_ip>
This is output:
# ip r g 4.5.6.7
4.5.6.7 via 88.198.102.193 dev eth0  src 88.198.102.195
     cache

Regards

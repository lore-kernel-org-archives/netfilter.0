From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.9.1 released
Date: Thu, 15 Sep 2011 00:51:43 +0100
Message-ID: <4E713E0F.1050403@googlemail.com>
References: <alpine.DEB.2.00.1109062143300.9388@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=message-id:disposition-notification-to:date:from:user-agent
         :mime-version:to:cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=ja1cUkHULkHcvbzmUhEwA4+ATqOkqHsgZLUJ5cBORJk=;
        b=TQVsJfr8VpuNWmc6Hi5Z9wSZd4f1jqky0BNwLIV6wAjgCsMbEuaRLmClGOyCZZpEnn
         cUnABWdc33TsUCvnkIX0IcAtg1mi+4IHdEXIj9qJzjDdlYMMlkDWpkTIEPgT+HQnmNfq
         03F6S8QtRCnx8mGnqel6UWmFIkmobF7pIN5+M=
In-Reply-To: <alpine.DEB.2.00.1109062143300.9388@blackhole.kfki.hu>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Jozsef Kadlecsik wrote:
> I'm happy to announce ipset 6.9.1. It contains two important bugfixes: if 
> you use ipset on a hardware with tight memory usage, please upgrade.
>   
I am trying to compile this source (kernel modules only) against the 
latest fedora-released kernel - 2.6.40 (a.k.a. 3.0.1), but get the 
following errors:

net/netfilter/ipset/ip_set_core.c:244:5: warning: "LINUX_VERSION_CODE" 
is not defined
net/netfilter/ipset/ip_set_core.c:244:26: warning: "KERNEL_VERSION" is 
not defined
net/netfilter/ipset/ip_set_core.c:244:40: error: missing binary operator 
before token "("
net/netfilter/ipset/ip_set_core.c:1175:5: warning: "LINUX_VERSION_CODE" 
is not defined
net/netfilter/ipset/ip_set_core.c:1175:26: warning: "KERNEL_VERSION" is 
not defined
net/netfilter/ipset/ip_set_core.c:1175:40: error: missing binary 
operator before token "("
net/netfilter/ipset/ip_set_core.c: In function 'ip_set_dump':
net/netfilter/ipset/ip_set_core.c:1178: error: too many arguments to 
function 'netlink_dump_start'
make[3]: *** [net/netfilter/ipset/ip_set_core.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [net/netfilter/ipset] Error 2
make[1]: *** [net/netfilter] Error 2
make: *** [net] Error 2
make: *** Waiting for unfinished jobs....


Am I missing something?

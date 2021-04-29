From: Frank Wunderlich <frank-w@public-files.de>
Subject: Aw: Re: Flowtable with ppp/bridge
Date: Thu, 29 Apr 2021 15:59:37 +0200
Message-ID: <trinity-f42dffe4-8c59-4f94-85ad-415d83452465-1619704777495@3c-app-gmx-bs69>
References: <16CF72C8-335A-48D2-BA6F-FF632735DCFD@public-files.de>
 <20210426172924.GA3178@salvia>
 <8AA68E42-DE50-4591-BCF0-18A058FA93F8@public-files.de>
 <20210426175703.GA3590@salvia>
 <B1C290C8-8CF7-435B-88B0-29A09E4B0CA6@public-files.de>
 <20210427234929.GA19570@salvia>
 <F9658CCF-3C23-4921-B27A-5EA1963BF33C@public-files.de>
 <4119615D-30F5-4A05-A206-5B7E97754F57@public-files.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1619704777;
        bh=Eztn8dg5rvSl6C67VhiYi90/Kq0zmygiIHf1+qYTqww=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Tv+sPKxvbizujkMyAtwvL51kL5VQ8wlYABsOTQD8is+QHzCkQOD8jFy2oOcHgWnjR
         DRE3j3RxdpI4/YnjscZj68HUOCnw+2EDnhacojmJQBESDSiQHUJputC7VrrpXjeqMH
         ABPv4urzNYX69el73kY4QCNeQwVDKfZC4dYHhVpw=
In-Reply-To: <4119615D-30F5-4A05-A206-5B7E97754F57@public-files.de>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: frank-w@public-files.de
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

Hi,

after setting up a pppoe-server on my laptop and configuring all to go over it, running 5.12-rc+offload series (v1) it works so far. Running 5.10 with the ported version, i cannot get tcp working with flowtable over vlan/ppp (also without offloading).

seems there are any patches for flowtable i miss in my 5.10-tree

any idea which patch(es) this can be?

regards Frank

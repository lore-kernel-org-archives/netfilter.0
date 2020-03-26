From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: What is the BEST GUI frontend to iptables firewall?
Date: Thu, 26 Mar 2020 11:49:33 +0000
Message-ID: <e0d4f13d-5a9c-c5eb-c847-7a24e0558795@gmx.net>
References: <65bb6d398e79b3d924f518d20f40b48e@teo-en-ming.com>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1585223384;
        bh=D+j3f1O1ymWcsAHiUHBb8xlV99vvwd0xDlDMLXlzvG8=;
        h=X-UI-Sender-Class:Reply-To:Subject:To:References:From:Date:
         In-Reply-To;
        b=ICmujZSPU5FG9+ws1enhQjz4rSSFQ9XMOF2atMJpUpBwNicRiv0185xpO/CDwDBrN
         DkDQVpGV0Z5+WJBK6C9Sy1QVrkHmRasPRxX8CQTScYg/E8aEsk0NOb6ZUZV9ZFsVJ+
         bYy1um4TeCFUtM4WnP1z+EAT/pOG6M0L4iNk29rI=
In-Reply-To: <65bb6d398e79b3d924f518d20f40b48e@teo-en-ming.com>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


On 26/03/2020 11:35, Turritopsis Dohrnii Teo En Ming wrote:
> Good evening from Singapore,
>
> May I know what is the BEST GUI frontend to iptables firewall? It can
> be very involved and tedious to configure iptables firewall using the
> command line approach.
>
> Are there any good rankings and reviews on the best GUI frontend to
> iptables firewall?
>
> I am looking forward to hearing from you soon.
>
> Thank you very much.

"best" is rather something in the eye of the beholder / user
perspective. Some distros provide a comprehensive management GUI that
includes firewall management.

Back in the (iptables) day this distro independent GUI
https://configserver.com/cp/csf.html served me well, also integrates
with various admin panels.

From: Benno <b.ohnsorg@freenet.de>
Subject: Re: Rule does not work. This is configuration error or bug?
Date: Sat, 24 Sep 2022 08:18:07 +0200
Message-ID: <c6898217-2a57-cdb9-c6ec-effc28075048@freenet.de>
References: <88178cba-fbcf-70d0-bf11-380c4260d0cc@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
        s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=P0ojBefPCjSHzPZNSKf1hx5chnLbkmQEuN1t7O7wgY0=; b=uLxYewVbWGkH1PV6z/fW4dsBZ3
        lpX3xJTXRboLOY24prM0UTx3kFHq9Dauln+Wp3edNpVdjGFDG3E9zCMMQ2dkxNz41JmL5ekcD0OZg
        ouf5yfr28SLD044pw1P86vddZ14HUxTo/eRhbq3j6i1DOKTRxJes1G+84KIHoVxs0iNejc6NlpYyC
        r0EwiNOlbSAi+geoysPRByGifeH74/nGw2A9X/oGj+4+cSHfOBAZWP526yZCk7CkR8S5L+8xyL4cm
        osQP4Fx2H7ETitvul9oORqNanGV0r+I/FDZaU3Qf2cxr59Yg6xxC6cVUOn/nx+KHqYrI1n9/6X33i
        saG 
Content-Language: de-DE
In-Reply-To: <88178cba-fbcf-70d0-bf11-380c4260d0cc@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bruno Meirelles <bmeirelles@gmail.com>, netfilter@vger.kernel.org

l4proto?

Am 24.09.22 um 00:07 schrieb Bruno Meirelles:
> 
> Hi friends,
> 
> […]
> 
> nft add rule inet nat PREROUTING iifname "$LAN" meta l4proto {tcp, udp}
> th dport 53 counter redirect to :53 comment Redirect-DNS
> 
> In ipv4 traffic, the rule works perfectly. In ipv6 traffic I do not
> receive a response.
> 
> […]
> 
> Thanks,
> 
> Bruno.
> 
> 
> 

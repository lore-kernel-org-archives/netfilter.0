From: Billy Crook <billycrook@gmail.com>
Subject: Re: openvpn over udp failing
Date: Sat, 7 Aug 2010 13:35:45 -0500
Message-ID: <AANLkTikm-McA4wOUBf+xTX8_EBYykis4N_9F6u6XDPEn@mail.gmail.com>
References: <BAY145-ds1603A7ECCE6D4944CFAF48F3920@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type;
        bh=fcpuHGUAROOyVIruhdi+Fuvuz0S2AY++ypCao+DCxmw=;
        b=bfCvFbSZyWD9PX1kbeXUMMEqvC9qWqsneNyzKOM7m2ROWmkcY//4LsDCrFIf/hcyOF
         m287wYL1oAimQoM6OXZZh1kWjApjoiMlV70mJ+ojXDWgo/MRmbrkHa4PwkqoAKYebUSN
         bssfbQ7J1eCbSe3PAPkAkwl3DsD+Gz0b4G6WU=
In-Reply-To: <BAY145-ds1603A7ECCE6D4944CFAF48F3920@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: J Webster <webster_jack@hotmail.com>
Cc: netfilter@vger.kernel.org

On Sat, Aug 7, 2010 at 13:09, J Webster <webster_jack@hotmail.com> wrote:
> However, although it connects, when I view the IP from the client, it still
> says xx.xx.xx.198

That sounds correct to me.  -j MASQUERADE is old and ugly and should
be avoided.  it really does a -j SNAT --to-source 1.2.3.4 where
1.2.3.4 is the primary address of the egressing interface.  It can be
useful when that interface' address is not static, but you're probably
better scripting around that.

So you want your openvpn client to use the openvpn server as its
default route.  And by "view the IP from the client", you mean you
visit some site like say https://secure.informaction.com/ipecho/ and
it reports one IP when queried by a process on the openvpn server, and
reports another IP when queried by a process on an openvpn client, and
you do not like that?

Try replacing the '-j MASQUERADE's with explicit '-j SNAT --to-source's.

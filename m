From: Billy Crook <billycrook@gmail.com>
Subject: Re: openvpn over udp failing
Date: Sat, 7 Aug 2010 14:26:25 -0500
Message-ID: <AANLkTi=EdB3eWDJNnyoxngYCg6U0Z5JDp6A1SEw21c=R@mail.gmail.com>
References: <BAY145-ds1603A7ECCE6D4944CFAF48F3920@phx.gbl> 
	<AANLkTikm-McA4wOUBf+xTX8_EBYykis4N_9F6u6XDPEn@mail.gmail.com> 
	<BAY145-ds21CD2C7CC8AF3A317E2027F3920@phx.gbl> <AANLkTimZDpwz5bQhK1JGc-yYVwv2uY-65MUiJHfWQxj+@mail.gmail.com> 
	<BAY145-ds485C6ADAF166EC33C64A7F3920@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type;
        bh=YsrLg+q9jskK2Sno0PvbDns9ezKnkRCZr8VSy6G/+u8=;
        b=fr9YxGVYuGn/5O4WZ+yrplFkw6nCftjN9WeMOqz6UtNZHKyh+o+QOoHF3fJJOMp1Mc
         LD7HBG3YOfx58AGeBVTPB71IexSYhAj4ybXgaK/r2fy1ly/ZJ9KznL4z1y2sNyZ39/DI
         ViXtPgsnuCxg/qYFPCUyyN/C4DFsKs0/ykeY4=
In-Reply-To: <BAY145-ds485C6ADAF166EC33C64A7F3920@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: J Webster <webster_jack@hotmail.com>
Cc: netfilter@vger.kernel.org

On Sat, Aug 7, 2010 at 14:17, J Webster <webster_jack@hotmail.com> wrote:
> Would it cause a problem for video sites using RTMP?

no.  I can't see how any site could be aware of it let alone respond
negatively to it.

> They will be expecting a connection form the same IP address won't they?

Unclear.  If you are asking "Will remote servers expect tunneled nat
clients of the vpn server to be using the same public IP as the nat
server for their default route?", the answer is "of course not".  How
would the remote sites know that the people connecting to them are
tunneled nat clients anyway?  Unless you are administering these
remote sites with specific knowledge of your tunneled nat vpn clients,
and with the intent to prohibit these tunneled nat vpn clients it will
work.

> I guess this could all be solved by binding the vpn to the 198 main address.

!!!what???? Do remember that openvpn's  --local address specifies the
address where the openvpn server should listen for incoming tunnels.
It in no way has anything to do with the routing of traffic received
from within those tunnels or how that traffic will be handled within
netfilter.  This is clearly documented.

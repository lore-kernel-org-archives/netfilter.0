From: Billy Crook <billycrook@gmail.com>
Subject: Re: openvpn over udp failing
Date: Fri, 6 Aug 2010 22:10:17 -0500
Message-ID: <AANLkTinxMMe_dAENYJr+hQS0R7TWUbcc1OyuOOzNrcHC@mail.gmail.com>
References: <BAY145-ds3FB0B1B5B904843D4A32BF3910@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type;
        bh=Ttjxgi45BYE/HzhMAikqbxbbYVRIGgMbBI1WfCTIz3o=;
        b=cbBtFQX3UfhtbO/+9/YiD1d8K+VhGvHR/0icH34rGGhpv14OVhxI0BxpGZetc5v3CE
         aVtZUJ8g8DQXig6btsySSusfTClvjX53xPobDIgMwKSeC8wXJB8LTEuIZrd+aD4b8o2m
         SzAeRaD+lro1yeLZE4UwtnnsmokZqtKYb9w5Y=
In-Reply-To: <BAY145-ds3FB0B1B5B904843D4A32BF3910@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: J Webster <webster_jack@hotmail.com>
Cc: netfilter@vger.kernel.org

On Fri, Aug 6, 2010 at 12:15, J Webster <webster_jack@hotmail.com> wrote:
> CLIENT:
> Fri Aug 06 08:11:59 2010 us=546000 TLS Error: TLS key negotiation failed to
> occur within 60 seconds (check your network connectivity)
> Fri Aug 06 08:11:59 2010 us=546000 TLS Error: TLS handshake failed
> Fri Aug 06 08:11:59 2010 us=546000 TCP/UDP: Closing socket
> Fri Aug 06 08:11:59 2010 us=546000 SIGUSR1[soft,tls-error] received, process
> restarting

Do a tcpdump on your client.  I bet you will see it send udp out to
.198, but get udp back from .199.

Solution: Configure openvpn to explicitly bind only to 199.
--local xx.xx.xx.199 --bind

(I also use openvpn.)

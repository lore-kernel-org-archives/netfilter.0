From: Billy Crook <billycrook@gmail.com>
Subject: Re: openvpn over udp failing
Date: Sat, 7 Aug 2010 13:57:32 -0500
Message-ID: <AANLkTimZDpwz5bQhK1JGc-yYVwv2uY-65MUiJHfWQxj+@mail.gmail.com>
References: <BAY145-ds1603A7ECCE6D4944CFAF48F3920@phx.gbl> 
	<AANLkTikm-McA4wOUBf+xTX8_EBYykis4N_9F6u6XDPEn@mail.gmail.com> 
	<BAY145-ds21CD2C7CC8AF3A317E2027F3920@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type;
        bh=AH9sMxn/I5E5bE+ldZaJqSzpO1we64n8Us1KKxy0LRw=;
        b=CYx4yl8DTS5wwbR3Pp+ijTGA1aVWLpnBBejRRM1dZ+qaH89oLv7ym9z7hXz8xgCsMM
         QdClxYMrn6cunLN8vmpj577K/dI8xmrezrTMJMGE6yYoc8EzH2Ce5GIW+lJeO5IYIm+u
         oUeqoZFCxUrdgPLIh5ibTfi/40EH4xWNPkP7w=
In-Reply-To: <BAY145-ds21CD2C7CC8AF3A317E2027F3920@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: J Webster <webster_jack@hotmail.com>
Cc: netfilter@vger.kernel.org

On Sat, Aug 7, 2010 at 13:44, J Webster <webster_jack@hotmail.com> wrote:
> Well, it's more that the openvpn service is running on an IP of the server
> of xxx.xxx.xxx.199 (the server has 2 public IPs).
> I don;t really understand why when the client connects, that a site like
> your ipecho below would report my IP as xxx.xxx.xxx.198

That's the source ip that netfilter gave to the MASQUERADEd connection
as it passed through eth0.  198 is probably the primary ip for eth0
(eth0:0) and eth0:1 is 199, right?  That is why by connections leaving
eth0 will default to a source address of 198.  There may be exactly
one defailt IP.

> omitting the port numbers?

You tell us.  man iptables[enter]/--to-source

I don't know why you'd care about the source port, but it's your box.
I use --random on mine, because I'm just that way....  Nice job
netfilter devs, on --persistant.  I was too busy to notice that slip
in.

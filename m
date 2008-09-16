From: John Haxby <john.haxby@oracle.com>
Subject: Re: Https website is not accessible once transparent proxy is set
  up
Date: Tue, 16 Sep 2008 12:19:32 +0100
Message-ID: <48CF9644.7010504@oracle.com>
References: <A42989E6EE1BCE4C9C1FF7DE428FF3C6630F@mos-exchange.mosmsg.com.sg> <18b30431bfdfb986412e296c4bc9aad1.squirrel@www.arcoscom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <18b30431bfdfb986412e296c4bc9aad1.squirrel@www.arcoscom.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux@arcoscom.com
Cc: netfilter@vger.kernel.org

ArcosCom Linux User wrote:
> Read about HTTP transparent proxy.
>
> The HTTPS can't be transparently proxied (as I now) for yet.
>   

Well, not by squid, but the connection can be transparently proxied.   I 
have a tiny transparent proxy that redirects all connections to any port 
outside an intranet to a connection through an HTTP CONNECT request.

jch

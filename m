From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Squid transparent proxy /iptables (Yahoo messenger/Gmail/Https
 not works)
Date: Sun, 27 Jan 2008 21:55:44 +0100
Message-ID: <479CEFD0.9030307@rtij.nl>
References: <54a362580801271111vbc33fd6vf732922cd3b24@mail.gmail.com>	 <op.t5lrvstsrtqp7s@hagumi> <54a362580801271247p30b2b55bld8f4c74b3ace553@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <54a362580801271247p30b2b55bld8f4c74b3ace553@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: yogesh@technotux.net
Cc: Eljas Alakulppi <Buzer@buzer.net>, netfilter@vger.kernel.org

Yogesh Patil wrote:
> Hi,
>     Thanks for the reply, but i don't want to really proxy https
> traffic i now it is secure, but i want to give access to the websites
> which are using https as my internet connection is connected on the
> linux box which is having installed BIND DNS, Squid Proxy, and
> configured iptables i just want to know, how to allow https websites &
> Yahoo messenger which uses socks for connecting to it's servers.
>
>   

Https cannot be proxied transparently (well, not easily). Just allow 
port 443 out.

Alternatively, let everyone set your proxy address in their proxy 
settings for https. Then the browser will issue a CONNECT to the proxy 
to connect to the remote site.

M4


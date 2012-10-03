From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Application Level Gateway for HTTP?
Date: Wed, 3 Oct 2012 19:17:36 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1210031916180.6161@nerf07.vanv.qr>
References: <CAMon-aTpTkZgpXfCfNEZCXqQvna53UeG9AJd6C0X+KNQq-Cfmg@mail.gmail.com> <CAMon-aRHugAWLrS=eCyUTLeDeDGsj7mWRY7C+b853ZNeV2Pdhg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMon-aRHugAWLrS=eCyUTLeDeDGsj7mWRY7C+b853ZNeV2Pdhg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin 't Hart <colin@sharpheart.org>
Cc: netfilter@vger.kernel.org

On Wednesday 2012-10-03 15:23, Colin 't Hart wrote:

>Hi,
>
>Has anyone here used netfilter to make an Application Level Gateway for HTTP?
>
>What I'm looking for is an "HTTP router" or "HTTP reverse proxy" that
>can route requests for resources received via HTTP to the appropriate
>(internal) web server.
>
>We develop and host applications for our clients and such an HTTP
>router would simply admin for us significantly.
>
>
>While I can install an HTTP reverse proxy server, I don't need any of
>the other features that such a server would provide, purely the
>routing part, so I thought that netfilter should be able to do the
>job.
>
>In particular, could string matching be used to achieve this?

No, because iptables is not operating at the application layer.
tinyproxy, squid, apache mod_proxy, ... enough possibilites of actual 
application layer gateways.

From: "/dev/rob0" <rob0@gmx.co.uk>
Subject: Re: Local to Local via firewall
Date: Fri, 31 Jul 2009 22:24:17 -0500
Message-ID: <200907312224.18053.rob0@gmx.co.uk>
References: <20090731144247.01a4f9bb@zeus.int.pccl> <1249062563.27177.25.camel@enterprise.ims-firmen.de> <20090731215235.06a83d26@digital-domain.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090731215235.06a83d26@digital-domain.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Clayton <andrew@digital-domain.net>
Cc: netfilter@vger.kernel.org

On Friday 31 July 2009 15:52:35 Andrew Clayton wrote:
> It's annoying and I'd like to get it working at the firewall. But
> for now I think I'm going to take Robby's advice and have a look
> at split views with Bind. This also does seem to be the recommended
> way to do it. 

I forgot to mention in my reply, but I've found dnsmasq to be a very
good tool for overriding single names in the global DNS. Nothing
against BIND, but it's more difficult to set up and maintain, and
dnsmasq is more flexible for this purpose.
-- 
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header

From: "Adam J. Kessel" <ajkessel@alumni.princeton.edu>
Subject: Re: IP forwarding on iptables router box no longer working after
 Debian upgrade; can ping but not get http request from outside hosts
Date: Wed, 25 Feb 2009 18:53:28 -0500
Message-ID: <49A5D9F8.7020901@alumni.princeton.edu>
References: <20090225151053.GA32332@whitehail.bostoncoop.net> <go44sr$pcu$1@ger.gmane.org> <49A5B504.1090309@standarduniversal.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49A5B504.1090309@standarduniversal.com.au>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Brian Austin - Standard Universal <brian@standarduniversal.com.au>
Cc: Ralf <rm@amitrader.com>, netfilter@vger.kernel.org

>> Adam Kessel wrote:
>>> I have a simple home router iptables setup. The router now runs Debian
>>> Lenny; the client runs Ubuntu. Since the Debian upgrade, the forwarding
>>> setup no longer works properly.
>>> The iptables router has two NICs; one connects to the cable modem, the
>>> other to an internal switch. Router is running Linux 2.6.26, iptables
>>> 1.4.2. The router box has no network issues with the Internet. I can 
>>> ping, surf
>>> websites, etc.. The client box has no problems talking to the router. 

Problem solved! For some reason, the MTU on my outward-facing NIC had 
shrunk after the Debian Lenny upgrade. By increasing the MTU back to 
1500 on that interface, everything works fine.

So it's not iptables fault.

I have no idea why the MTU would have been set lower after the upgrade, 
but that's some other package's problem.

Adam

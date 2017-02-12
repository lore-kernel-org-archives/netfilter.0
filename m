From: Michael Weiser <michael@weiser.dinsnail.net>
Subject: Re: Match packet address against addresses on interface
Date: Sun, 12 Feb 2017 15:07:47 +0100
Message-ID: <20170212140747.GA4010@weiser.dinsnail.net>
References: <20170211171321.GC31183@weiser.dinsnail.net>
 <568f0d90-e6e6-f1ac-4d9b-27b3b21438da@plouf.fr.eu.org>
 <20170212124332.GE2935@weiser.dinsnail.net>
 <e5f7689a-6c5f-1f28-5680-4fcca061b3f9@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e5f7689a-6c5f-1f28-5680-4fcca061b3f9@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Hi Pascal,

On Sun, Feb 12, 2017 at 02:15:49PM +0100, Pascal Hambourg wrote:
> > iptables -I OUTPUT 1 -p tcp --dport 22 -m addrtype --src-type LOCAL -j ACCEPT
> I thought you wanted to match only against local addresses attached to a
> specific interface, not all interfaces. If that specific interface is the
> output interface, then you can add --limit-iface-out.

Agreed.

> Otherwise, may I ask why do you need this ?
> Only a process with special privileges can send packets with a non local
> address.

My use case is a DMZ bastion/remote access jump (i.e. somewhat exposed)
host where I do not want a process that somehow gained privileges to be
able to e.g. send out spoofed packets right away as well as a kind of
high-level martian filtering by just accepting packets directed at an
address the machine actually has. This collides with IPv6 constantly
changing addresses due to privacy extensions and RAs from my DSL
provider. 

I am aware that it mostly is a case of "rampant paranoia"[tm] paired
with "because I can"[tm].

> local != private
> There is no need for a specific extension to match any given address prefix
> such as those defined in RFC1918 : -d/-s already do the job.

I did say dummy, didn't I? :)
-- 
bye, Michael
Dessau fuer's Volk!

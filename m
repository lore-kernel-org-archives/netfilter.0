From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: Double stack IPv4&&IPv6 for a firewall
Date: Wed, 29 Aug 2012 00:21:48 +1200
Message-ID: <503CB7DC.0@treenet.co.nz>
References: <50375A06.6000808@cica.es> <1345818598.2977.265.camel@denise.theartistscloset.com> <alpine.LNX.2.01.1208241640240.16184@frira.zrqbmnf.qr> <CAPfcJatemcsT5PK+m8__xhB7gBRinAuq2wNX_g93CQrSmvtDhQ@mail.gmail.com> <alpine.LNX.2.01.1208250137290.30075@frira.zrqbmnf.qr> <CAPfcJaugwb5DboUYGAfEktHCDZX0KxdCWdS9CyAu3rh94P8inQ@mail.gmail.com> <CAPfcJas2Cz8VCDe+FG8oVVzmhVyq0=s7vKHhorFgPdM5jwLSdg@mail.gmail.com> <503CAF64.9060406@treenet.co.nz> <503CB4CB.8060207@cica.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <503CB4CB.8060207@cica.es>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Arturo Borrero <aborrero@cica.es>
Cc: julien@linuxwall.info, netfilter@vger.kernel.org

On 29/08/2012 12:08 a.m., Arturo Borrero wrote:
> On 28/08/12 13:45, Amos Jeffries wrote:
>> I use a wrapper generator called "ferm". It generates the 
>> iptables/ip6tables once with a lot of flexibility, then uses 
>> iptables-save/restore to operate the system.
>
> Reading `ferm' documentation, it seems that the original issue is 
> still latent:
>
> domain [ip|ip6]
>
> You have yo choose one of the two keywords, what forces you to write 
> the firewall twice.
>
> Or i'm wrong?
>

If you wish you can write "domain (ip ip6) { .. } ". which expands the 
.. rules list for both.

AYJ

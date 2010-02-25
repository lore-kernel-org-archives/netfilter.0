From: "U. George" <netbeans@gatworks.com>
Subject: Re: Is there some reason why IPSET kernel modules are not in kernel
 source?
Date: Thu, 25 Feb 2010 12:37:38 -0500
Message-ID: <4B86B562.5050605@gatworks.com>
References: <4B857D3F.6070901@gatworks.com> <alpine.DEB.2.00.1002242237090.7439@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1002242237090.7439@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: netfilter@vger.kernel.org

Is that the ipset kernel modules? Its been at least 4 years.
Fedora et al just wont accept the program ipset until the iptable / 
ipset kernel mods are in the 'upstream' kernel source.

Some reason as to why u cannot repair the ip_set kernel-modules as new 
kernels are released?

On 02/24/2010 04:40 PM, Jozsef Kadlecsik wrote:
>> Seems like iptable modules are included in kernel source.
>> >  Not so with the IPSET modules. Is this something political?
> Nothing political. ipset needs to be rewritten before submitting, in order
> to avoid backward-forward compatibility issues in the future. That makes
> me say "no submitting yet".

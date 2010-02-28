From: "U. George" <netbeans@gatworks.com>
Subject: Re: Is there some reason why IPSET kernel modules are not in kernel
 source?
Date: Sun, 28 Feb 2010 08:26:40 -0500
Message-ID: <4B8A6F10.2010901@gatworks.com>
References: <4B857D3F.6070901@gatworks.com> <alpine.DEB.2.00.1002242237090.7439@blackhole.kfki.hu> <4B86B562.5050605@gatworks.com> <20100228063756.GC10293@minipax>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100228063756.GC10293@minipax>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Not Fedora.
No ipset because no supporting kernel modules. Fedora module policy is 
that it must come from 'upstream' kernel providers.

On 02/28/2010 01:37 AM, /dev/rob0 wrote:
> Then your solution is to package and compile it yourself. FWIW I do
> think that there are numerous distributions which package ipset.

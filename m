From: Steffen Beyer <steffen@beyer.io>
Subject: Re: Masquerading fails after first packet
Date: Wed, 9 Feb 2011 14:35:07 +0100
Message-ID: <20110209143507553656.c9954d48@beyer.io>
References: <20110208184922508316.a730ff6b@beyer.io>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110208184922508316.a730ff6b@beyer.io>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Tue, 8 Feb 2011 18:49:22 +0100, Steffen Beyer wrote:
> I'm trying to get masquerading/SNAT to work on a Ubiquity AirOS device 
> (kernel 2.6.15).

Got it working by downgrading to AirOS 5.2.1 (same kernel version).

-- 
Steffen Beyer <steffen@beyer.io>

GnuPG key fingerprint: CA00 1611 242B 89D4 E643  E235 05F3 7689 DD3E EB26
Public key available upon request or at http://wwwkeys.de.pgp.net

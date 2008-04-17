From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: NAT Port Forward problem in a not so simple network
Date: Thu, 17 Apr 2008 09:56:23 -0500
Message-ID: <48076517.2090000@riverviewtech.net>
References: <480479E8.3040904@naxe.it> <48049C5D.8040104@bofhland.org> <4804C356.3040405@riverviewtech.net> <4807637D.2070704@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4807637D.2070704@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 04/17/08 09:49, Pascal Hambourg wrote:
> It does not matter so much as, according to the packet trace, Cisco1 
> appears to SNAT incoming connections forwarded to HPpro1 anyway. So all 
> you get in the logs is HPpro1's address instead of Cisco1's...

Huh!  Great!  Friggign lovely!

Do you know if that the prescribed Cisco way of doing that or just the 
way that it was configured at your site?

Seeing this new evidence, just DNAT & SNAT the traffic on the HP 
ProLiant and call it a day.



Grant. . . .

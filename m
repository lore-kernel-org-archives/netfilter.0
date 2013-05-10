From: Andreas Herz <andi@geekosphere.org>
Subject: Re: [ANNOUNCE] ipset 6.19 released
Date: Fri, 10 May 2013 14:32:23 +0200
Message-ID: <20130510123223.GQ8305@localhost>
References: <alpine.DEB.2.00.1305092214320.25002@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1305092214320.25002@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On 09/05/13 at 22:28, Jozsef Kadlecsik wrote:
> I'm happy to announce ipset 6.19. The main new feature in this release is 
> the per element byte and packet counters for every set type, which is 
> based on the new internal extension infrastructure. Please read the 
> updated manpage on how to use counters, initialize or change them.

Thanks for the release :)

Can you describe the new feature a bit more in detail?
I would like too see some use cases for this feature.
I would guess that every packet that comes through the ipset match would
increase the counter for the address (element) in the list. But what
effect does it have, since the timeout has the effect that the element
leaves the list when it goes down to zero.

-- 
Andreas Herz

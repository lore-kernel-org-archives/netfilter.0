From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: lxc, conntrack and routecache
Date: Tue, 06 Apr 2010 08:05:42 -0700
Message-ID: <m1iq84aaex.fsf@fess.ebiederm.org>
References: <20100404090757.6f1ac500@catlap>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100404090757.6f1ac500@catlap> (Marek Kierdelewicz's message of "Sun\, 4 Apr 2010 09\:07\:57 +0200")
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: containers@lists.linux-foundation.org, netfilter@vger.kernel.org

Marek Kierdelewicz <marek@piasta.pl> writes:

> Hi,
>
> I'm evaluating lxc for use in virtualized routing/bridgeing
> infrastructure. I'm particulary interested in conntrack and routecache
> behaviour. I had run some tests and established that routecache and
> conntrack is not shared between containers and base system. Are data
> structures for routeche and conntrack in kernel shared (with each entry
> marked with namespace id) or new data structure is created for each new
> container?

What does it matter?

Eric

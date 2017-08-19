From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Why can't we use DNAT in the INPUT Chain?
Date: Sat, 19 Aug 2017 18:44:03 +0200
Message-ID: <a9f3e365-63e1-165b-497a-340a69d9631f@plouf.fr.eu.org>
References: <5c984fa5-a2a5-340d-7cb6-6b21c3768e45@gmail.com>
 <20170819132827.GY2027@harrier.slackbuilds.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20170819132827.GY2027@harrier.slackbuilds.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Le 19/08/2017 à 15:28, /dev/rob0 a écrit :
> 
> Network address translation (NAT) only happens in the "nat" table;
> this table has no "INPUT" nor "FORWARD" (note: spelling counts! ;) )
> for your use.

The nat table has had an INPUT chain for quite some time now. It allows 
to do SNAT, but not DNAT.

> Filtering is done in the "filter" table, which likewise, has no
> "PREROUTING" chain.  To some extent you could filter in the "raw"
> table, but there's not much benefit to that.

Among the benefits of early filtering in the raw table are :
- avoid the unnecessary conntrack processing and decision routing when 
the packet is to be dropped ;
- process packets as they were received, before any transformation in 
the mangle and nat tables.

The former benefit can be useful to save CPU cycles on busy machines.

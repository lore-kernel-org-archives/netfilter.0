From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [PATCH] ipset: Add wildcard support to net,iface
Date: Thu, 26 Sep 2019 12:42:58 +0200
Message-ID: <20190926104258.26cpudsjsv4z5pqf@salvia>
References: <20190926100645.4170-1-kristian.evensen@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190926100645.4170-1-kristian.evensen@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kristian Evensen <kristian.evensen@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, Sep 26, 2019 at 12:06:45PM +0200, Kristian Evensen wrote:
> The net,iface equal functions currently compares the full interface
> names. In several cases, wildcard (or prefix) matching is useful. For
> example, when converting a large iptables rule-set to make use of ipset,
> I was able to significantly reduce the number of set elements by making
> use of wildcard matching.
> 
> Wildcard matching is enabled by adding "wildcard" when adding an element
> to a set. Internally, this causes the IPSET_FLAG_IFACE_WILDCARD-flag to
> be set.  When this flag is set, only the initial part of the interface
> name is used for comparison.
> 
> Wildcard matching is done per element and not per set, as there are many
> cases where mixing wildcard and non-wildcard elements are useful. This
> means that is up to the user to handle (avoid) overlapping interface
> names.

Wrong list. Please send it to netfilter-devel@vger.kernel.org

Thanks!

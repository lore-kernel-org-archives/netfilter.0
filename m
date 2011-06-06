From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [NFLOG] How to determine the connection a packet belongs to?
Date: Tue, 07 Jun 2011 01:39:36 +0200
Message-ID: <4DED6538.3090404@netfilter.org>
References: <BANLkTimnO5UzNvq6SfuWc7osck=QL=HrMw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTimnO5UzNvq6SfuWc7osck=QL=HrMw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Clemens Eisserer <linuxhippy@gmail.com>
Cc: netfilter@vger.kernel.org

On 06/06/11 16:26, Clemens Eisserer wrote:
> Hi,
> 
> We are using ulog2/nflog for logging packets and connections, which
> works quite well.
> 
> However we haven't found a reliable way to determine which packets
> belong to which connection.
> There seem to be two distinct IDs for both packets (nflog) as well as
> connection IDs issued by conntrack,
> is there some correlation between the two IDs?

No.

> Or is there any other (maybe even better) way to determine which
> logged packet belongs to which connection?

You can build the tuple from the packet in user-space to look up the
conntrack via libnetfilter_conntrack.

From: jalvarez <jalvarez@toulouse.viveris.com>
Subject: Re: nftables: nf_acct and quota support ?
Date: Wed, 10 Aug 2016 15:14:38 +0200
Message-ID: <1500e903-050f-cca2-02b7-ac2fc8948b39@toulouse.viveris.com>
References: <91a3fab3-fd7d-02bc-4caa-107af0a39495@toulouse.viveris.com>
 <20160810123430.GA16233@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20160810123430.GA16233@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On 10/08/2016 14:34, Pablo Neira Ayuso wrote:

> On Wed, Aug 03, 2016 at 04:06:09PM +0200, jalvarez wrote:
>> Hi,
>>
>> I am currently trying to add quotas for traffic that matches some nftables
>> rules.
>> While looking for a solution I have found the netfiler accounting
>> infrastructure (nfacct) very interesting.
>> Problem is I didn't find anything about nfacct in the nftables code.
>>
>> Is there any nftables support (or planned support) for nfacct ?
> I have a patchset that I need to spin over again, but it's coming with
> native support for nftables.
Ok ! Are you refering to Ana Rey Botello's patchset ? 
http://www.spinics.net/lists/netfilter-devel/msg34766.html
I looked very promising ! :)

In the end, do you think the following features could be added in nftables ?
- an expression to increment nfacct counters (maybe reusing the existing 
semantic "counter xxx").
- an expression to match if the quota set on the nfacct object is 
exceeded. Something like : "counter name xxx overquota".

This could lead to interesting things like starting to drop packets when 
a quota is exceeded.

Thanks.

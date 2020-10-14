From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: cannot use != with ct status
Date: Wed, 14 Oct 2020 12:04:02 +0200
Message-ID: <20201014100402.GA19556@salvia>
References: <CY4PR1001MB23116E94084D4CC5610C79C2E8050@CY4PR1001MB2311.namprd10.prod.outlook.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CY4PR1001MB23116E94084D4CC5610C79C2E8050@CY4PR1001MB2311.namprd10.prod.outlook.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Ramsay, Lincoln" <Lincoln.Ramsay@digi.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wed, Oct 14, 2020 at 04:16:40AM +0000, Ramsay, Lincoln wrote:
> Hi,
> 
> I've just confirmed that I can't make a rule that matches ct status != dnat.

ct status == dnat and ct state != dnat checks for _exact_ matching.

Then:

        ct status dnat

based on the datatype, provides a shortcut for

        ct status and dnat == dnat

For inverted matching, please use:

        ct status and dnat != dnat

From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nfqueue ethernet packet frame capture
Date: Wed, 17 Mar 2021 15:37:14 +0100
Message-ID: <20210317143713.GA3781@salvia>
References: <CADtAAp7ReZoa1kLSm4oc7um9-vQ_XUnq9t80mN4T8igZQjyxUA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CADtAAp7ReZoa1kLSm4oc7um9-vQ_XUnq9t80mN4T8igZQjyxUA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ilker <ilkery@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, Mar 17, 2021 at 03:35:56PM +0300, ilker wrote:
> Hi All,
> 
> I am working on nfqueue to capture packets from networks.
> I am not able to capture destination MAC addresses using NFQUEUE.
> Is there a way to capture a full ethernet frame (especially
> destination MAC address) using NFQUEUE library?

nfq_get_packet_hw() might help?

From: Michal Soltys <soltys@ziu.info>
Subject: Re: Simplest failover solution for iptables firewall (router)
Date: Wed, 11 Jan 2012 00:53:35 +0100
Message-ID: <4F0CCF7F.4000909@ziu.info>
References: <CAKywjPpp3xsP=Rkvnfxo_7T-5xcZZuuzqSWy6M8u4bqX0C-KOA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKywjPpp3xsP=Rkvnfxo_7T-5xcZZuuzqSWy6M8u4bqX0C-KOA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Anton Melser <melser.anton@gmail.com>
Cc: netfilter@vger.kernel.org

On 12-01-09 22:11, Anton Melser wrote:
> Hi,
> Does anyone have experience with such a setup? It looks as though at a
> minimum there is keepalived and pacemaker+heartbeat. Is one
> better/worse for a specialised firewal box?

There's also a carp port usable in linux:

http://www.ucarp.org/project/ucarp

In particular, check:
http://download.pureftpd.org/pub/ucarp/README

No firsthand experience though, but paired with conntrackd it's reported 
to work fine.

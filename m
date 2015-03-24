From: Laurent Bercot <ska-devel@skarnet.org>
Subject: Re: nftables feature request: don't fail "flush" on nonexistent tables
Date: Tue, 24 Mar 2015 11:06:46 +0100
Message-ID: <55113736.6060508@skarnet.org>
References: <550B3069.7080209@skarnet.org> <20150322183106.GA4150@salvia> <550F0DBE.7000905@skarnet.org> <20150322190033.GA7145@salvia> <550F1155.5000501@skarnet.org> <20150323114515.GA5552@salvia> <551015F2.7060801@skarnet.org> <CAOkSjBgWSF1Nj6WD+cp8_w+=ESd-6m74_Ev=7dB5PNeonyXhEg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAOkSjBgWSF1Nj6WD+cp8_w+=ESd-6m74_Ev=7dB5PNeonyXhEg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 23/03/2015 20:42, Arturo Borrero Gonzalez wrote:
> perhaps `flush ruleset'.
>
> That doesn't fail if there is no ruleset.

  It's exactly what I was looking for, thanks.

-- 
  Laurent


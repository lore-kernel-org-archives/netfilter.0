From: Arturo Borrero Gonzalez <arturo@netfilter.org>
Subject: Re: Doubts about netfilter + nftables and module
Date: Thu, 21 Nov 2019 14:59:19 +0100
Message-ID: <ed81e7ad-708e-d3f1-0c1d-09329f0c3409@netfilter.org>
References: <CAPar=unRE+rOGVEnvJfvgLKAz3hBa+azm-gb6kPsP-kUz5MLOw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAPar=unRE+rOGVEnvJfvgLKAz3hBa+azm-gb6kPsP-kUz5MLOw@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Elias Valea Peri <eliasvp@gmail.com>
Cc: netfilter@vger.kernel.org

On 11/20/19 1:29 PM, Elias Valea Peri wrote:
> Hi to all, we’re migrating our systems from netfilter + iptables to
> netfilter + nftables.
> We’re looking for information about which modules we want/need to load
> for our needs and extensions we want to use.
> Looking for documentation about, we aren't capable to find a
> description of what does each module. For some modules, we see easily,
> just by its filename, what does but for others it isn't easy.
> We've downloaded our kernel sources, look for doc at netfilter.org,
> www.kernel.org/doc, etc... without success.
> Does anybody knows where we can find for each nf_*.ko, nfnetlink_*.ko,
> nft_*.ko ... file the functionality/extension that implements each one
> ????

In general, you have some description of each module at Kconfig files, for example:

https://elixir.bootlin.com/linux/latest/source/net/netfilter/Kconfig

The nf_tables framework is a bit different from x_tables. In x_tables each
target/match provided a very specific functionality that you may or may not find
interesting for your use case (and you could disable if not)

In nf_tables rules are composed of low level expressions each providing some
kind of functionality. Mots likely you won't find a 1:1 correspondence between a
given nft rule statement and a kernel module. Unless you know you are doing, I
would advice to enable all of the nft_ modules, to make sure the ruleset you
configure has the corresponding kernel support.

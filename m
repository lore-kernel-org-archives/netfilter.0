From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: ulogd packet based logging with CT info
Date: Sun, 15 Aug 2021 16:31:18 +0200
Message-ID: <20210815143118.GA15248@salvia>
References: <CAMEa=f=5g4rE42ii+HLXpiJ9LQshoVwfVfaGcEqrsSsXsgmh=A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMEa=f=5g4rE42ii+HLXpiJ9LQshoVwfVfaGcEqrsSsXsgmh=A@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?Qmxhxb5laiBLcmFqxYjDoWs=?= <blazej.krajnak@gmail.com>
Cc: netfilter@vger.kernel.org

On Sun, Aug 15, 2021 at 04:23:51PM +0200, Blažej Krajňák wrote:
> Hello,
> 
> is there any way to enable packet based logging to XML but with
> connection tracking information included?

From the example ulogd2 configuration file in the tree:

http://git.netfilter.org/ulogd2/tree/ulogd.conf.in#n77

# this is a stack for flow-based logging via XML
#stack=ct1:NFCT,xml1:XML

From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [nft] Regarding `tcp flags` (and a potential bug)
Date: Thu, 29 Jul 2021 09:12:52 +0200
Message-ID: <20210729071252.GC15962@salvia>
References: <CAGnHSEkt4xLAO_T9KNw2xGjjvC4y=E0LjX-iAACUktuCy0J7gw@mail.gmail.com>
 <CAGnHSEncHuO2BduzGx1L9eVtAozdGb-XabQyrS7S+CO2swa1dw@mail.gmail.com>
 <20210727211116.GA13897@salvia>
 <CAGnHSEknUAcg=bk1D43oZNMt=4GOZUcqh5Vt6=FU+ebRKtqcWw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGnHSEknUAcg=bk1D43oZNMt=4GOZUcqh5Vt6=FU+ebRKtqcWw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Yan <tom.ty89@gmail.com>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

On Thu, Jul 29, 2021 at 10:27:57AM +0800, Tom Yan wrote:
[...]
> As of the current code (or even according to what you said / implied
> "should and would still be right"), `tcp flags syn` checks and checks
> only whether the syn bit is on:

It is actually the same topic that you are discussing in several
emails: You don't seem to like that the implicit operation for the
bitmask datatype is not ==.

Fair enough.

[..]
> Probably because `{ }` implies a `==`.

Again the same argument from another email: As I said { } implies a
set, which implies an exact match on the value.

For most datatypes, the implicit operation implies '==', except for
the bitmask datatype.

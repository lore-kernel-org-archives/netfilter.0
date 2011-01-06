From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: limiting connection duration
Date: Thu, 6 Jan 2011 21:53:24 +0100
Message-ID: <20110106215324.0167036b@kuguar>
References: <AANLkTinqiKZNqixyB7jien-M=dg9bJ2wKSY6VmT8GUmc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTinqiKZNqixyB7jien-M=dg9bJ2wKSY6VmT8GUmc@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rich Rauenzahn <rrauenza@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

>Looking at the --limit related options, it seems that all of the
>options are about limiting rate, not duration of a connection.

Look at "recent" match and "CONNMARK/connmark" target/match. I think it
could do what you want.

best regards,
Marek Kierdelewicz

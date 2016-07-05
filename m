From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: libnftnl tests compilation
Date: Tue, 5 Jul 2016 14:30:06 +0200
Message-ID: <20160705123006.GA27094@salvia>
References: <20160705112849.GA7993@sonyv>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160705112849.GA7993@sonyv>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laura Garcia <nevola@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, Jul 05, 2016 at 01:28:50PM +0200, Laura Garcia wrote:
> Hi, I'm following the compilation instructions of libnftnl from the
> wiki but the tests/ folder are not compiled. Do you know how to
> enable the compilation of the tests?

make check

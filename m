From: =?ISO-8859-1?Q?Salih_G=F6n=FCll=FC?= <sag@open.ch>
Subject: Re: ulogd2 segfault
Date: Fri, 07 Jan 2011 11:24:00 +0100
Message-ID: <4D26E9C0.9090304@open.ch>
References: <4D1E0374.3090008@open.ch> <4D221173.3060009@open.ch> <4D25C945.7030502@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D25C945.7030502@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On 01/06/2011 02:53 PM, Pablo Neira Ayuso wrote:

> Let me check this, if the problem is what you're pointing (which makes
> sense at first look at the code) I guess that we need some refcounting
> for plugins to avoid double freeing.


When I comment out nflog_unbind_group(ui->nful_gh) in  stop() inside 
input/packet/ulogd_inppkt_NFLOG.c,  ulogd does not segfault anymore.

Here I have question:

Does  *pi in
static int stop(struct ulogd_pluginstance *pi)

represent the NFLOG plugin or the individual log2:NFLOG ? I am asking 
because it get started only once with pluginstance_started(), and 
therefore should be stopped once (?)

Cheers,

-salih

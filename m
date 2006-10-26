From: "Gabor Szokoli" <szocske@gmail.com>
Subject: Re: understanding how conntrack works
Date: Thu, 26 Oct 2006 09:04:48 +0200
Message-ID: <de47c0230610260004p311d17eap31126b486f8f78da@mail.gmail.com>
References: <2FEE63312285CF428A8480B07AC1C35903657F21@CHN-SNR-MBX01.wipro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2FEE63312285CF428A8480B07AC1C35903657F21@CHN-SNR-MBX01.wipro.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

On 10/25/06, anisha.chandrasekaran@wipro.com

> [...]
> what are the structures that store conntrack details, i.e, if I want to
> drop a particular connection that is established which structure entry I
> should be parsing and deleting??????

Hi!

I have no idea, but if I were you, I'd look at the source of the
conntrack command line utility which does just that.
Google code search for a string literal from its usage notes:
http://www.google.com/codesearch?q=+%22Tool+to+manipulate+conntrack+and+expectations%22+show:RD63OKff6uI:4Aj5uJ7HKoA:cv34qD7QSD4&sa=N&cd=2&ct=rc&cs_p=http://ftp.netfilter.org/pub/conntrack/conntrack-1.00beta2.tar.bz2&cs_f=conntrack-1.00beta2/src/conntrack.c#a0

There, links to libnetfilter_conntrack, you continue :-)


Hope it helps:

Gabor Szokoli


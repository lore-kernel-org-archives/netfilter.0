From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [patch] netfilter: information leaks building packet message
Date: Thu, 8 Aug 2013 14:02:54 +0200
Message-ID: <20130808120254.GA6822@localhost>
References: <20130801093656.GA12455@elgon.mountain>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130801093656.GA12455@elgon.mountain>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Patrick McHardy <kaber@trash.net>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "David S. Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Aug 01, 2013 at 12:36:57PM +0300, Dan Carpenter wrote:
> These structs have a "_pad" member.  Also the "phw" structs have an 8
> byte "hw_addr[]" array but sometimes only the first 6 bytes are
> initialized.

Applied, thanks.

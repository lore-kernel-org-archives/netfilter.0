From: Matthias Hopf <Matthias.Hopf@informatik.uni-stuttgart.de>
Subject: Re: Strange paket loss on trivial NAT configuration...
Date: Wed, 28 May 2003 01:06:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030527230648.GA14601@vismail.informatik.uni-stuttgart.de>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D11@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D11@wardrive.citadelcomputer.com.au>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: George Vieira <georgev@citadelcomputer.com.au>
Cc: netfilter@lists.netfilter.org

On May 28, 03 08:19:40 +1000, George Vieira wrote:
> I believe the problem you MAY be experiencing is an MTU problem.. you can lower it's value and it'll probably fix your problem.

I can't believe it, but this seems to fix the problem...
Of course, I can only be sure after a couple of days (as sometimes the
problem went away by itself :P ). But I'm quite optimistic so far.

Thanks again :)

Matthias

-- 
Matthias Hopf - Visualization and Interactive Systems Group    \  |  |  /--
                  University of Stuttgart,                      \ |  |   \
       Universitaetsstr. 38, 70569 Stuttgart, Germany            \|  |  --/
Phone +49-711-7816-404    Fax -340          mat@mshopf.de     www.mshopf.de


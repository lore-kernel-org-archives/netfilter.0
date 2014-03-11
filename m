From: Phil Oester <kernel@linuxace.com>
Subject: Re: Syn Flood and DDoS Protect
Date: Tue, 11 Mar 2014 08:24:34 -0700
Message-ID: <20140311152433.GA28517@home>
References: <CAB0UdF1KjZtOiddUGq8sOKkVWs6BLJ1rfb5CVfdknjvpDw7Z6g@mail.gmail.com>
 <20140311121932.2f3eda9d@brouer.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140311121932.2f3eda9d@brouer.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesper Dangaard Brouer <netdev@brouer.com>
Cc: Thiago Oliveira <cpv.thiago@gmail.com>, netfilter@vger.kernel.org

On Tue, Mar 11, 2014 at 12:19:32PM +0100, Jesper Dangaard Brouer wrote:
> And extra (not in slides) is that I recently optimized conntrack
> new-and-del operations, by implementing "parallel" locking.  These
> changes will appear in kernel 3.14.

ITYM 3.15.

Phil

From: Stephen Hemminger <shemminger@vyatta.com>
Subject: Re: rx interrupt in userspace
Date: Tue, 20 Apr 2010 11:00:03 -0700
Message-ID: <20100420110003.29685143@nehalam>
References: <p2mcfeab66d1004201031u233ce827w8874c7ecf45575f6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <p2mcfeab66d1004201031u233ce827w8874c7ecf45575f6@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, 20 Apr 2010 23:01:38 +0530
ratheesh k <ratheesh.ksz@gmail.com> wrote:

> Hi ,
> 
>  When flooding of network  packets happens on network card  ,  my
> linux embedded box becomes unrepsonsive because softirq_rx eats up
> hell a lot of CPU . I want  top half of tx interrupt to be in User
> space . I want to implement some alogoritm in userspace  to drop
> packets on high flooding and to keep other processes's some cycles .
> 
> Could you guide me a little on this , any online turorials or articles
> or books , i can refer ?
> Any similar implementation like this ?
> 

If your driver used NAPI, then it would not do this.

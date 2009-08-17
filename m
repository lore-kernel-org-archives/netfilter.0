From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: qos and iptables
Date: Mon, 17 Aug 2009 13:33:45 -0400
Message-ID: <1250530425.6428.10.camel@jaspav.missionsit.net.missionsit.net>
References: <cfeab66d0908170909s7e223506g891bb405dd313343@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cfeab66d0908170909s7e223506g891bb405dd313343@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, 2009-08-17 at 21:39 +0530, ratheesh k wrote:
> Hi ,
> 
> 
> 
> 
> lan
>                                                 wan
> ---------------------------->              eth0
> --------------------------------------------> eth1
> --------------------------------->
> 
> suppose a packet is  going  from lan to wan .  First it will go
> 
>  prerouting chain -----> forward ---> postrouting   chain
> 
> 
> 
> 
> i want to know when qos rules on both interfaces will be executed with
> respect to iptables chain  ?? .  forward chain  will be executed after
>  qos rules on eth0 is executed , ????<snip>

Hello, Ratheesh.  I've hesitated to answer because I am not an expert on
this subject but I see the list has been quiet today.

How are you establishing the QoS handling? I'm not sure if the process
varies if you set up a custom handler using tc (or at least I believe it
is tc).  Our setup uses the default pfifo_fast packet queueing.  In that
case, we are setting the ToS bits or DSCP bits using the PREROUTING
chain of the mangle table. 

But I gather that is not really what you are asking.  I think you are
asking, if packet A enters netfilter processing followed by packet B and
packet B is set to be prioritized ahead of A by whatever method - ToS
bits, packet marking - will B go through the filter table first or will
A.  Is that correct?

If so, I do not know the answer but you can probably find out with some
creating logging.  Set up a log rule in the very beginning of your
filter table.  Send a mix of prioritized and non-prioritized packets and
see in which order the log records them.  Kindly post your results to
the list as I am curious now that you have asked the question :-)

Hope this helps - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

http://www.spiritualoutreach.com
Making Christianity intelligible to secular society


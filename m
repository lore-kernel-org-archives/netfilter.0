From: "Jee J.Z." <jz105@york.ac.uk>
Subject: Re: ip_queue_maxlen
Date: Fri, 7 May 2004 17:57:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003701c43454$6326a230$68892090@grouse>
References: <OFF3757E9C.8AD303A0-ON65256E8D.00226C14@hss.hns.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: aksingh@hss.hns.com
Cc: netfilter@lists.netfilter.org

Hi Amit,

Please check this out:

line 32, 53, and 72 in /usr/src/linux/net/ipv4/netfilter/ip_queue.c.

I'm not sure this is what you want, but hope it helps a bit.

Jee


> hi,
>
>  Whats the maximum number of packets that are queued by ip_queue for the
> user space to handle ... is it 1024 as defined in
> /proc/sys/net/ipv4/ip_queue_maxlen ? That is a max of 1024 packets are
> queued by the kernel, and can we change this value somehow ?
>
>
> thanks
> Amit
>
> "DISCLAIMER: This message is proprietary to Hughes Software Systems
Limited
> (HSS) and is intended solely for the use of the individual to whom it is
> addressed. It may contain  privileged or confidential information and
> should not be circulated or used for any purpose other than for what it is
> intended. If you have received this message in error, please notify the
> originator immediately. If you are not the intended recipient, you are
> notified that you are strictly prohibited from using, copying, altering,
or
> disclosing the contents of this message. HSS accepts no responsibility for
> loss or damage arising from the use of the information transmitted by this
> email including damage from virus."
>
>
>



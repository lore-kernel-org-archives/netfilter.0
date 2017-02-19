From: Robert White <rwhite@pobox.com>
Subject: Re: Can I ask Conntrack to send stats my to own process instead of
 dumping to /var/log/conntrackd-stats.log?
Date: Sun, 19 Feb 2017 04:42:21 +0000
Message-ID: <7b8fac34-1514-833a-a230-18f0a723e9e2@pobox.com>
References: <CAOr=3U_Sbz0n9tYAwN5bo6-BLLy1OR8cYy74X3LpZJJNx_DkCg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAOr=3U_Sbz0n9tYAwN5bo6-BLLy1OR8cYy74X3LpZJJNx_DkCg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Darshan Ghumare <darshan.ghumare@gmail.com>, netfilter@vger.kernel.org

On 02/17/17 06:36, Darshan Ghumare wrote:
> Hello,
>
> Is there a way wherein I can get the stats into my own custom process
> so that it can process it in memory? Currently, I need to parse it
> from /var/log/conntrackd-stats.log, which is written on disk.
> Please help.

Are you actually using conntrackd for mult-node coordination or just for 
this one log?

You _probably_ want to be monitoring /proc/net/nf_conntrack and maybe 
/pro/net/nf_conntrack.expect if that's important.

There's also the netlink domain CONFIG_IP_NF_CONNTRACK_NETLINK that a 
priveliged process can subscribe to.

Check the plentiful documentation on this topic online for formats and 
usages.




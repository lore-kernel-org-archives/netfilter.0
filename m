From: Pandu Poluan <pandu@poluan.info>
Subject: Re: How can I make iptables accept SMB UDP packets from/to UDP ports
 137 and 138?
Date: Mon, 28 Mar 2011 12:26:56 +0700
Message-ID: <AANLkTinjZc-NZGj3csGMo5Ud2ZWVKa=UHu9F7c-338FW@mail.gmail.com>
References: <63109.45424.qm@web120317.mail.ne1.yahoo.com>
	<63967.71596.qm@web120301.mail.ne1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <63967.71596.qm@web120301.mail.ne1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: crocket <crockabiscuit@yahoo.com>
Cc: netfilter@vger.kernel.org

On Mon, Mar 28, 2011 at 11:27, crocket <crockabiscuit@yahoo.com> wrote:
>
> linux 2.6.38 already has nf_conntrack_netbios_ns which is the NetBIOS helper
> module.
> If I modprobe nf_conntrack_netbios_ns, broadcast name query reply packets are
> recognized as RELATED packets.
> It seems the module was already existent in 2006.
>
>
>
> ----- Original Message ----
> From: crocket <crockabiscuit@yahoo.com>
> To: netfilter@vger.kernel.org
> Sent: Mon, March 28, 2011 12:05:23 AM
> Subject: How can I make iptables accept SMB UDP packets from/to UDP ports 137
> and 138?
>
> I want iptables accept SMB UDP packets in a subnet.
> When samba uses SMB protocol,
> it sends out name queries as broadcast packets from high number random UDP
> source ports to 137 or 138 UDP port on remote hosts on the same subnet.
> Since reply packets to the broadcast packets don't come from the broadcast
> address for the subnet,
> iptables can't categorize reply packets as ESTABLISHED,RELATED with state match
> module.
> I need some helper module to make iptables recognize them as RELATED.
> Does anybody know where to find SMB Helper module?
>

Ah, I see.

Then I stand corrected.

Rgds,
--
Pandu E Poluan
~ IT Optimizer ~
Visit my Blog: http://pepoluan.posterous.com

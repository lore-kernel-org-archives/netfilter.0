From: "Josh Berry" <josh.berry@linknet-solutions.com>
Subject: Re: Modify packets using netfilter
Date: Sun, 14 Dec 2003 19:14:02 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1208.192.168.111.202.1071450842.squirrel@mail.linknet-solutions.com>
References: <007101c3c190$0b3d6450$cb0210ac@jz105>
    <200312131549.45158.Antony@Soft-Solutions.co.uk>
    <007d01c3c198$873df440$cb0210ac@jz105>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <007d01c3c198$873df440$cb0210ac@jz105>
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
To: "Jee J.Z." <jz105@york.ac.uk>
Cc: netfilter@lists.netfilter.org

Snort-Inline is able to do this: http://snort-inline.sourceforge.net.  You
can have it modify (it calls it replacing) packets.  The main caveat to
this is that you have to replace data with the same amount of data
example:

Replacing the string "hacker" with "hack" would not work.

> Hi Antony and all,
>
> Thanks for your reply. What I am trying to do is to get the whole packets
> including their payloads and store them into a self defined queue, and
> randomly modify some bits in each packet. I am using iptables userspace
> programming. Does anybody have some good idea how to achieve this? Thank
> you.
>
> Regards,
> Jee


Thanks,
Josh Berry, CTO
LinkNet-Solutions
469-831-8543
josh.berry@linknet-solutions.com



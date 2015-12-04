From: Scott Bronson <bronson@rinspin.com>
Subject: Packet disappears after DNAT?
Date: Fri, 4 Dec 2015 01:43:36 -0800
Message-ID: <CAKmUPx5_sDgRSUQuZmXoCxPnuN3Z0q4df5XECvR7gzY6F3gpDA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rinspin-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=6VAY0OjpnRYetUc1me3fBXAjGeq7HtVFn8p7E2C4aSk=;
        b=HO09N1J93b4O7yMF/5IQsCTD90VPovaSBRiqOC5NvosOgPXb9khu5ybK5P3Dyr6DqJ
         zkt+CTd6ch+ekqz/TEA5sHWs3bTpDVOT4BCF+C8/RbQcBnta8ouN18lKwTk46TUgKr4J
         P10W09kuWazPAgOWtSUzZohqjjXjsTksLkJejUP71EiRy0oV9fc/wOxxhMfdmgHqvp7p
         19nxyQbSguPfEaWkGoCAGCWm/XujhXnzYKe+xvL+onaNvrpMhJ+xpODoGqDspJ8dtHf3
         0JnnlyUuhixgqT7tYTt5LoNpVwt412ZhDPSlNI+9Bn8K2M91rHF2JxPCIuTq84bOFN0I
         5FmA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Is there any reason for a packet to just disappear when it gets
DNATed?  (other than rp_filter, which is disabled)


Background:

I have a typical libvirt setup, where VMs share a private network,
and the host masquerades them onto the internet.

In addition, the host is forwarding port 25 to a VM using DNAT.


The Problem:

I log into the VM and try to connect to port 25 on the host's public
IP.

  $ ncat u32.net 25

On the VM, that command just times out.  It works from the internet
and on the host (thanks Noel).

Logging demonstrates that the VM sends the packet to the host just fine.
Then, after the host DNATs it, it just disappears.  I would expect it to
get routed back to the VM.


More Details:

The VM creates the packet: src=192.168.122.10:23456 dst=173.233.67.174:25

  * it arrives on the host's raw:PREROUTING
  * it moves to mangle:PREROUTING
  * it then goes to nat:PREROUTING
    * Rule 5 DNATs the destination to 192.168.122.10

And that's it!  Nothing more happens, the packet is gone.


Here's my research with tables and traces:
  https://gist.github.com/bronson/c857a462edb0c6eeab2d

Can anyone tell me what to look at here?  I'm stumped.

    - Scott

From: Ross Boylan <rossboylan@stanfordalumni.org>
Subject: netfilter and virtual machines
Date: Mon, 6 Dec 2021 11:46:24 -0800
Message-ID: <CAK3NTRAwsMGyYQNf9DkuQxgQRp+dYk7TSgykzfs3EDRmRysmyw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

What hooks are relevant, from the standpoint of the host, for traffic
to, from, and between virtual machines?

I suppose the answer might vary with the identity of the other
endpoint, which might be the host itself, another virtual machine,
another machine on my local network or another machine on the public
internet.

I do see https://wiki.nftables.org/wiki-nftables/index.php/Bridge_filtering
on filtering bridges, which I am using.  But would packets on the
bridge go through both the bridge filters and the filters on the
underlying physical device that is part of the bridge?

As an example, a packet comes from outside destined for a VM.  On the
host, does that mean that the forward hook will be triggered, because
it's being passed on to a "different" machine, or the input hook,
since the target is just a process on the host?

The VMs are running under KVM with libvirt, using some bridged
networking and some of libvirts default NAT based virtual networking.
libvirt also has a bunch of options for specifying network filters
https://libvirt.org/formatnwfilter.html; on a quick read they are
about setting up filters inside the VM's.

I also have docker.

Thanks.
Ross Boylan

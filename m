From: Tom Horsley <horsley1953@gmail.com>
Subject: how do I block NAT for a ranges of IPs?
Date: Wed, 28 Dec 2011 10:55:06 -0500
Message-ID: <20111228105506.0d5fa61e@zooty>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=date:from:to:subject:message-id:x-mailer:mime-version:content-type
         :content-transfer-encoding;
        bh=1wL0I7kJHNV27ZPmgnUmQv6cn49EWzqNyljHFToEKvo=;
        b=O59zWvykR/ARiSQvW9gAvl/4HzKvyCybiMsMb9I9Of8+kuUO9q1Lz8CRocaGtOTsPF
         sOTKSSS+6Y42h/PCp0hmZZ21LRNq569uEA2BJagEpnPCct+gjPfp4v0wyW0/SDbO7qq/
         WDlYBnDd/XIhqFEcbQuPbcKtr5+D/OghF46QM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have a KVM virtual machine I would like to totally isolate from
my local LAN. I've told libvirt to use a separate bridge for this
KVM and I've setup NAT routing for the separate bridge so the
KVM can get to the outside world. That all works.

Now I want to figure out how to block any attempt from the
KVM to get to my LAN, and my LAN (other than what is required
for the NAT forwarding to continue working :-) from getting to
the KVM.

In my setup "br0" is the bridge that the physical interface
and all my "normal" KVMs are attached to. It uses the
192.168.100.0/24 address range.

The "bifrost" bridge is not connected to a physical interface.
I have assigned it address 10.10.10.1 and the KVM I want to
isolate uses it as a gateway and has static IP 10.10.10.2.

Here are the commands that do indeed seem to setup a working
NAT for the KVM.

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o br0 -j MASQUERADE
iptables -A FORWARD -i br0 -o bifrost -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i bifrost -o br0 -j ACCEPT

Bearing in mind that I mostly cut & paste iptable rules and
can only partially understand the stuff I read in the iptables
man pages and wot-not, is anyone willing to tell me exactly
what to change/add to prevent the KVM connected to bifrost
from talking to my local LAN and vice versa? (I have a
feeling I could understand the rules if someone told
me what they should be, but absorbing everything
in the man page then deducing what I need to do is beyond
my poor brain :-).

Tanks in advance for any help.

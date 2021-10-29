From: Philip Prindeville <philipp_subx@redfish-solutions.com>
Subject: Iptables, et al best practices for protecting KVM host sharing
 "hostdev" (ixgbe-vf) interfaces with guests
Date: Thu, 28 Oct 2021 18:31:05 -0600
Message-ID: <6B834239-0EC5-497F-9E1E-00972F712CF4@redfish-solutions.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: libvirt-users@redhat.com

Hi,

I'm a developer and I use VM's for testing patches before submitting them (for various linux-* projects, as well as downstream things like OpenWrt, EPEL, etc).

I have a trunked 10Gb/s Ethernet connection coming into my KVM servers (all of which are Supermicro x86_servers running CentOS 8) that have igb and ixgbe NIC's, so SR-IOV capable.

Here's the situation:

* the host is on a secured internal network, called "sandbox", which is VLAN 4.

* the "external" network (i.e. public facing on my ISP) is "dirty", and is VLAN 66.

* the main subnet that laptops, WAPs, desktops, etc. sit on is "main", and is VLAN 1.

The KVM hosts sit wholly inside "sandbox".

They host, however, several guests some of which sit on "main", and some of which sit on "main" and "external" (for instance, if I'm testing an OpenWrt firewall configuration with patches and it needs to be publicly accessible so that my testers can peer with it via IPsec).  Oh, and one production guest which hosts "git" and sits only on "sandbox".

Guests can be CentOS 8S, Windows 11, Ubuntu 20, Debian whatever, Fedora 33 or 34, OpenWrt, etc.

My question is this: what's best practices for making sure that a switch VLAN misconfiguration issue, a cabling to the wrong port, etc. doesn't compromise the KVM server itself?

How do I allow my KVM server to *not* be on "external", but some of its guests to be, without compromising security?

Being the paranoid sort, I'd like to use defense-in-depth so I'm not counting on any single step to protect me.

For instance, I might use ebtables or iptables rules to block VLAN traffic on hosts/guests that I don't want to see certain VLAN's under any circumstances.

But I might also add interfaces to the list of things that NetworkManager ignores as /etc/NetworkManager/NetworkManager.conf lines like:

[keyfile]
unmanaged-devices=interface-name:eno*,except:interface-name:eno1
unmanaged-devices=interface-name:enp*

Thinking about that, I'm wondering what the notation is for telling NetworkManager to ignore all interfaces except those on VLAN 3, for instance.  Would that be:

unmanaged-devices=interface-name:eno*.*,except:interface-name:eno*.3

Or something else?

And what else can I do to further secure my KVM host?

I thought about using one untagged (non VLAN'd) Ethernet for the host, and another tagged Ethernet for the guests, but that just seemed like a false sense of security...

Apologies for the cross posting... these questions seems to touch on iptables, libvirt, and NetworkManager all at the same time...

Thanks,

-Philip


From: Benno <b.ohnsorg@freenet.de>
Subject: Re: Iptables, et al best practices for protecting KVM host sharing
 "hostdev" (ixgbe-vf) interfaces with guests
Date: Fri, 29 Oct 2021 09:22:24 +0200
Message-ID: <64ece4e5-0b62-0d0b-b8f3-5f7ee7c74bd0@freenet.de>
References: <6B834239-0EC5-497F-9E1E-00972F712CF4@redfish-solutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
         s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=fOrolZlNJsP1v3TuZmnFnXIFbiI9FOyxN1h/af256A0=; b=rzHGLuaLzxuxSnbTXIOWtxrtBc
        fgqj5GyfQmFl3eEqqyTefXUe450EL5wdnAtZ3AlGnKVUqtR5EXBu6KG9hqVGzmDmNawN4iGDjOfFx
        IFKfxipsTEeZOSamgIGCzX7NSuV7qPEAsDuWGGB9sBz1DW9FmLhPwu5TkXuuqsqwEO2eCcujbxf/O
        3GsAkEKq5I8J4aGMgxT5BaP2Wd35on1uB9uc5fEmc7RWdJXArH8gGJ/nJdebxJXWgPdbFiw8hc7F4
        a2HwZFbqSZEQDxRMuIZM3Mqvjhp6sautmc7zvnTchDXN7t9T6EYeXv4eGdPB2yEBXHCmV40tYiXda
        1w 
In-Reply-To: <6B834239-0EC5-497F-9E1E-00972F712CF4@redfish-solutions.com>
Content-Language: de-DE
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Philip Prindeville <philipp_subx@redfish-solutions.com>, netfilter@vger.kernel.org
Cc: libvirt-users@redhat.com

Am 29.10.21 um 02:31 schrieb Philip Prindeville:
> Hi,
> 
> […]
> 
> 
> Here's the situation:
> 
> * the host is on a secured internal network, called "sandbox", which is VLAN 4.
> 
> * the "external" network (i.e. public facing on my ISP) is "dirty", and is VLAN 66.
> 
> * the main subnet that laptops, WAPs, desktops, etc. sit on is "main", and is VLAN 1.
> 
> The KVM hosts sit wholly inside "sandbox".
> 
> They host, however, several guests some of which sit on "main", and some of which sit on "main" and "external" (for instance, if I'm testing an OpenWrt firewall configuration with patches and it needs to be publicly accessible so that my testers can peer with it via IPsec).  Oh, and one production guest which hosts "git" and sits only on "sandbox".
> 
> Guests can be CentOS 8S, Windows 11, Ubuntu 20, Debian whatever, Fedora 33 or 34, OpenWrt, etc.
> 
> My question is this: what's best practices for making sure that a switch VLAN misconfiguration issue, a cabling to the wrong port, etc. doesn't compromise the KVM server itself?
> 
> How do I allow my KVM server to *not* be on "external", but some of its guests to be, without compromising security?
> 

How is this supposed to work? How does the server present network
connectivity to the guests? If the guests would directly bind to the
hardware jumping over the VM server what's the use of the VM then? (If
any of the systems in this stack does not bind services to the
particular network device it is not reachable through this network. As
soon as for example sshd is configured to bind to all network devices it
is accessible through any of them available to the VM.)

Regarding the switch: think of port duplication on the switch routing
all the traffic to a masked hoody wearing laptop owner. How can the
guest or host find out?

Wrong patching of the cables running virtual LANs (VLAN, multiple
networks over the same cable) leaves them intact (from your VMs point of
view)? I assume VLAN-configuration is per physical port? Adapting this
to VLAN misconfiguration puts your VLAN onto a different port that is
not yours? If it is instead of per port a tagging variant and link
aggregation is possible than how should you detect – except through
bandwidth measurement/ service monitoring (connection reset/ congestion
control) – that 4 planned links were reduced to 2?

It is very likely I got your scenario wrong. But unless you cannot trace
the hops and latency between origin of traffic and endpoint in your VMs
you cannot detect configuration changes/ wrong configuration. (If it is
the latter no connection at all is very likely.)

> I have a trunked 10Gb/s Ethernet connection coming into my KVM servers (all of which are Supermicro x86_servers running CentOS 8) that have igb and ixgbe NIC's, so SR-IOV capable.
> […]
> Being the paranoid sort, …
Just as a side and purely my personal opinion: CentOS seems not the best
choice to cure paranoia of the IT type. I also read NetworkManager as
your tool of choice. I am concerned with systems favoring an end user
targeted abstraction layer over hardened configuration. BSD flavors rely
on text files. From this basic layer you stack additional configuration
on each layer to connect VMs, workloads and so on being aware of the
necessary and possible routes. (I sometimes include dead-man-switches
when changing configs so if my ssh session is blocked by
misconfiguration it reverts to the previous state after a certain time
period.)

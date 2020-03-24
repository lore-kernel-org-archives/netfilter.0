From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: A question about priority in chains
Date: Tue, 24 Mar 2020 08:20:51 -0400
Message-ID: <e43d85e0-0a1c-05b8-d1b4-bed6bdcbe6a2@fhmtech.com>
References: <62b3a8f8-d0ae-bac1-c0f1-54f19ee3d31f@mailbox.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject; bh=WsGq4zkBN4AscMel8S4njqiMnfp2V+TCQYBRPIrdWZc=;
        b=H8wG5Zv735wLlfEmD2yWPWigDshUqi6C8CYuNUEwhZ0CptPCEuaPchD8teTu/W1/oHUMqc/1c2LJw90pJcGW219TeUWgxhbiMiN9RxUKjQdJXv2Xf/O6lhOeEPiHW4IL8IZ0k3GDzmlbZF6DrNAsSTOvKbDN+xL1vkFTbtOJM9Q=;
In-Reply-To: <62b3a8f8-d0ae-bac1-c0f1-54f19ee3d31f@mailbox.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: darius <dram@mailbox.org>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi Darius,

On 2020/03/23 15:48, darius wrote:
> Hi all,
> 
> I'm still studying a bit of nftables and got confused about priority
> value in chains. Manual says:
> 
> priority refers to a number used to order the chains or to set them
> between some Netfilter operations. Possible values are:
> NF_IP_PRI_CONNTRACK_DEFRAG (-400), NF_IP_PRI_RAW (-300),
> NF_IP_PRI_SELINUX_FIRST (-225), NF_IP_PRI_CONNTRACK (-200),
> NF_IP_PRI_MANGLE (-150), NF_IP_PRI_NAT_DST (-100), NF_IP_PRI_FILTER (0),
> NF_IP_PRI_SECURITY (50), NF_IP_PRI_NAT_SRC (100), NF_IP_PRI_SELINUX_LAST
> (225), NF_IP_PRI_CONNTRACK_HELPER (300).
> 
> So, if I use hook "prerouting" and priority -150, then I will be in
> "Prerouting Mangle" chain acc. to Netfiler packet flow. If I will use
> hook "prerouting" and priority -100, then I will be in "Prerouting NAT"
> chain and so on. All clear.
> But what will happen if I use hood "filter" and priority -150, for
> example? There is no chain "Filter Mangle" according to Netfilter packet
> flow. I'm quite sure that combination of hook "filter" and priority -150
> will work, but does it have any sense?

Actually this will not work; there is no "filter" hook.

Relevant wiki pages:

https://wiki.nftables.org/wiki-nftables/index.php/Main_differences_with_iptables

https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains

https://wiki.nftables.org/wiki-nftables/index.php/Quick_reference-nftables_in_10_minutes#Chains

https://wiki.nftables.org/wiki-nftables/index.php/Netfilter_hooks
* Good diagram of netfilter hooks for families ip, ip6 and inet:
	prerouting, forward, input, output and postrouting
* arp family has only input & output hooks.
* netdev family has only ingress hook.
* bridge family has hooks: ???

As I understand it, the above hooks always exist, and are used by 
connection tracking and routing. At each hook, nftables packet filtering 
happens only if you hook a base chain there. The numerical priority you 
assign your base chain affects the order in which netfilter operations 
happen *on that hook only*.

If you create 2 base chains:

nft add chain ip some_table INPUT_NEG150 { type filter hook input 
priority -150 \; }

nft add chain ip some_other_table INPUT_0 { type filter hook input 
priority 0 \; }

then ipv4 packets at the input stage of processing will traverse chain 
INPUT_NEG150 before they hit chain INPUT_0. If instead of -150 you'd 
assigned priority -1 to INPUT_NEG150 this would still be true. The 
absolute priority numbers do not matter, only their numerical order 
within the same hook matters. If you have two base chains at same hook 
with _same_ priority... I don't know what happens! Probably best to 
avoid that. Even if deterministic, it would still be confusing to us 
ugly bags of water (obscure Star Trek reference, sorry).

Hope this helps (and that it's correct),
Frank

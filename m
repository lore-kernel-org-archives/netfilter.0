From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: best distro to build iptable firewall
Date: Wed, 23 Dec 2015 18:06:30 -0500
Message-ID: <20151223180630.61b8d238@playground>
References: <CAPgF-fpEK=-AuP5Mtqddkgh2U8BMC8hKVb_2Mt7MJQNJ4cu8wg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 MAIL1.WPI.EDU tBNN6Xw8001357
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wpi.edu; s=_dkim;
	t=1450911993; i=@wpi.edu;
	bh=3vkH5OOJtHRp4cKGdNi1wzZYs1Q5Wn6fsnW8AayY/rQ=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=HvRh1P7QqO7QF43q2ju6x8oofjhdfwrXgLrdi5qqofgQzaPAykjBNO0tmI9juMZE4
	 za//LrjW1F86No2qFqF1cYi+j9HinbkyiD3JaWG74I3thplK1JPTKwHT3VfYWSRkkC
	 MmTqFjEEeNjCdH/h/D4pJVLXkriNG6KUQEpImUok=
In-Reply-To: <CAPgF-fpEK=-AuP5Mtqddkgh2U8BMC8hKVb_2Mt7MJQNJ4cu8wg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Wed, 23 Dec 2015 15:29:17 -0500
Satish Patel <satish.txt@gmail.com> wrote:

> All,
> 
> I am planning to build dedicated firewall for network and wonder which
> OS will be idle and best for dedicated firewall machine?
> 
> Its going to handle around 500mbps traffic peak.. so i need something
> solid and secure, which won't crash...

(I know this sounds like an advertisement, but Satish *did* ask. And I *am* working to integrate the just-released iptables v1.6.0.)

If you intend to filter SSL (via MITM), HTTP, HTTPS through clamav, filter URLs for 'appropriateness', and run Snort to identify incoming threats, *at 500Mb/s*, you will need at least 2GiB of fairly fast RAM and a fast quad-core CPU.

You don't need to build a dedicated firewall. Smoothwall Express v3.1 is already available:
  - i586 or x86_64
  - SMP
  - web-based UI
  - linux v3.4.110
  - iptables v1.4.21
  - ipset v6.19
  - gcc v4.7.3
  - glibc v2.18
  - binutils v.2.22
  - runs snort, clamav, squid
  - as a plain firewall, easily handles 4 NICs at constant 950Mb/s on a
    dual-core Atom N270. (clam/ids/squid filtering is a different story.)
  - improved build system makes it easy to add pkgs
  - script-based 'advanced installer' make it easy to hack and debug
    installation problems
  - hooks to make many mods 'non-invasive'

Except for a stupid mistake on my part (I introduced a memory leak when I converted iptACCOUNT to 64-bit counters), v3.1 has been very stable.

I'm presently working on v3.2 preliminaries:
  - linux v3.14.58
  - iptables v1.6.0
  - ipset v6.27
  - eudev v3.1.5
It just built and the iso/flash images assembled. It installed and booted (in a KVM) without trouble. So far, the firewall seems OK. But I do expect to encounter a few incompatibilities with iptables v1.6.0. 

We're working to overcome years of development neglect. I spent five years improving the build system, modernizing Express' 'foundation', polishing the UI a little bit, and stumbling upon and fixing many little bugs from the original v3.0; v3.1 was the result. Somewhere in there, I was appointed project leader. There is still room for improvement in the UI and in the features; this will be the main focus during 3.2's development.

Unless it's a learning exercise, if you want to save yourself a lot of time and trouble, visit us at http://community.smoothwall.org.

Neal

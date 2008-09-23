From: "Anton V. Antonenko" <moodperson@majorov.net>
Subject: Re: IPSEC VPN Pass-Through/Nat-T Help Needed
Date: Tue, 23 Sep 2008 06:56:20 +0300
Message-ID: <34ecc2db0809222056y5bc2a12fg1c94e4af6ebe3e8a@mail.gmail.com>
References: <48D7FBA5.70402@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48D7FBA5.70402@gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,
IPSec does not work after NAT.
You must use NAT-T. see of http://en.wikipedia.org/wiki/NAT_traversal

2008/9/22 Kristopher L. Bachtal <kbachtal@gmail.com>:
> Hello,
>
> I have a Fedora Core 5 machine running kernel 2.6.20-1.2320 and
> iptables/netfilter acting as a gateway/Nat for a private network to the
> internet. I have several client machines (aprox. 10, Running Windows XP)
> that are behind this router that need to create individual IPSec VPN
> (Cisco IPSec Software Cleint)connections over the internet to a Cisco
> VPN Concentrator (Diagram Below). I can only seem to get one client at a
> time to work. If I try to start a second VPN connection from another
> machine it connects to the VPN Concentrator but will not carry any data.
> (i.e. Cant ping, traceroute, etc.) I'm thinking I need some type of
> connection tracking kernel module for IPSec Connections (like
> nf_conntrack_ftp but for Ipsec instead of FTP) but I cant find any
> reference to one in the documentation or google searches that I have
> done. Any help would be greatly appreciated.
>
> Clients(10) --> Gateway/Nat     --->    Internet  --->  Remote Network
> (Windows XP)    (Fedora Core 5)                         (Cisco VPN Box)
> Private IP      Private IP / Public IP                  Public IP

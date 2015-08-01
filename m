From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: failure to set up a "simple" rule-set to get an ssh connection
 through to a KVM/qemu guest
Date: Sat, 1 Aug 2015 11:05:42 -0400
Message-ID: <20150801110542.1d044f49@playground>
References: <55BC821C.3030006@liwest.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <55BC821C.3030006@liwest.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: azteca <azteca@liwest.at>




On Sat, 01 Aug 2015 10:23:56 +0200
azteca <azteca@liwest.at> wrote:

> 
> Good day, Ladies and Gentlemen!
> 
> If I might politely ask you, to assist an utter noob to the subject of
> iptables  with the following issue:
> 
> Currently, I am in the process of setting up a KVM host with several
> virtual machines, each of them has an own public IP.
> That means, that four different IP-addresses are being routed to the
> host's eth0.
> 
> What I am trying to achieve, is to let the host have one IP, under which
> it is reachable, and to forward each of the remaining three addresses,
> each with an own DNS record, to one of three according KVM guests via NAT.
> 
> What I have accomplished so far, is the following:
> .) The KVM host is reachable per ssh through an enabled net-filter,
> whose INPUT and FORWARD policy are otherwise set to DROP. That the
> net-filter does work properly, is verifiable through /var/log/messages.
> .) The KVM host is able to connect to a DNS Server properly.
> .) The KVM host can send mails via nullmailer.
> .) Also could I set up a KVM guest with Debian 8.1 Linux per
> net-install, meaning, the installation inside the virtual machine was
> able to reach the source mirrors from a minimal start-up CD-image, and
> to download the missing installation packets from there.
> 
> What I am failing with, is, to connect to the single first setup KVM
> guest in which ever way.

You may have overlooked:
  echo 1 > /proc/sys/net/ipv4/ip_forward

Without that, your system won't route packets.

From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Packets being reflected back from firewall unintentionally...
Date: Tue, 28 Apr 2015 13:02:47 +0200
Message-ID: <553F68D7.7060805@chello.at>
References: <CANDZmsURcr3k3msVhHe4ZUrHEW_B8kbHHNMom_uByWPcr2eoKA@mail.gmail.com>
Reply-To: mart.frauenlob@chello.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CANDZmsURcr3k3msVhHe4ZUrHEW_B8kbHHNMom_uByWPcr2eoKA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matthew Smith <gizmosmith@gmail.com>
Cc: netfilter@vger.kernel.org

On 27.04.2015 07:03, Matthew Smith wrote:
> I have a 192.168.1.14 host behind a linux firewall with ip
> 192.168.1.1.  The interface of the firewall facing the internet is
> "em1" and the private interface is "p1p1"
> I've enabled "masquerading" via SNAT for the whole 192.168.1/24 subnet
> with the following iptables rules:
>
> -t nat -A POSTROUTING -s 192.168.1/24 -o em1 -j SNAT --to (MY_PUBLIC_IP)
> -A FORWARD -i em1 -o p1p1 -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A FORWARD -i p1p1 -o em1 -j ACCEPT
>
> This works fine as all hosts in the 192.168.1/24 subnet can get out to
> the internet just fine.
>
> I opened a port forward up to an asterisk server inside the subnet to
> allow a remote asterisk server to connect to my asterisk server
> inside:
>
> $IPT -t nat -A PREROUTING -i em1 -s (REMOTE_ASTERISK_SERVER_IP) -d
> (MY_PUBLIC_IP) -p udp --dport 4569 -j DNAT --to-destination
> (PRIVATE_INTERNAL_ASTERISK_IP)
> $IPT -A FORWARD -s (REMOTE_ASTERISK_SERVER_IP) -p udp --dport 4569 -j ACCEPT
>
> So, the remote asterisk server can connect in just fine.  Packets
> coming from it to my asterisk server are handled perfectly accoridng
> to tcpdump.  The trouble is my internal asterisk server can't get out
> port 4569.  If it tries to send a packet to REMOTE_ASTERISK_SERVER_IP
> it gets reflected back from interface p1p1 on the firewall.  The
> packet doesn't even make it to em1 of the firewall.
>
> Here's the header of the packet leaving the asterisk server:
> Source: (PRIVATE_INTERNAL_ASTERISK_IP)
> Destination: (REMOTE_ASTERISK_SERVER_IP)
>
> This packet hits p1p1 and is immediately returned back to the internal
> asterisk server with the following header:
> Source:  (MY_PUBLIC_IP)
> Destination:  (PRIVATE_INTERNAL_ASTERISK_IP)
>
> So, both addresses are changed and the packet never gets past the
> firewall.  Any reason why this happens?


Did you load the conntrack helpers?

modprobe nf_conntrack_sip nf_nat_sip

Best regards
Mart


From: Andy Hester <andy.hester@gmail.com>
Subject: Re: Trouble with full nf_conntrack table
Date: Fri, 6 Feb 2015 13:02:12 -0600
Message-ID: <CAMSXMRaWQfmBtKCZTrK2dw52g2f37UhzyxyVAim0bB7OZzEd-g@mail.gmail.com>
References: <CAMSXMRZQGpsX2kc67ZgAUd3DLSn1iXFzg4onH6ChT+B5diBpNw@mail.gmail.com>
	<54D4FCEB.3010406@conversis.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=hkM2zC5ow2KQ6QVGeB/YsnRLrYfcHrDZL0utQTN3YyE=;
        b=W6p3eGjeEprsDzM0UNaOP2Y11L6XhNQSvKYAPwCEvM5+o4Dvm+o8+aSJnkbNphQb/r
         aQCCDnZnCV+sKRpBWtFuIf0dcEumFjJmXuVKq/Ao8rCXRLdrfpEqaip4nwTcKOcpxNcK
         UZwu+13TOWYVmnkqKvM9978J5JMSP46U0QNTxKR84hAfOM6tv7FTeG+j8Dxtc4JgOPzw
         U9HVsdvCm3DbEB8F2CESqkaf3a9LABNklPs3sZfXplKg6ccPAa8cgXtO5IDp0eFazhcE
         PoTE2bufzHN8AeaBq4GKAop2WP9Y1cTQbLOAqH/qIxBCalH+XXNK0E9DJyO/mco7rwI3
         XEkw==
In-Reply-To: <54D4FCEB.3010406@conversis.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dennis Jacobfeuerborn <dennisml@conversis.de>
Cc: netfilter@vger.kernel.org

I did save the conntrack table from the issue last night to look at today.

I found that the functioning system has ~90% of its ttls in the 50-100
range with some at 15k and some in the 54k range.

The system that is having the errors has 100% of its values at ~431k.
As far as I can tell all of the ip_conntrack values are set the same
on both systems.

Any suggestions appreciated.

On Fri, Feb 6, 2015 at 11:42 AM, Dennis Jacobfeuerborn
<dennisml@conversis.de> wrote:
> Hi,
> have you tried looking at the conntrack table?
> With a little scripting you can create stats to see for example which
> destination ports or ip's come up most often to find out what exactly is
> creating all these connections.
>
> Regards,
>   Dennis
>
> On 06.02.2015 10:27, Andy Hester wrote:
>> I have two firewalls that take evenly distributed traffic from 2
>> different internet pipes (45 MB/s each). These are bridging firewalls
>> and have been in operation for nearly 5 years.
>>
>> Recently one firewall has started giving the log message at a huge rate:
>>
>> nf_conntrack: table full, dropping packet
>>
>> The table just keeps filling up, while the other firewall remains
>> steady  ie one is steady at ~10k, and the other is full at over 65k
>>
>> I have adjusted all of the sysctl properties I can find to increase
>> max values and decrease timeouts where reasonable.
>>
>> Are there any 'gotchas' that might cause this?  I'm just not sure
>> where to look at this point.  Both machines have the same config:
>>
>>
>> net.bridge.bridge-nf-call-
>> iptables=1
>> net.bridge.bridge-nf-filter-vlan-tagged=1
>> net.netfilter.nf_conntrack_max = 786432
>> net.netfilter.nf_conntrack_buckets = 196608
>> net.ipv4.netfilter.ip_conntrack_max = 131072
>> net.ipv4.netfilter.ip_conntrack_buckets = 32768
>> net.netfilter.nf_conntrack_tcp_timeout_unacknowledged = 30
>> net.nf_conntrack_max = 786432
>> net.ipv4.netfilter.ip_conntrack_generic_timeout=120
>> net.ipv4.netfilter.ip_conntrack_tcp_timeout_established=54000
>> net.core.somaxconn=1024
>> net.ipv4.tcp_fin_timeout = 30
>> net.ipv4.netfilter.ip_conntrack_tcp_timeout_fin_wait = 60
>> net.ipv4.tcp_max_syn_backlog=1280
>> net.ipv4.tcp_keepalive_probes = 5
>> net.ipv4.tcp_keepalive_intvl = 15
>>
>> # Uncomment the next two lines to enable Spoof protection (reverse-path filter)
>> # Turn on Source Address Verification in all interfaces to
>> # prevent some spoofing attacks
>> #net.ipv4.conf.default.rp_filter=1
>> #net.ipv4.conf.all.rp_filter=1
>>
>> # Uncomment the next line to enable TCP/IP SYN cookies
>> # See http://lwn.net/Articles/277146/
>> # Note: This may impact IPv6 TCP sessions too
>> net.ipv4.tcp_syncookies=1
>>
>> # Uncomment the next line to enable packet forwarding for IPv4
>> #net.ipv4.ip_forward=1
>>
>> # Uncomment the next line to enable packet forwarding for IPv6
>> #  Enabling this option disables Stateless Address Autoconfiguration
>> #  based on Router Advertisements for this host
>> #net.ipv6.conf.all.forwarding=1
>>
>> ##############################
>> #####################################
>> # Additional settings - these settings can improve the network
>> # security of the host and prevent against some network attacks
>> # including spoofing attacks and man in the middle attacks through
>> # redirection. Some network environments, however, require that these
>> # settings are disabled so review and enable them as needed.
>> #
>> # Do not accept ICMP redirects (prevent MITM attacks)
>> net.ipv4.conf.all.accept_redirects = 0
>> net.ipv6.conf.all.accept_redirects = 0
>> # _or_
>> # Accept ICMP redirects only for gateways listed in our default
>> # gateway list (enabled by default)
>> # net.ipv4.conf.all.secure_redirects = 1
>> #
>> # Do not send ICMP redirects (we are not a router)
>> net.ipv4.conf.all.send_redirects = 0
>> #
>> # Do not accept IP source route packets (we are not a router)
>> net.ipv4.conf.all.accept_source_route = 0
>> net.ipv6.conf.all.accept_source_route = 0
>> #
>> # Log Martian Packets
>> net.ipv4.conf.all.log_martians = 0
>> #
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>

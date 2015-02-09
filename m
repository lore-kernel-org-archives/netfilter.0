From: Andy Hester <andy.hester@gmail.com>
Subject: Re: Trouble with full nf_conntrack table
Date: Mon, 9 Feb 2015 09:25:00 -0600
Message-ID: <CAMSXMRYbLaEWpDXZNHjiUC3KfPW_Hu3FcouumZjX7FMdSxmu0A@mail.gmail.com>
References: <CAMSXMRZQGpsX2kc67ZgAUd3DLSn1iXFzg4onH6ChT+B5diBpNw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=JUEb814PpRNKCgNJD8nem+miM+q6EpvKsBPaLgewRgU=;
        b=iuF50v6I0C4Ty2j6z57xs6AcButfbhNEk9bmnzHt4UipakgD4lyNmNGWlTq95g1n1P
         kCe3ikG+lpOqGX4vNGDNkDsNt1AbC+1q9E8ZkGzabWkhJcsG9AEgdx8mb/JhzPj5IL3B
         k7rOqkyUkm/sleFr5ixzbEieeI4UrZLbksk1eB0tUHps8ihPba3Xq9EaVkwR4NC59+d9
         Nv+3HockRLyei1v9jz9spaikQ82V697N83csMm4XvpL7d1bpzaaTinvJ5TbiB49gCSED
         VdA6ZePu/fTO/DIvX2d4dbTBwdJWcFPupyVTcNJZr4gx9vX5gBctgaZFn+lHkyTp4f/c
         9BYw==
In-Reply-To: <CAMSXMRZQGpsX2kc67ZgAUd3DLSn1iXFzg4onH6ChT+B5diBpNw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have a few more specific questions:

Both systems have both of these settings and sysctl reports that they are so:

net.netfilter.nf_conntrack_tcp_timeout_established = 54000
net.ipv4.netfilter.ip_conntrack_tcp_timeout_established = 54000

However one server has ip_conntrack table entries that are ESTABLISHED
counting down from 54000, and the other one has ip_conntrack table
entries that are ESTABLISHED counting down from 5 days (I believe this
is the kernel default?)

What could cause the server in question to not observe the value set by sysctl?

What is an appropriate value for a firewall that is constantly
moderately busy?  How low could you set before impacting in a way that
external users would notice?  Is there a way to determine or perhaps
anecdotal guidelines?

Thanks,
Andy


On Fri, Feb 6, 2015 at 3:27 AM, Andy Hester <andy.hester@gmail.com> wrote:
> I have two firewalls that take evenly distributed traffic from 2
> different internet pipes (45 MB/s each). These are bridging firewalls
> and have been in operation for nearly 5 years.
>
> Recently one firewall has started giving the log message at a huge rate:
>
> nf_conntrack: table full, dropping packet
>
> The table just keeps filling up, while the other firewall remains
> steady  ie one is steady at ~10k, and the other is full at over 65k
>
> I have adjusted all of the sysctl properties I can find to increase
> max values and decrease timeouts where reasonable.
>
> Are there any 'gotchas' that might cause this?  I'm just not sure
> where to look at this point.  Both machines have the same config:
>
>
> net.bridge.bridge-nf-call-
> iptables=1
> net.bridge.bridge-nf-filter-vlan-tagged=1
> net.netfilter.nf_conntrack_max = 786432
> net.netfilter.nf_conntrack_buckets = 196608
> net.ipv4.netfilter.ip_conntrack_max = 131072
> net.ipv4.netfilter.ip_conntrack_buckets = 32768
> net.netfilter.nf_conntrack_tcp_timeout_unacknowledged = 30
> net.nf_conntrack_max = 786432
> net.ipv4.netfilter.ip_conntrack_generic_timeout=120
> net.ipv4.netfilter.ip_conntrack_tcp_timeout_established=54000
> net.core.somaxconn=1024
> net.ipv4.tcp_fin_timeout = 30
> net.ipv4.netfilter.ip_conntrack_tcp_timeout_fin_wait = 60
> net.ipv4.tcp_max_syn_backlog=1280
> net.ipv4.tcp_keepalive_probes = 5
> net.ipv4.tcp_keepalive_intvl = 15
>
> # Uncomment the next two lines to enable Spoof protection (reverse-path filter)
> # Turn on Source Address Verification in all interfaces to
> # prevent some spoofing attacks
> #net.ipv4.conf.default.rp_filter=1
> #net.ipv4.conf.all.rp_filter=1
>
> # Uncomment the next line to enable TCP/IP SYN cookies
> # See http://lwn.net/Articles/277146/
> # Note: This may impact IPv6 TCP sessions too
> net.ipv4.tcp_syncookies=1
>
> # Uncomment the next line to enable packet forwarding for IPv4
> #net.ipv4.ip_forward=1
>
> # Uncomment the next line to enable packet forwarding for IPv6
> #  Enabling this option disables Stateless Address Autoconfiguration
> #  based on Router Advertisements for this host
> #net.ipv6.conf.all.forwarding=1
>
> ##############################
> #####################################
> # Additional settings - these settings can improve the network
> # security of the host and prevent against some network attacks
> # including spoofing attacks and man in the middle attacks through
> # redirection. Some network environments, however, require that these
> # settings are disabled so review and enable them as needed.
> #
> # Do not accept ICMP redirects (prevent MITM attacks)
> net.ipv4.conf.all.accept_redirects = 0
> net.ipv6.conf.all.accept_redirects = 0
> # _or_
> # Accept ICMP redirects only for gateways listed in our default
> # gateway list (enabled by default)
> # net.ipv4.conf.all.secure_redirects = 1
> #
> # Do not send ICMP redirects (we are not a router)
> net.ipv4.conf.all.send_redirects = 0
> #
> # Do not accept IP source route packets (we are not a router)
> net.ipv4.conf.all.accept_source_route = 0
> net.ipv6.conf.all.accept_source_route = 0
> #
> # Log Martian Packets
> net.ipv4.conf.all.log_martians = 0
> #

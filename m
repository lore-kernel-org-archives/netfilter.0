From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Some oddities while setting up outbound filtering on a web server
Date: Sat, 22 Feb 2014 11:37:52 +0100
Message-ID: <53087E00.2000205@chello.at>
References: <CA+5v4QDMy8_aHARhn1r2s7nF6rTfUjFBZq7B6OH9eC0NdTFpjw@mail.gmail.com>
Reply-To: mart.frauenlob@chello.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CA+5v4QDMy8_aHARhn1r2s7nF6rTfUjFBZq7B6OH9eC0NdTFpjw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Anthony Taylor <ataylor@fallsgeek.com>
Cc: netfilter@vger.kernel.org

On 21.02.2014 23:36, Anthony Taylor wrote:
> I'm attempting to set up outbound filtering on a server to satisfy
> PCI requirements.  Here is what I have so far:
>
> iptables -L OUTPUT -n --line-numbers Chain OUTPUT (policy ACCEPT)

policy of ACCEPT??? where's the filtering?
only ACCEPT rules below, you want logging only?

use output of iptables -S .... -N is bad formatting for mail. also it
needs -v to be complete like for rule #1 (guess that's for the lo iface)...

> num  target     prot opt source               destination 1    ACCEPT
> all  --  0.0.0.0/0            0.0.0.0/0 2    ACCEPT     all  --
> 0.0.0.0/0            0.0.0.0/0 state RELATED,ESTABLISHED 3    ACCEPT
> icmp --  0.0.0.0/0            0.0.0.0/0           icmp type 0 4
> ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp
> type 8 # DNS 5    ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0
> tcp dpt:53 6    ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0
> udp dpt:53 # WHOIS 7    ACCEPT     tcp  --  0.0.0.0/0
> 0.0.0.0/0           tcp dpt:43 # SMTP 8    ACCEPT     tcp  --
> 0.0.0.0/0            0.0.0.0/0           tcp dpt:25 #
> feeds.feedburner.com 9               tcp  --  0.0.0.0/0
> 74.125.0.0/16       tcp dpt:80 # akismet 10   ACCEPT     tcp  --
> 0.0.0.0/0            66.135.58.62        tcp dpt:80 11   ACCEPT
> tcp  --  0.0.0.0/0            192.0.80.244        tcp dpt:80 12
> ACCEPT     tcp  --  0.0.0.0/0            66.135.58.61        tcp
> dpt:80 13   ACCEPT     tcp  --  0.0.0.0/0            192.0.80.246
> tcp dpt:80 # ubuntu updates 14   ACCEPT     tcp  --  0.0.0.0/0
> 91.189.92.201       tcp dpt:80 15   ACCEPT     tcp  --  0.0.0.0/0
> 91.189.88.149       tcp dpt:80 16   ACCEPT     tcp  --  0.0.0.0/0
> 91.189.91.13        tcp dpt:80 17   ACCEPT     tcp  --  0.0.0.0/0
> 91.189.92.200       tcp dpt:80 18   ACCEPT     tcp  --  0.0.0.0/0
> 91.189.91.14        tcp dpt:80 19   ACCEPT     tcp  --  0.0.0.0/0
> 91.189.91.15        tcp dpt:80 20   LOG        all  --  0.0.0.0/0
> 0.0.0.0/0           LOG flags 0 level 4 prefix `fw-outbound: '
>
> My problem is I'm seeing some traffic that I'm not sure I should be
> seeing.  I get periodically some traffic from source port 80.  It's
> my understanding that rule 2 above would filter these out.  When I
> try to access the webserver I don't get anything to show up in logs.
> Yet still I'm getting entries like these:
>
> [12989577.380311] fw-outbound: IN= OUT=venet0 SRC=205.186.153.230
> DST=201.170.158.23 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP
> SPT=80 DPT=59799 WINDOW=0 RES=0x00 RST URGP=0 [12990368.808237]
> fw-outbound: IN= OUT=venet0 SRC=205.186.153.230 DST=24.153.148.198
> LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=80 DPT=55919
> WINDOW=31 RES=0x00 ACK URGP=0
>
> These usually happen in batches with a few of them for the same
> destination IP happening at once.

-m state --state INVALID -j DROP
look if they still come up...
also this might have influence:

nf_conntrack_tcp_be_liberal - BOOLEAN
         0 - disabled (default)
         not 0 - enabled

         Be conservative in what you do, be liberal in what you accept
from others.
         If it's non-zero, we mark only out of window RST segments as
INVALID.

see:
Documentation/networking/nf_conntrack-sysctl.txt

[...]

I'd suggest to use ipset for all the IPs, ie:

ipset create webservers hash:ip
ipset add webservers 91.189.92.201
and so on

iptables -A OUTPUT -m set --match-set webservers dst -p tcp --dport 80 
-m state --state NEW -j ACCEPT

Best regards

Mart

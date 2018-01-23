From: "toml@thlu.de" <toml@thlu.de>
Subject: Re: Differences in FTP-Handling (Client-Sender) between
 iptables/nftables?
Date: Tue, 23 Jan 2018 19:25:09 +0100
Message-ID: <ac81f073-8f8e-de0f-3322-5dd8787b37cf@raspi1>
References: <39761b3a-f5d8-0924-bd97-4208a24e257c@raspi1>
 <c8909477-a31e-8c8e-fa55-ad0076da2f36@trustiosity.com>
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <c8909477-a31e-8c8e-fa55-ad0076da2f36@trustiosity.com>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello

Thank you for your reply.

Am 23.01.2018 um 17:27 schrieb zrm:
> But the FTP ALG helper isn't always enabled by default. The relevant kernel module(s) must to be loaded (nf_nat_ftp or nf_conntrack_ftp). 


I've got a few more little ambiguities. Those were my "old" rules before I
started with the nftables. Exactly as you can find it everywhere on the web
as a solution:

iptables -A INPUT -p tcp --sport    21 -m conntrack --ctstate ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --sport    20 --dport 1024 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --sport  1024: --dport 1024: -m conntrack --ctstate ESTABLISHED -j ACCEPT

iptables -A OUTPUT -p tcp --dport    21 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --dport    20 -m conntrack --ctstate ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport  1024: --dport 1024: -m conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT


And when I changing from iptables to nftables, I assumed that the following two statements
in my new rules replace the former ones (for 20 and 1024:) with ctstate ESTABLISHED, RELATED:

iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT


That is why I then removed the apparently superfluous statements, which finally led to the
following NEW rules.
iptables -A OUTPUT -p tcp --dport    21 -m conntrack --ctstate NEW -j ACCEPT
iptables -A OUTPUT -p tcp --sport  1024: --dport 1024: -m conntrack --ctstate NEW -j ACCEPT


But... and this has bothered me the whole time... this OUTPUT-NEW for 1024: has here imho
only an "optically" connection to FTP. In reality, "NEW" generally means "NEW is accept",
not only for FTP. Is that correct?

If I understood your answer correctly, under 'nftables' after initializing the "Client-Send-Job"
via Port 21 the furthermore necessary data-ports are automatically treated as Related-Ports to
this OUTPUT-NEW on port 21 by the FTP-ALG-Helper, without having to open them explicitly as before
under iptables. The Follow-up-Data-Ports can be the privileged port 20, or any unprivileged port
from 1024 onwards, but they are always related to 21 by ALG.  And therefore it works for 'nftables'
with ALG-Helper if only port 21 OUTPUT-NEW is allowed. That should be the explanation, because
it works on my testmachine.

nft add rule inet filter OUTPUT tcp dport 21 ct state new accept


# lsmod | grep conntrack
nf_conntrack_ftp       20480  0
nf_conntrack_ipv6      20480  24
nf_defrag_ipv6         36864  1 nf_conntrack_ipv6
nf_conntrack_ipv4      16384  24
nf_defrag_ipv4         16384  1 nf_conntrack_ipv4
nf_conntrack          114688  4 nft_ct,nf_conntrack_ipv6,nf_conntrack_ftp,nf_conntrack_ipv4

If I have understood all this correctly, it would be perfect with nftables. Sorry, I'm a little
unsure.... and the subject is really complicated and I need some explanation in simple words
to understand it properly, because a foreign language make it not easier to me.

Thank you and best regards
Thomas

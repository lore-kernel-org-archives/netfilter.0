From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Restrictive FTP egress using conntrack helper
Date: Sun, 12 Feb 2017 15:19:40 +0100
Message-ID: <20170212141940.GA15863@salvia>
References: <20170211171431.GD31183@weiser.dinsnail.net>
 <4d8f60b9-2eb1-2baa-035d-3ac223bfbdf5@pobox.com>
 <10a85123-67f2-c323-435c-3d006ba692aa@plouf.fr.eu.org>
 <20170212123052.GD2935@weiser.dinsnail.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170212123052.GD2935@weiser.dinsnail.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Weiser <michael@weiser.dinsnail.net>
Cc: Pascal Hambourg <pascal@plouf.fr.eu.org>, Robert White <rwhite@pobox.com>, netfilter@vger.kernel.org

On Sun, Feb 12, 2017 at 01:30:52PM +0100, Michael Weiser wrote:
[...]
> What's bugging me is that I still don't see an expectation being
> created with conntrack -L expect.

It's very unlikely to see FTP expectation via conntrack -L since they
are created and destroyed very quickly if you are testing with a FTP
client.

You can probably watch it there by manually creating a connection via
netcat, and talk FTP, eg.

 $ nc ftp.netfilter.org 21
 220 ProFTPD 1.3.5 Server (netfilter/iptables FTP site) [::ffff:150.214.142.16 ]
 USER anonymous
 331 Anonymous login ok, send your complete email address as your password
 PASS nothing
 PASV

# conntrack -L expect
299 proto=6 src=192.168.2.195 dst=150.214.142.167 sport=0 dport=49926 mask-src=255.255.255.255 mask-dst=255.255.255.255 sport=0 dport=65535 master-src=192.168.2.195 master-dst=150.214.142.167 sport=46532 dport=21 class=0 helper=ftp
conntrack v1.4.4 (conntrack-tools): 1 expectations have been shown.

So `conntrack -E expect' is likely a better option for the debugging
purposes you need.

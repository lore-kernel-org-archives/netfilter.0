From: whiplash <whiplash@bofhland.org>
Subject: Re: iptables ip_conntrack_ftp + proftpd TLS: PORT command not understood
Date: Mon, 26 May 2008 21:39:11 +0200
Message-ID: <483B11DF.3050904@bofhland.org>
References: <483B0E5E.4010209@gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <483B0E5E.4010209@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Filippo Zeus ha scritto:
> That's true ... proftpd has been configured to encrypt auth+data
> so the PORT command is sent in cleartext way.
> 
> I you read
> question Using mod_tls, FTP sessions through my firewall now no longer 
> work. What's going on?
> at http://www.castaglia.org/proftpd/doc/contrib/ProFTPD-mini-HOWTO-TLS.html
> 
> proftpd developers suggest to do this to fix this problem...
> but it do not work.

Did you verify, by using for example tcpdump, that th client is actually using
CCC, sending commands in clear text?

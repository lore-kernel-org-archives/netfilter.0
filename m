From: whiplash <whiplash@bofhland.org>
Subject: Re: iptables ip_conntrack_ftp + proftpd TLS: PORT command not understood
Date: Mon, 26 May 2008 21:07:27 +0200
Message-ID: <483B0A6F.9040108@bofhland.org>
References: <483B04A8.9000405@gmail.com> <483B06A1.6030907@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <483B06A1.6030907@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: filippozeus@gmail.com
Cc: netfilter@vger.kernel.org

Filippo Zeus ha scritto:

> ftp_conntrack module probably do no understand the port command so it do 
> not open the port.

There's no bug, indeed.
Conntrack helper simply *can't* see the PORT command, since the packet payload
is encrypted.

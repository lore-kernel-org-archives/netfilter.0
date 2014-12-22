From: Orion Poplawski <orion@cora.nwra.com>
Subject: Re: Trouble with =?utf-8?b?dWxvZ190ZXN0L2Zwcm9iZS11bG9n?=
Date: Mon, 22 Dec 2014 23:25:07 +0000 (UTC)
Message-ID: <loom.20141223T002233-875@post.gmane.org>
References: <loom.20141223T000132-329@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Orion Poplawski <orion <at> cora.nwra.com> writes:

> 
> I'm trying to get fprobe-ulog working on Fedora 21 machine which no longer
> has the old ULOG stuff in the kernel.  I built it using the libipulog compat
> wrapper but it fails to initialize the ipulog handle. 

So it turns out I had too many forked processes trying to read the log. 
Once I killed those, ulog_test appeared to work again.  However, I still
can't get fprobe-ulog to get any data.  It appears to block in
ipulog_read().  Not sure why yet.  I'll try to compare the code to ulog_test.

- Orion




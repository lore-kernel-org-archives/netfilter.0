From: Robert White <rwhite@pobox.com>
Subject: Re: Restrictive FTP egress using conntrack helper
Date: Sat, 11 Feb 2017 22:13:08 +0000
Message-ID: <4d8f60b9-2eb1-2baa-035d-3ac223bfbdf5@pobox.com>
References: <20170211171431.GD31183@weiser.dinsnail.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20170211171431.GD31183@weiser.dinsnail.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michael Weiser <michael@weiser.dinsnail.net>, netfilter@vger.kernel.org

On 02/11/17 17:14, Michael Weiser wrote:
> I still get:
>
> ftp> ls
> 227 Entering Passive Mode (134,76,12,6,119,247).
> ftp: connect: Connection refused
> ftp>

I think I read somewhere that the as of Kernel 4.7 the connection 
tracker no longer _automatically_ loads the helper module. So if you've 
built the connection tracking stuff as modules you'll need to manually 
modprobe the helpers you want to use.

If you're using the kernels and building as modules I'd double-check 
lsmod before you bang your head against anything solid. 8-)

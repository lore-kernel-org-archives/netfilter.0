From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: newbie question : ip_conntrack_ftp
Date: Tue, 23 Mar 2004 16:48:44 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403231648.44421.Antony@Soft-Solutions.co.uk>
References: <Pine.GSO.4.50.0403231623050.17504-100000@jagor.srce.hr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.GSO.4.50.0403231623050.17504-100000@jagor.srce.hr>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tuesday 23 March 2004 3:24 pm, Mihael Kukec wrote:

> Hello!
>
> I'm using latest stable Debian, with 2.4.18 kernel. Unfortunately it does
> not have ip_conntrack_ftp module included and I need it. Can someone give
> me short instructions on that to do? Where to get source, and if there
> are, some special instructions for compiling etc...

It's a kernel compile option when you "make config" or "make menuconfig" etc.

You don't need any extra source code - just the standard kernel source.

Regards,

Antony,

-- 
All matter in the Universe can be placed into one of two categories:

1. Things which need to be fixed.
2. Things which need to be fixed once you've had a few minutes to play with 
them.

                                                     Please reply to the list;
                                                           please don't CC me.



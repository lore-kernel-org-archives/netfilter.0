From: "Jeremy C. Reed" <reed@reedmedia.net>
Subject: Re: building iptables with linux-2.4.20 fails due to headers in
 wrong places
Date: Thu, 1 May 2003 12:21:56 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.43.0305011030280.15827-100000@pilchuck.reedmedia.net>
References: <Pine.LNX.4.43.0304301533340.1683-100000@pilchuck.reedmedia.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.43.0304301533340.1683-100000@pilchuck.reedmedia.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, 30 Apr 2003, Jeremy C. Reed wrote:

> Something wrong... deleting dependencies.
> make: ***
> [/tmp/pkgsrc/misc/linux-kernel/work.k3/linux-2.4.20/include/net/if.h]

> [/tmp/pkgsrc/misc/linux-kernel/work.k3/linux-2.4.20/include/net/ethernet.h]

Sorry. False alarm. My glibc headers were moved out of the way.

The message was unclear because the actual missing files were missing from
/usr/include/net/.

Can it be built without the entire kernel source? (Just linux/include
needed?)

It now builds and installs fine. And it works.

(By the way, I packaged it using NetBSD's pkgsrc -- which is also useful
under Linux.)

   Jeremy C. Reed
   http://www.isp-faq.com/





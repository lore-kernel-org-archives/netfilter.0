From: Mathias Gygax <mg@trash.net>
Subject: Re: fragmentation code
Date: Tue, 4 Jun 2002 16:28:43 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020604142843.GA17694@chiba.dyndns.org>
References: <3CEF4F3E0000A925@ims3c.cp.tin.it>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <3CEF4F3E0000A925@ims3c.cp.tin.it>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

On Die, Jun 04, 2002 at 04:21:10 +0200, luigicart@tin.it wrote:
> Hi I'm Luigi.Where I can find in the kernel the fragmentation code for
> packet IP/TCP?

/usr/src/linux/net/ipv4/ip_fragment.c

and calling routines in ip_input.c and ip_output.c (same dir)


From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: list delete bug: kernel crash
Date: Tue, 31 Aug 2004 12:01:29 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200408311201.29993.Alistair@nerdnet.ca>
References: <000801c48f65$58d3c940$0a00a8c0@aziz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000801c48f65$58d3c940$0a00a8c0@aziz>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On August 31, 2004 10:18 am, security wrote:
> ----- Original Message -----
> From: "security" <security@lea-linux.com>
> To: "Gavin Hamill" <gdh@acentral.co.uk>; <netfilter@lists.netfilter.org>
> Sent: Tuesday, August 31, 2004 3:34 PM
> Subject: Re: list delete bug: kernel crash
>
> >> This may be a long shot, but there may exist the possibility of the
> >> files on
> >> disk being corrupted when they were installed, due to your faulty
> >> memory?
> >>
> >> Try to reinstall the kernel / modules and iptables userspace?
> >>
> >> Cheers,
> >> Gavin.
> >
> > Ok. I go re-compil my kernel and re-install iptable package :)
>
> Ok still have  crash after re-compil my kernel and re-install iptable
> userspace package.
> Allways the same error:
>
> Aug 31 16:01:39 gateway kernel: LIST_DELETE:
> net/ipv4/netfilter/ip_conntrack_core.c:300
> `&ct->tuplehash[IP_CT_DIR_REPLY]'(d3ac9224) not in
> &ip_conntrack_hash[hr].
> Aug 31 16:01:39 gateway kernel: LIST_DELETE:
> net/ipv4/netfilter/ip_conntrack_core.c:300
> `&ct->tuplehash[IP_CT_DIR_REPLY]'(d3ac9524) not in
> &ip_conntrack_hash[hr].
> Aug 31 16:03:26 gateway kernel: LIST_DELETE:
> net/ipv4/netfilter/ip_conntrack_core.c:300
> `&ct->tuplehash[IP_CT_DIR_REPLY]'(d6537224) not in
> &ip_conntrack_hash[hr].

	I recall having memory problems in the past (about three years ago) ... 
	never very fun, and the issue was so fine grained that I ended up having to 
rebuild the box from a zeroed disk.  Reading backward I see you are using 
2.6.8.1 kernel code.  Can you check 

	1) the MD5 sum of the tarball of kernel code and the 
	2)MD5 sum of the tarball of iptables, 
	
	just as a quick verification that they are (close to) clean.  

	next == which version of iptables ( i didn't notice that in your original 
post) and what  elements if any out of patch-o-matic(-ng) are installed?

	Keep in mind that you now have to question any code that is on your system 
that might have been built wilst that damaged memory module was installed, 
one never knows where a bit might have been flipped. *sigh*

	This particular message is from LIST_DELETE in function
	clean_from_lists() and appears at first glance to be the cleanup after 
expectation timeout.  You don't have any tweaks to any of the (expectation) 
timeout code somewhere do you?
	
	You could *try* running MD5sum against ip_*.c 
in /usr/src/linux/net/ipv4/netfilter dir -- and *possibly* someone could 
verify the numbers  .....but I  personally would redownload the whole lot to 
be safe  (i.e. kernel code/iptables code etc) -- if this is a recently built 
box, I'd rebuild from the ground up based on the bad memory module... but I'm 
paranoid....

	Alistair Tonner

	

	


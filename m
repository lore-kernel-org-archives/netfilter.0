From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: understanding ip_conntrack entry
Date: Fri, 4 Oct 2002 10:36:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210040936.g949aHL10516@vulcan.rissington.net>
References: <000f01c26b18$2d114990$3201a8c0@leonardo> <3D9D00B0.8080901@iprimus.com.au> <33337.194.98.166.58.1033720304.squirrel@postmail.alphalink.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <33337.194.98.166.58.1033720304.squirrel@postmail.alphalink.fr>
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
To: netfilter@lists.samba.org

On Friday 04 October 2002 9:31 am, Eric Leblond wrote:

> >>my remote machines. My question is .... if this connection is marked as
> >>ESTABLISHED, shouldnt it appear on 'netstat -an' entries ??? I think it
> >>should, but it's not appearing there .....
>
> Netstat give you information about sockets created on your box
> and not about your box acting as a router.

That is true, indeed.

> That's why you don't see things appearing in ip_conntrack if your machine
> is not or source or destination of the packet.

Also true, however in this case the netfilter machine *was* one of the 
endpoints of the connection :-)

Antony.

-- 

All matter in the Universe can be placed into one of two categories:

1. things which need to be fixed
2. things which will need to be fixed once you've had a few minutes to play 
with them


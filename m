From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: tcpdump behavior not getting all packets in promisc mode
Date: Mon, 3 Jun 2002 23:13:40 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020603231340.R27307@funkyjesus.org>
References: <007a01c20ac1$3071b780$4000a8c0@thought> <20020603133612.47251.qmail@web10404.mail.yahoo.com>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020603133612.47251.qmail@web10404.mail.yahoo.com>; from astormchaser2002@yahoo.com on Mon, Jun 03, 2002 at 06:36:12AM -0700
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

On Mon, Jun 03, 2002 at 06:36:12AM -0700, Art Reisman wrote:

> Yes I know this is not quite on topic , but I'm geting there, before I can
> use iptables the way I wanted , this was sort of background work.

Fair enough :)

> Here is my topology
> 
> 
> T1----->Gateway---->Hub-------Wireless----->PC1
>                      |
>                      |------>eth0---->PC2--->TCPDUMP
>                                      (SUSE Linux)
> 
> 
> The hub is stupid, not switched.

Are "Hub" and "Wireless" the same device?  If so I'm wondering if it's not
quite as stupid as you think.

> I see ARP packets, but nothing specific for host PC1 in the tcpdump on
> PC2.
> 
> PC1 and PC2 have static IP addresses.

Like you say, maddening :)

-- 
FunkyJesus System Administration Team



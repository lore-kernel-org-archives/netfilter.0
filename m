From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Blocking broadcasts
Date: Wed, 10 Jul 2002 20:40:00 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020710194003.ZRQT290.mta02-svc.ntlworld.com@there>
References: <3D2C8CA4.2040607@frontierdev.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3D2C8CA4.2040607@frontierdev.com>
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
To: netfilter@lists.samba.org

On Wednesday 10 July 2002 8:36 pm, Faruk Grozdanic wrote:

> Hello,
>
> I am trying to block broadcast IP traffic, that is IP traffic that has
> 255.255.255.255 in the destination feild. I pushed a rule:
>
> iptables -I FORWARD -i eth4 -d 255.255.255.255 -j DROP
>
> and it did not filter these out.

Broadcasts do not go through routers, therefore they will enter the INPUT 
table of your firewall, not the FORWARD table.

 

Antony.


From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: tcpdump behavior not getting all packets in promisc mode
Date: Tue, 4 Jun 2002 01:50:51 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206040050.g540oqA02000@Networker.rockstone.co.uk>
References: <20020604004318.60104.qmail@web10403.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020604004318.60104.qmail@web10403.mail.yahoo.com>
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

On Tuesday 04 June 2002 1:43 am, Art Reisman wrote:

> > > Here is my topology
>
>  T1----->Gateway---->Hub-------Wireless----->PC1
>                       |------>eth0---->PC2--->TCPDUMP
> > >

1. What sort of network card is eth0 ?

2. Do you have another machine you can plug into the hub to:
2a. Run Tcpdump and check if *it* can see what you expect ?
2b. Create traffic and check if PC2 can see it ?


Antony.


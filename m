From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Two ethernet card for internet access.. help
Date: Mon, 22 Mar 2004 12:49:12 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403221249.12135.Antony@Soft-Solutions.co.uk>
References: <323910-220043122123013416@M2W093.mail2web.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <323910-220043122123013416@M2W093.mail2web.com>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Monday 22 March 2004 12:30 pm, mehmet.ak@mail.kolayyol.net wrote:

> Hi.
>
> There is tree ethernet card our linux server.
>
> eth0 192.168.0.1/24 Our localnetwork
> eth1 212.4.3.1 Leasline 128K
> eth2 10.0.0.1 ADSL 512 K
>
> 1. step we want to use  eth1 leasline access for 212.115.20.182 . This is a
> VPN server.
>
> 2. step our lan use eth2 for all internet access (www, ftp,pop3,smtp etc.)
>
> 2. Step is working correctly. but 1. step don't work.
>
> who one help me ?

You need iproute2 for this, not netfilter.   This is a routing problem rather 
than a filtering problem.

http://lartc.org

Regards,

Antony.

-- 
There's no such thing as bad weather - only the wrong clothes.

 - Billy Connolly

                                                     Please reply to the list;
                                                           please don't CC me.



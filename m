From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IP address to MAC address
Date: Tue, 11 Jun 2002 21:40:53 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206112040.g5BKetA21075@Networker.rockstone.co.uk>
References: <001601c2113a$aa85b560$0500a8c0@escritoriomundial.com.br> <200206111253.g5BCrqU10699@vulcan.rissington.net> <1023827880.4177.81.camel@billy.demon.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <1023827880.4177.81.camel@billy.demon.nl>
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

On Tuesday 11 June 2002 9:38 pm, Tony Earnshaw wrote:

> tir, 2002-06-11 kl. 14:53 skrev Antony Stone:

> > ping $IP -c1 >/dev/null 2>&1
> > grep $IP /proc/net/arp | tr -s ' ' | cut -d' ' -f4
> >
> > (There's a single space in between each of those pairs of ' ', in case
> > it's not obvious.)
>
> Did you say 'arp -a'?

I would have done, if I knew I was root, but the commands I suggested work 
for an unprivileged user too :-)

 

Antony


From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Routing Tables ? Help
Date: Thu, 4 Jul 2002 10:26:06 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207040926.g649QDU31082@vulcan.rissington.net>
References: <NDHEKLKHBBIHMDAA@mailcity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <NDHEKLKHBBIHMDAA@mailcity.com>
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
To: iptables <netfilter@lists.samba.org>

On Thursday 04 July 2002 10:11 am, Manish K Arya wrote:

> Hi all
> I need some help regarding routing tables.
> I want to ascertain whther my routing tables have been tampered by some
> user having the admisnistrative rights and i want to restore the default
> values and which are the routing files?

Log in as root and use
route -n
to see whether your routing table is correct.

The startup file which sets your routing table might be /etc/rc.d/rc.inet1 
but it might be somewhere else depending on your distribution and depending 
on where you have put any additional commands.

 

Antony.


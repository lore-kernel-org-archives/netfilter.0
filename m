From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT machines cant do 'dir' after connecting to FTP
Date: Mon, 3 Jun 2002 16:52:38 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206031552.g53FqeA04048@Networker.rockstone.co.uk>
References: <ENEBKGGOKDOEALIKAJMBAEEMCHAA.neil@JAMMConsulting.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <ENEBKGGOKDOEALIKAJMBAEEMCHAA.neil@JAMMConsulting.com>
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
To: netfilter <netfilter@lists.samba.org>

On Monday 03 June 2002 4:30 pm, Neil Aggarwal wrote:

> I can ftp from an internal machine and connect to an
> external server.  I can give it a user name and password
> and login successfully, but when I try to type dir or
> ls, the ftp client sits for a long time
> and then I get a message:
>  425 Not able to open data connection.
>
> Here are the commands that I used:
> 	# Load the conntrack ftp module
>       /sbin/modprobe ip_conntrack_ftp

You need to load the module ip_nat_ftp as well.


Antony.


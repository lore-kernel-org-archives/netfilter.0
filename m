From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Rule question
Date: Sat, 22 Jun 2002 08:46:25 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020622074627.KCNY19225.mta07-svc.ntlworld.com@there>
References: <200206220935.12908.captain.nuke@gmx.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206220935.12908.captain.nuke@gmx.at>
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

On Saturday 22 June 2002 8:35 am, Patrick Petermair wrote:

> Hi!
>
> I've read the following example script for a linux box with masquerading
> and some firewall rules:
>http://www.ecst.csuchico.edu/~dranch/LINUX/ipmasq/examples/rc.firewall-2.4-stronger

I've just had a look at this script, and I don't like a couple of the 
variables he's set:

INTNET="192.168.1.0/24"
INTIP="192.168.1.1/24"

That INTNET is all very well, but the INTIP is a single address, and 
therefore should end in /32, not /24.

Given this little error, it might be worth checking the rest of this guy's 
script to see if any other little inaccuracies have crept in...

 

Antony.


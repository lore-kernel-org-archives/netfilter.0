From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NetBIOS browsing across subnets
Date: Thu, 4 Jul 2002 21:46:19 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020704204621.JNSG295.mta03-svc.ntlworld.com@there>
References: <007201c2239b$a885a8b0$6301a8c0@JJONES1>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <007201c2239b$a885a8b0$6301a8c0@JJONES1>
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

On Thursday 04 July 2002 9:44 pm, John Jones wrote:

> I have a need to allow NetBIOS/Network Neighborhood browsing across a
> firewall between one internal LAN segment (192.168.0.0/23) to another
> (192.168.10.0/24).  The two networks are on interfaces eth2 and eth3,
> respectively, off of the corporate firewall.

As far as I am aware you cannot do Network Neighbourhood browsing across a 
router - it works by using broadcast packets, so unless you bridge your 
networks together you will not be able to browse one side from the other.

You can certainly make Windows / SMB / NetBios connections from one network 
to another, but only if you know in advance the IP address/es of the 
machine/s you want to connect to.

If anyone knows a way of supporting Windows browsing across a router, please 
speak up :-)

 

Antony.


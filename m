From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: hosts.deny
Date: Mon, 8 Jul 2002 00:04:34 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020707230435.FXCG2755.mta05-svc.ntlworld.com@there>
References: <EPEHIDPIPEBFNAHLCHPGAEMPCEAA.dennis@core-enterprises.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <EPEHIDPIPEBFNAHLCHPGAEMPCEAA.dennis@core-enterprises.com>
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
To: Netfilter Mailing List <netfilter@lists.samba.org>

On Sunday 07 July 2002 11:54 pm, Dennis Cardinale wrote:

> When running a netfilter firewall, is there any reason to continue using
> the hosts.deny and hosts.allow files, or is this just superfluous?

hosts.allow can still be useful to specify a command to run when a connection 
comes in (eg to provide some special logging ?), but these files don't add 
any security to a decently configured netfilter setup.

[ IMHO ]

 

Antony.


From: Jack Bowling <jbinpg@shaw.ca>
Subject: Re: hosts.deny
Date: Sun, 07 Jul 2002 16:51:15 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <0GYW00K53KXH59@l-daemon>
References: <EPEHIDPIPEBFNAHLCHPGAEMPCEAA.dennis@core-enterprises.com>
 <20020707230435.FXCG2755.mta05-svc.ntlworld.com@there>
Reply-To: Jack Bowling <jbinpg@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020707230435.FXCG2755.mta05-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: netfilter@lists.samba.org

** Reply to message from Antony Stone <Antony@Soft-Solutions.co.uk> on Mon, 08 Jul 2002 00:04:34 +0100


> On Sunday 07 July 2002 11:54 pm, Dennis Cardinale wrote:
> 
> > When running a netfilter firewall, is there any reason to continue using
> > the hosts.deny and hosts.allow files, or is this just superfluous?
> 
> hosts.allow can still be useful to specify a command to run when a connection 
> comes in (eg to provide some special logging ?), but these files don't add 
> any security to a decently configured netfilter setup.

Beg to differ. /etc/hosts.deny allows access tuning of services that are set wide open on the firewall, ssh being a prime example.

jb

-- 
Jack Bowling
mailto: jbinpg@shaw.ca


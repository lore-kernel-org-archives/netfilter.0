From: Michael Gale <michael.gale@utilitran.com>
Subject: Re: FTP passive not working
Date: Tue, 13 Apr 2004 14:08:48 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040413140848.32857beb@mgalepc.utilitran.com>
References: <20040413114125.6d159e42@mgalepc.utilitran.com>
	<1081879193.3521.1.camel@katala.sterenborg.info>
	<20040413131336.2d9052b2@mgalepc.utilitran.com>
	<20040413134334.34894d8f@mgalepc.utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040413134334.34894d8f@mgalepc.utilitran.com>
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
To: netfilter@lists.netfilter.org

Hi,

	The log files from the LOG target show that the OUT interface for packets
coming after the passive command is issue to be the exteranl interface, which is
wrong since all other commands show the out interface as eth1 the internal nic.

Michael.


On Tue, 13 Apr 2004 13:43:34 -0600
Michael Gale <michael.gale@utilitran.com> wrote:

> Hello again,
> 
> 	It seems that on tablerule-36 (custom user chain) the --state RELATED
> 	does not
> work ?
> 
> If I add a rule allowing all traffic it works ?
> 
> Michael.
> 
> 
> On Tue, 13 Apr 2004 13:13:36 -0600
> Michael Gale <michael.gale@utilitran.com> wrote:
> 
> > Hello,
> > 
> > 	I have all the iptable modules built into the kernel. I also forgot to
> > 	add the
> > for the custom tablerule I have allowed all established and related
> > connections.
> > 
> > Michael.
> > 
> > 
> > On Tue, 13 Apr 2004 19:59:53 +0200
> > Rob Sterenborg <rob@sterenborg.info> wrote:
> > 
> > > On Tue, 2004-04-13 at 19:41, Michael Gale wrote:
> > > > Hello,
> > > > 	
> > > > 	I am having trouble getting a FTP connection to work in passive mode
> > > > 	from
> > > > behind a firewall.
> > > 
> > > ....
> > > 
> > > > So all rules with regards to this IP / PC are under one rule.
> > > > 
> > > > This setup is working fine for all connections accept passive FTP -- it
> > > > seems the firewall is not forwarding the related data connection to the
> > > > internal server.
> > > 
> > > Did you load the ip_conntrack_ftp and ip_nat_ftp modules ?
> > > 
> > > 
> > > Gr,
> > > Rob
> > > 
> > > 
> > > 
> > > 
> > > 
> > > 
> > > 
> > 
> > 
> > -- 
> > Michael Gale
> > Network Administrator
> > Utilitran Corporation
> > 
> > 
> > 
> > 
> > 
> 
> 
> -- 
> Michael Gale
> Network Administrator
> Utilitran Corporation
> 
> 
> 
> 
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation


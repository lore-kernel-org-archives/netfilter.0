From: Alistair Tonner <Alistair@alistairt.ath.cx>
Subject: Re: secure ftp with SSL
Date: Fri, 13 Sep 2002 06:09:22 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020913100922.GA23101@Ajftl1.ajfthome.on.ca>
References: <754E53EEA7D3D31194E50050DAB99F6E70543C@thor.id.magnus.com> <200209131043.52555.roy@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200209131043.52555.roy@karlsbakk.net>; from roy@karlsbakk.net on Fri, Sep 13, 2002 at 04:43:52 -0400
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Cc: Rendy V <RendyV@atd.magnus.co.id>, "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

On 2002.09.13 04:43 Roy Sigurd Karlsbakk wrote:
> On Friday 13 September 2002 05:09, Rendy V wrote:
> > Hi All,
> > I have a strange problem, the problem is like this :
> > I have an application that use secure ftp and for that reason I have
> opened
> > up the command port (990) with state NEW and allowed data port
> > (20000:20049) with state ESTABLISHED, RELATED on the firewall. It
> fails
> > when it try to use data port, for authentication it working just
> fine.
> > Please see the log on the below.
> > If I open data port 2000:20049 with state NEW it working normally
> but I
> > don't want to make a big hole on my firewall. I suspect that the
> iptables
> > connection tracking cannot track the relation between command port
> and data
> > port because it is encrypted using SSL. Is it true or is there
> something I
> > miss here?? What should I do now??
> 
> first - have you loaded ip_conntrack_ftp?
> 
> second - I'm not sure the ip_conntrack_ftp module can understand
> encrypted
> traffic. Try using sftp from openssh instead. That only uses 22/tcp.
> 
> roy
> 
> 
	Furthermore, you would have to load the ip_conntrack_ftp and 
(possibly_
	ip_nat_ftp modules with ports=      parameter set to cover the 
control
	port on which you were connecting I believe.....


	Alistair




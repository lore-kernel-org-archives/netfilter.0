From: Alistair Tonner <Alistair@alistairt.ath.cx>
Subject: Re: secure ftp with SSL
Date: Tue, 17 Sep 2002 12:44:51 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020917164451.GE9482@Ajftl1.ajfthome.on.ca>
References: <754E53EEA7D3D31194E50050DAB99F6E705442@thor.id.magnus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <754E53EEA7D3D31194E50050DAB99F6E705442@thor.id.magnus.com>; from RendyV@atd.magnus.co.id on Mon, Sep 16, 2002 at 00:21:18 -0400
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
To: Rendy V <RendyV@atd.magnus.co.id>
Cc: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>, 'Roy Sigurd Karlsbakk' <roy@karlsbakk.net>


	Did you load thusly:

	modprobe -dv ip_conntrack_ftp ports=21,900
	modprobe -dv ip_nat_ftp ports=21,900

	... As I read what you are saying here the secure ftp is done on
	port 900 + (random non-priviledged UDP ports)
	-- would this be FastCopy???
	-- You will need to pass the port number for the control 
connection to the
	conntrack module *for sure* and the NAT module to get it 
working from a
	box *other* than the firewall ...
	 
	FYI -- if it is FastCopy -- I've resources I can ask questions 
of for you
	if need be who are *very* familiar with getting FastCopy 
through a firewall
	*chuckles*...

	Alistair

On 2002.09.16 00:21 Rendy V wrote:
> roy,
> yes, i have loaded ip_conntrack_ftp.
> Is there any better idea because if i change it i have to change all
> my
> application..
> 
> regards,
> rendy
> 
> 
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
> and
> data
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



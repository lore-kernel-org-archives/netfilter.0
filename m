From: Michael Gale <michael.gale@utilitran.com>
Subject: Re: FTP passive not working
Date: Tue, 13 Apr 2004 13:47:49 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040413134749.4e38203a@mgalepc.utilitran.com>
References: <20040413114125.6d159e42@mgalepc.utilitran.com>
	<200404132037.35477.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404132037.35477.Antony@Soft-Solutions.co.uk>
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

Hello,

	Passive connections to the client work on the local LAN but they are connecting
to a different IP on the box -- because the server will return the external IP
of the firewall for passive connections to the main IP.

I am sure that the problem is that "RELATED" option under state do not work with
a user defined chain.

iptables -A userchain -i external -o internal -d internalIP -m state --state
ESTABLISHED,RELATED -j ACCEPT.

Michael.


On Tue, 13 Apr 2004 20:37:35 +0100
Antony Stone <Antony@Soft-Solutions.co.uk> wrote:

> On Tuesday 13 April 2004 6:41 pm, Michael Gale wrote:
> 
> > Hello,
> >
> > I am having trouble getting a FTP connection to work in passive mode from
> > behind a firewall.
> >
> > On the FTP server I have two IP's one used for internal connections and one
> > used for external connections. The external one is .36 .. so in the
> > proftpd.conf file I used the following:
> 
> <snip...>
> 
> > So when I try passive my client tried to connect to the external IP of the
> > firewall on a port > 1024.
> 
> 1. Where is the client, which is connecting to the external address?
> 
> 2. Do passive connections to this server work from your LAN, not going through
> the firewall?
> 
> 3. Do passive connections to external servers, from clients on your LAN, work 
> through the firewall?
> 
> Regards,
> 
> Antony.
> 
> -- 
> Never write it in Perl if you can do it in Awk.
> Never do it in Awk if sed can handle it.
> Never use sed when tr can do the job.
> Never invoke tr when cat is sufficient.
> Avoid using cat whenever possible.
> 
>                                                      Please reply to the list;
>                                                            please don't CC me.
> 
> 
> 
> 
> 
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation


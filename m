From: Kelly Setzer <Kelly.Setzer@placemark.com>
Subject: Re: Iptables & Remote SSH Sorrows
Date: Thu, 10 Apr 2003 13:38:27 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030410183827.GC17730@placemark.com>
References: <E193gj0-0008Qi-00@kashyyyk.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <E193gj0-0008Qi-00@kashyyyk.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: tamato@attbi.com
Cc: netfilter@lists.netfilter.org

On Thu, Apr 10, 2003 at 06:24:33PM +0000, tamato@attbi.com wrote:
> I have configured iptables to allow ssh connections.  However, no one is able 
> to connect unless I add their IP address to the /etc/hosts file.  Since my 
> remote useres are on dynamic IP's - their address changes each time they log in 
> to their internet accounts.  
> 
> Is there a way to configure iptables or another system file that would allow 
> ssh connections from any IP?
> 

In your sshd config file (/etc/sshd/sshd_config on debian), check the
following option.  If it's set to yes, change it to no.

VerifyReverseMapping
  Specifies whether sshd should try to verify the remote host name
  and check that the resolved host name for the remote IP address
  maps back to the very same IP address.  The default is "no".


Also, check /etc/hosts.allow.

You should have:

sshd: ALL

Whereas, you probably have something like:

ALL: PARANOID


Kelly

--
Kelly Setzer, System Administrator/Architect - Placemark Investments
14180 Dallas Pkwy, Suite 200, Dallas, TX 75240
kelly.setzer@placemark.com  http://www.placemark.com
(972)404-8100x41 (work)       (214) 287-3464 (cell)


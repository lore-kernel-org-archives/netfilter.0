From: Jason Opperisano <opie@817west.com>
Subject: Re: slow ftp
Date: Thu, 17 Feb 2005 12:15:48 -0500
Message-ID: <1108660548.4629.59.camel@hubcap.ljm.dom>
References: <a0f69e505021708481c4be836@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <a0f69e505021708481c4be836@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 2005-02-17 at 11:48, Askar wrote:
> hi list
> 
> we are running ftp "proftpd" server it takes times when a user
> connects to ftp server however when I flush the iptables rules
> connection doesn't takes time, iptables firewall on the same machine,
> default policies are DROP,
> firewall script is very straight forward
> 
> rules
> .
> .
> # Using Connection State to By-pass Rule Checking
> iptables -A INPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> .
> .
> .iptables -A INPUT -p tcp --dport 20:21 -m state --state NEW -j ACCEPT
> .
> .
> 
> # Load the FTP connection state helper module.
> modprobe ip_conntrack_ftp
> # Load the FTP NAT module.
> modprobe ip_nat_ftp
> 
> any idea?

you have your FTP server configured to perform IDENT lookups on the
clients, perhaps?

  iptables -A OUTPUT -p tcp --syn --dport 113 -j ACCEPT

-j

--
"You heard me, I won't be in for the rest of the week... I told you,
 my baby beat me up... oh it is not the worst excuse I ever thought up."
	--The Simpsons



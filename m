From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: FTP passive not working
Date: Tue, 13 Apr 2004 21:00:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404132100.22389.Antony@Soft-Solutions.co.uk>
References: <20040413114125.6d159e42@mgalepc.utilitran.com> <200404132037.35477.Antony@Soft-Solutions.co.uk> <20040413134749.4e38203a@mgalepc.utilitran.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040413134749.4e38203a@mgalepc.utilitran.com>
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

On Tuesday 13 April 2004 8:47 pm, Michael Gale wrote:

> Hello,
>
> 	Passive connections to the client work on the local LAN but they are
> connecting to a different IP on the box -- because the server will return
> the external IP of the firewall for passive connections to the main IP.

Yes, I knew that would connect to the other IP on the server - I just wanted 
to check that the server was supporting passive connections :)

> I am sure that the problem is that "RELATED" option under state do not work
> with a user defined chain.

Uh?

> iptables -A userchain -i external -o internal -d internalIP -m state
> --state ESTABLISHED,RELATED -j ACCEPT

Nothing wrong with that.   No reason at all you can't match those parameters 
in a user-defined chain.

I'm not aware of anything in netfilter you can do on a built-in chain which 
you can't do on a user-defined chain except apply a default policy.

Regards,

Antony.

-- 
I don't know, maybe if we all waited then cosmic rays would write all our 
software for us. Of course it might take a while.

 - Ron Minnich, Los Alamos National Laboratory

                                                     Please reply to the list;
                                                           please don't CC me.



From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How to redirect browsers with static proxy settings in iptables?
Date: Sun, 25 Jul 2004 18:47:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407251847.14366.Antony@Soft-Solutions.co.uk>
References: <BAY2-F18gRXrJrozCsV00007623@hotmail.com> <200407251424.07223.Antony@Soft-Solutions.co.uk> <F5880758-DE60-11D8-944B-000A95C62BFA@viatornetworks.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F5880758-DE60-11D8-944B-000A95C62BFA@viatornetworks.com>
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

On Sunday 25 July 2004 6:35 pm, Todd Landfried wrote:

> Thank you for the response.
>
> The problem is the proxy setting may change as she moves from office to
> office. Therefore, I'd like to set it up so regardless of what HER
> settings are, they'll work here.

Then simply intercept all packets addressed to whichever port/s the proxies 
listen on, no matter what the destination address is, eg:

iptables -A PREROUTING -t nat -p tcp --dport 3128 -j DNAT --to a.b.c.d
iptables -A PREROUTING -t nat -p tcp --dport 8080 -j DNAT --to a.b.c.d

etc., where a.b.c.d is the proxy you want to redirect the user to.

Alternatively intercept the packets from the particular machine (I assume this 
mobile user either has a standard static address each time she's on your 
network, or else you use DHCP and can tie her MAC address to a known IP 
address).

Regards,

Antony.

> On Jul 25, 2004, at 6:24 AM, Antony Stone wrote:
> > I don't understand (I think).   Are you trying to intercept HTTP
> > requests from
> > browsers (in which case you just intercept *all* TCP port 80/8080/3128
> > traffic, no matter where it's addressed to), or are you saying that
> > you can't
> > keep track of where to redirect it to, because the proxy address moves
> > around
> > (in which case you're as stuck as someone running a browser would be,
> > trying
> > to direct requests to a moving proxy).
> >
> > What exactly is the problem?
> >
> > Regards,
> >
> > Antony.

-- 
Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.

                                                     Please reply to the list;
                                                           please don't CC me.



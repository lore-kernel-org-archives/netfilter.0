From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Howto match only the first connection from an IP
Date: Tue, 18 Nov 2003 16:00:12 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311181600.hAIG0Gj23165@agate.rockstone.co.uk>
References: <20031118144300.GA5071@legolas.on.net.mk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031118144300.GA5071@legolas.on.net.mk>
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

On Tuesday 18 November 2003 2:43 pm, Damjan wrote:

> My goal is to set-up an iptables rule that will match and DNAT the
> first HTTP(port 80) connection from a client (IP address).
>
> The first connection is defined as the first established TCP session
> from the time the iptables rule is inserted. No other TCP connection
> should match nor should be DNAT-ed.
>
> Is there any easy way to do this with current Netfilter/Iptables/pom.

I can't think of a way to do this with netfilter on its own.

A slightly convoluted, although probably effective, way to do it might be to 
add one rule to LOG the packet you're interested in, and another rule just 
after it to perform the NAT.   You then pipe the output of syslog into a 
script which watches out for the netfilter entry, and then issues a 
"netfilter -D ....." command to delete the NAT rule.

The only flaw I can see here (aside from the inefficiency) is that there will 
be a certain time delay between the first packet being seen and logged, and 
the NAT rule getting deleted by the script, during which time a packet could 
get through on a second connection.

Whether that's important to you, and how long the time period might be, I 
can't say.

It's an idea, anyway.

Antony.

-- 

Mahatma Gandhi was once asked what he thought of Western Civilisation.

He replied, "That would be a very good idea."
                                                     Please reply to the list;
                                                           please don't CC me.


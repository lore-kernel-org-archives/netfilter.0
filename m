From: Damjan <gdamjan@mail.net.mk>
Subject: Re: Howto match only the first connection from an IP
Date: Tue, 18 Nov 2003 18:26:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031118172602.GA15103@legolas.on.net.mk>
References: <20031118144300.GA5071@legolas.on.net.mk> <200311181600.hAIG0Gj23165@agate.rockstone.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200311181600.hAIG0Gj23165@agate.rockstone.co.uk>
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
To: netfilter@lists.netfilter.org

> > My goal is to set-up an iptables rule that will match and DNAT the
> > first HTTP(port 80) connection from a client (IP address).
> >
> > The first connection is defined as the first established TCP session
> > from the time the iptables rule is inserted. No other TCP connection
> > should match nor should be DNAT-ed.
> >
> > Is there any easy way to do this with current Netfilter/Iptables/pom.
> 
> I can't think of a way to do this with netfilter on its own.

Well I've come to this solution, but I wonder how reliable it is

iptables -t nat -p tcp --dport 80 -s 171.68.1.1 -m quota --quota 40 \
    -j REDIRECT --to-ports 9999

This seems to match only the first connection.

Any other ideas???

-- 
Damjan Georgievski
jabberID: damjan@bagra.net.mk


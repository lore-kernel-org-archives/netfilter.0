From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: netfilter resets TCP conversation that was DNATed from the local machine to another
Date: Mon, 30 Jun 2003 10:52:29 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030630145229.GB29083@cannon.eng.us.uu.net>
References: <3EFD10A2.6020807@adsl-209-204-165-151.sonic.net> <20030630020152.GA27602@cannon.eng.us.uu.net> <3EFF9ED5.9070808@adsl-209-204-165-151.sonic.net> <20030630142908.GA29083@cannon.eng.us.uu.net> <1056984240.1473.18.camel@raylinux.internal>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1056984240.1473.18.camel@raylinux.internal>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Mon, Jun 30, 2003 at 04:44:00PM +0200, Ray Leach wrote:

> This is an IE browser problem.
> Normal browsers don't send RST after the connection has ended.

He hasn't said anything about a browser running on his squid machine (yet).
And besides I don't think you have IE for linux, do you?
My whole point is the RST from a different port is annoying/weird but
harmless to that particular connection.

My feeling is that he's providing just part of the facts...

Ramin


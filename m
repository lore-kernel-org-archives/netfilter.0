From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: no route to host on port 80
Date: Sat, 10 May 2003 14:01:05 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305101401.06102.Alistair@nerdnet.ca>
References: <3EB5D2C1.5080001@ruffrecordings.com>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EB5D2C1.5080001@ruffrecordings.com>
Content-Disposition: inline
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
To: Tim Dionne <tim@ruffrecordings.com>, netfilter@lists.netfilter.org

On May 4, 2003 10:56 pm, Tim Dionne wrote:
> Hi --
>
> I'm trying to allow outside access to my linux box on port 80.  However,
>    when I try to connect (using a web browser, or telnet) the connection
> is not created.  When I use telnet and specify port 80 I get a "no route
> to host" error.  I've experimented with my firewall by completely
> removing all rules from all chains, but the connection can still not be
> made.  I can establish connections on all other ports except 80!  Can
> anyone help me?
>
> Thanks.


	A few more details are required here Tim:

	1) is the linux box the firewall itself?
	2) what is your connection map ...i.e. DSL router to linux box to internal 
net with connection through router etc.
	3) given the "no route to host" error how/what are you using for DNS?
	4) what if any rules are in your firewall script?




	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!


From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Logging MAC
Date: Sat, 22 May 2004 10:06:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405221006.14904.Antony@Soft-Solutions.co.uk>
References: <5390820828.20040521103958@alternativa.com.br> <200405211625.47373.Antony@Soft-Solutions.co.uk> <200405212147.00410.Alistair@nerdnet.ca>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405212147.00410.Alistair@nerdnet.ca>
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

On Saturday 22 May 2004 2:47 am, Alistair Tonner wrote:

> 	I note that iptables doesn't log mac addresses it cannot see (i.e. not
> directly connected) ... in 1.2.9x (as I and Antony are running) you still
> see the MAC= element.  Perhaps in CVS the logging function drops this entry
> if MAC="" ??

Surely there will *always* be two MAC addresses involved in a communication - 
that's how two machines find each other across the local subnet (ie: via a 
switch / hub / access point etc)?

I agree that in a multi-hop connection between systems, at least one of the 
MAC addresses seen by netfilter will definitely not be an endpoint (it will 
be an interface on a local router), however unless you are running an access 
point *as* a router (the standard way to run them is as a bridge) then you 
should still see the MAC address of whatever machine is talking to the 
firewall?

> -- that would indicate that someone on the wireless is being
> hijacked as a proxy?? *ugh*

In which case you would see the MAC address of the hijacked poxy machine...

Regards,

Antony.

-- 
Bill Gates has personally assured the Spanish Academy that he will never allow 
the upside-down question mark to disappear from Microsoft word-processing 
programs, which must be reassuring for millions of Spanish-speaking people, 
though just a piddling afterthought as far as he's concerned.

 - Lynne Truss, "Eats, Shoots and Leaves"

                                                     Please reply to the list;
                                                           please don't CC me.



From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: redirecting
Date: Thu, 1 Jul 2004 14:08:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407011408.16253.Antony@Soft-Solutions.co.uk>
References: <a0f69e50407010452713ae264@mail.gmail.com> <200407011305.17055.Antony@Soft-Solutions.co.uk> <20040701122957.GR22148@home.manuelm.org>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040701122957.GR22148@home.manuelm.org>
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
To: netfilter <netfilter@lists.netfilter.org>

On Thursday 01 July 2004 1:29 pm, Frank Gruellich wrote:

> This would not be a problem, because the whole 207.46.0.0/16 belongs to
> Microsoft, so IP_OF_MS="207.46.0.0/16" should work, but...

Hm - good point; I hadn't thought of matching on the entire Class B subnet 
just to redirect a website :)

> The webserver of www.linuxiso.org seems to use virtual hosts.  The
> HTTP-request contains the host-part of the URL.  So this server tries to
> find a virtual host called www.microsoft.com, fails and sends an error.
> No, netfilter can't change this.  I dunno if squid can.

Squid can.

Antony.

-- 
Microsoft may sell more software than any other company, but McDonald's sell 
more burgers than any other company, and I think the other similarities are 
obvious...

                                                     Please reply to the list;
                                                           please don't CC me.



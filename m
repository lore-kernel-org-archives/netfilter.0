From: "Tarek W." <mailinglists1@hotpop.com>
Subject: Re: Filtering using port+process (i.e. open port 80 for Apache
	only)
Date: Wed, 03 Mar 2004 16:44:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078324475.25485.184.camel@carve.personal.localdomain>
References: <20040229122637.79368.qmail@web40101.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040229122637.79368.qmail@web40101.mail.yahoo.com>
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


http://netfilter.org/patch-o-matic/pom-extra.html#pom-extra-owner-socketlookup should help

On Sun, 2004-02-29 at 14:26, Moath A. Khalaf wrote:
> Hi,
> 
> How can I filter using a port and allow some processes
> to 
> pass this filter. For example, I want to add a rule
> that 
> does not accept a connection on port 80 to any process
> 
> other than Apache web server.
> 
> Regards
> 
> __________________________________
> Do you Yahoo!?
> Get better spam protection with Yahoo! Mail.
> http://antispam.yahoo.com/tools
> 
> 



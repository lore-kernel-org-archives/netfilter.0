From: David Cannings <lists@edeca.net>
Subject: Re: newbie
Date: Fri, 26 Mar 2004 20:05:25 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403262005.25938.lists@edeca.net>
References: <web-268416924@mail01.infosat.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <web-268416924@mail01.infosat.net>
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
To: netfilter@lists.netfilter.org

On Friday 26 March 2004 19:52, IT Clown wrote:
> I am new to iptanles i am just wondering i have the
> following in my iptables file.
> INPUT DROP [0.0]
> OUTPUT DROP [0.0]
> FORWARD DROP [0.0]
> as i understand that will drop every comunications.

Yes, it will.

> what rules will i need to apply to allow www,ftp,mirc
> browsing?
> I want to do that on another pc behind the firewall.

There are three things I would suggest.  The first is reading two 
tutorials on http://www.netfilter.org/documentation/index.html - 
specifically the "packet filtering HOWTO" and the "NAT HOWTO".

The second is Oskar's excellent iptables tutorial, at 
http://iptables-tutorial.frozentux.net/iptables-tutorial.html.

The third is taking a while to work out what ports the services you 
mention work on.  A basic feel for how TCP/IP connections work would help 
too.  The knowledge that in most cases a client chooses a port >1024 and 
connects to the service port should suffice.  People on the list could 
easily list the ports you need to allow or deny but you'll learn a 
tremendous amount by spending 10 minutes working it out.

In any case, don't forget you will need to enable IP Forwarding on your 
netfilter machine.

Hope those pointers help,

David


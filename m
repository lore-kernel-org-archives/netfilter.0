From: hellbreak <hellbreak@vrlteam.org>
Subject: Re: nmap
Date: Wed, 23 Oct 2002 00:38:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021023003847.2c36777a.hellbreak@vrlteam.org>
References: <1035264046.15391.85.camel@hyperno>
	<20021022174245.13d2766b.fonetica@tiscali.it>
	<20021022183147.PITY17202.mta01-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021022183147.PITY17202.mta01-svc.ntlworld.com@there>
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
Cc: Antony Stone <Antony@Soft-Solutions.co.uk>

Thank you Antony for your idea.
But...if I set my OUTPUT to DROP which ports and protocols can I set to ACCEPT to rum nmap to allow scan to other machines?

Thx 

On Tue, 22 Oct 2002 19:31:42 +0100
Antony Stone <Antony@Soft-Solutions.co.uk> wrote:

> On Tuesday 22 October 2002 4:42 pm, antonio wrote:
> 
> > Hi Everyone,
> >
> > Just a question:
> > I want to set up a firewall box with iptables in which I can use nmap.
> > Which ports/protocols can I set to ACCEPT and which to DROP?
> 
> Do you mean you want to run nmap on a box also running netfilter, to scan 
> other machines ?
> 
> If so, set your OUTPUT policy to ACCEPT, set your INPUT policy to DROP with a 
> single rule:
> 
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
> and you'll be able to scan other machines and get the replies back, but 
> anything new coming in to your machine will be blocked.
> 
> If I didn't understand correctly what you wanted to do please give more 
> details.
> 
> Antony.
> 
> -- 
> 
> Which part of 'apt-get dist-upgrade' do you not understand ???
> 


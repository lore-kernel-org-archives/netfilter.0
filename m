From: Tom Eastep <teastep@shorewall.net>
Subject: Re: conntrack problems
Date: Wed, 5 Jun 2002 14:36:08 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.44.0206051430360.2172-100000@ursa.shorewall.net>
References: <20020605221930.E2090@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020605221930.E2090@funkyjesus.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Drage <nickd@funkyjesus.org>
Cc: "netfilter@lists.samba.org" <netfilter@lists.samba.org>

On Wed, 5 Jun 2002, Nick Drage wrote:

> > It's 1 months that I'm having troubles with the conntrack. I have a
> > lot of packets like 'new not syn'(you know what I'm talking about..)
> > with some combos of flags on them:
> > 
> > ACK FIN
> > ACK PSH FIN
> > ACK RST
> > ACK only
> 
> Hi.  Sorry, I don't have much to add, except to reassure you that I've seen
> similar in my logs.  I hope you will keep the mailing list informed on any
> progress you make, I hope I can add to your research at some point.
> 

Since day one, Shorewall has included the following rule:

  457 67312 ACCEPT     tcp  --  *      *       0.0.0.0/0            
0.0.0.0/0          tcp flags:0x10/0x10

As you can see, I get a fair number packets with the ACK flag that aren't 
picked up by an earlier ESTABLISHED,RELATED rule. After experimenting with 
various strategies (DROP, REJECT --reject-with tcp-reset), I settled on 
ACCEPT as it seemed to have the fewest side effects. 

-Tom
-- 
Tom Eastep    \ Shorewall - iptables made easy
AIM: tmeastep  \ http://www.shorewall.net
ICQ: #60745924  \ teastep@shorewall.net



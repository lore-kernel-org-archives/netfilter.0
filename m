From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: what services/protocols can't be handled by RELATED,ESTABLISHED?
Date: Tue, 28 Oct 2003 15:54:44 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031028235444.30427.qmail@web40203.mail.yahoo.com>
References: <Pine.LNX.4.44.0310281643520.25084-100000@localhost.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0310281643520.25084-100000@localhost.localdomain>
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
To: "Robert P. J. Day" <rpjday@mindspring.com>, iptables mailing list <netfilter@lists.netfilter.org>

Ok as I understand it... if you are running the services on the same machine as
the firewall then no special treatment is needed.

the special treatment comes from having machines MASQed or NATed behind the
firewall and offering services on them.. When this comes to play you have to
use connnection tracking... and in a lot of cases the community has already
written modules for this ie the FTP and IRC contrack modules you mentioned...

Search the following URL for modules containting 

=====
In the absence of order there will be chaos.

__________________________________
Do you Yahoo!?
Exclusive Video Premiere - Britney Spears
http://launch.yahoo.com/promos/britneyspears/


From: "James Mello" <james.mello@wamu.net>
Subject: RE: Question
Date: Fri, 21 Jun 2002 16:16:45 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <001c01c21979$b6b61a40$8147370a@washingtghv9lt>
References: <20020621231230.XKAD19225.mta07-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020621231230.XKAD19225.mta07-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: 'Antony Stone' <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

> > No, but there are experimental modules that will allow you 
> to enforce 
> > your own rules. I've heard of some IDS or attack detection 
> > capabilities being done through IP tables.
> 
> What sort of modules ?   I *hope* you don't mean the 'string' match ?

Yeah, I actually do mean the 'string' match :) I've got some friends who
used this to do some filtering on content on their own internet exposed
boxes to prevent stupid Nimda worm and other attacks from being
perpetrated. They *did* say it was slow, but overall it's been a pretty
effective solution for them. Note I *never* did say that you can do all
sorts of Layer 7 evaluation (or validation) like the guy said. I just
suggested this as an option to do some layer 7 filtering and content
checking...

	-- Cheers
	-- James



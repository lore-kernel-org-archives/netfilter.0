From: "James Mello" <james.mello@wamu.net>
Subject: RE: Question
Date: Fri, 21 Jun 2002 11:31:29 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <000401c21951$dcd11310$8147370a@washingtghv9lt>
References: <20020621174102.NJXP2755.mta05-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020621174102.NJXP2755.mta05-svc.ntlworld.com@there>
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

> > Also I'm wondering say if I have a dmz and allow people to 
> come into a 
> > server on port 80, will netfilter inspect the packet on all 
> 7 layers 
> > of the OSI model and make sure that it is actually a http 
> packet and 
> > following the rules and protocol specifications of http?

No, but there are experimental modules that will allow you to enforce
your own rules. I've heard of some IDS or attack detection capabilities
being done through IP tables.

	-- Cheers
	-- James



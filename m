From: "L.Kremkow" <kremkow@polytomy.org>
Subject: Re: iptables compile trouble
Date: Thu, 6 Jun 2002 11:12:35 -0400 (EDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.43L0.0206061110100.28734-100000@singularity.polytomy.org>
References: <1023310649.28008.4.camel@hoi>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <1023310649.28008.4.camel@hoi>
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
To: NF ML <netfilter@lists.samba.org>


On 5 Jun 2002, Andras Kis-Szabo wrote:
> The
> > ip6tables.c:502: `AI_CANONNAME' undeclared (first use in this function)
> > ip6tables.c:540: `NI_MAXHOST' undeclared (first use in this function)
> are definied in the /usr/include/netdb.h, which is included.

Thanks- that was it. I had a whole bunch of netdb.h files all over my
system. Once I figured out which was the "right" one and what it's "right"
place was, everything was fine.

Thanks for the help.

,,
LKremkow



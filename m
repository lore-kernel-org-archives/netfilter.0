From: Michael Tautschnig <michael.tautschnig@zt-consulting.com>
Subject: RE: Single IP
Date: Fri, 4 Mar 2005 10:40:17 +0100 (CET)
Message-ID: <Pine.LNX.4.62.0503041033580.7410@L01.THNET>
References: <20686C579479DC438276A726FE80CDAA0294C9B9@INEXCH1>
Mime-Version: 1.0
In-Reply-To: <20686C579479DC438276A726FE80CDAA0294C9B9@INEXCH1>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Pmishra@in.safenet-inc.com
Cc: netfilter@lists.netfilter.org


> That's My question,
> I want to use some Option or flag  in socket label so that we can identify
> the socket in server site and forward as per this option.
>
>
> I saw some link
> <http://www.gsp.com/cgi-bin/man.cgi?section=2&topic=getsockopt> (see
> SO_ACCEPTFILTER ) , but I don't identity exactly about setsocketopt and
> getsocketopt.
>
IMHO this is just for local operation on a socket, this has nothing what 
so ever to do with the packets!

Could you please tell as a bit more, what kind of "services" you are 
trying to establish. If it were http-based services, you could always use 
the host-field of the packet - but this has to be done at application 
level, it's not (really) a job of iptables. Actually, there is a 
layer7-filter-project for iptables, but - we just don't know what you are 
trying to do ...

Could you please answer the following questions?

- What is the client using to access your services? A web-browser?
- What "services" are you providing? Websites?
- You can't have more than one application listening on port 80, so how 
are you dealing with that issue?
- why do you stick to 1 IP and 1 port?

Thanks,
Michael


From: Pmishra@in.safenet-inc.com
Subject: RE: Single IP
Date: Fri, 4 Mar 2005 09:27:48 +0530
Message-ID: <20686C579479DC438276A726FE80CDAA0294C9B9@INEXCH1>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: michael.tautschnig@zt-consulting.com
Cc: netfilter@lists.netfilter.org

That's My question,
I want to use some Option or flag  in socket label so that we can identify
the socket in server site and forward as per this option.


I saw some link
<http://www.gsp.com/cgi-bin/man.cgi?section=2&topic=getsockopt> (see
SO_ACCEPTFILTER ) , but I don't identity exactly about setsocketopt and
getsocketopt.

Please help me for solve the problem.
Thanks
Pradeep


-----Original Message-----
From: Michael Tautschnig [mailto:michael.tautschnig@zt-consulting.com]
Sent: Thursday, March 03, 2005 7:13 PM
To: Pmishra@in.safenet-inc.com
Cc: netfilter@lists.netfilter.org
Subject: Re: (no subject)


> Hi Team,
> My requirement is Use SingleIP and different port with different web based
> application .
> Requirement :-
> 1.Access all the request from client with PORT 80.
> 2.Check the socket filter or net filet and forward different port as per
> hint send by client.
> Is it possible in Linux ?

Well, what is the "hint", sent by the client?

Thanks,
Michael

From: <peter.gehle@sbgit.com>
Subject: Re-4: connection to vpn Server (pptp) behind iptables FW
Date: 12 Mar 2004 12:13:42 UT
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DIIE.000000F100002A38@sbgit.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

The both machines have dynamic ip's. 
I don't know what i have to fill at rem.ote.vpn.client?

Thanx

-------- Original Message --------
Subject: Re: Re-2: connection to vpn Server (pptp) behind iptables FW (12-Mrz-2004 11:56)
From:    Antony@Soft-Solutions.co.uk
To:      peter.gehle@sbgit.com

> On Friday 12 March 2004 10:34 am, peter.gehle@sbgit.com wrote:
> 
> > > Micro$oft has a 'technote' on this in their technet section on the
> > > website. AFAIR you need to allow protocol 37 to be forwarded between the
> > > two.
> >
> > I have added a rule that forwards the protocol 37, but it still not works?
> 
> Have you tried adding my suggested LOGging rules to see if there's 
> something 
> important still being DROPped?
> 
> Antony.
> 
> -- 
> I'm pink, therefore I'm Spam.
> 
>                                                      Please reply to the 
> list;
>                                                            please don't CC 
> me.
> 
> 


To: Antony@Soft-Solutions.co.uk
Cc: netfilter@lists.netfilter.org



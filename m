From: seberino@spawar.navy.mil
Subject: Re: How filter IP address if it *changes* often?? (think dhcp)
Date: Thu, 27 Mar 2003 22:26:17 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030327222617.A19911@spawar.navy.mil>
References: <20030327200056.A18916@spawar.navy.mil> <Pine.LNX.4.53.0303272314530.4873@gypsy>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.53.0303272314530.4873@gypsy>; from steve@warning.ca on Thu, Mar 27, 2003 at 11:16:55PM -0500
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
To: Steve Mickeler <steve@warning.ca>
Cc: netfilter@lists.netfilter.org

Steve

Thanks for the email.  Let me rerephrase my question.
Perhaps I wasn't clear....

How can you have a rule on your INPUT chain that
only allows your local box's IP address if "local box IP address" can
change without notice due to your DSL ISP's decision?

Chris


On Thu, Mar 27, 2003 at 11:16:55PM -0500, Steve Mickeler wrote:
> 
> Thats what the INPUT and OUTPUT chains are for.
> 
> They are for packets destined to and orignated from the local box running
> iptables.
> 
> 
> 
> 
> On Thu, 27 Mar 2003 seberino@spawar.navy.mil wrote:
> 
> > My iptables script filters incoming packets.
> >
> > One filter is whether the destination address is
> > MY machine.
> >
> > How do this if IP address changes uncontrollably
> > like with DHCP??
> >
> > Thanks,
> >
> > Chris
> >
> > --
> > _______________________________________
> >
> > Dr. Christian Seberino
> > SPAWAR Systems Center San Diego
> > Code 2872
> > 49258 Mills Street, Room 158
> > San Diego, CA 92152-5385
> > U.S.A.
> >
> > Phone: (619) 553-9973
> > Fax:   (619) 553-6521
> > Email: seberino@spawar.navy.mil
> > _______________________________________
> >

-- 
_______________________________________

Dr. Christian Seberino
SPAWAR Systems Center San Diego
Code 2872
49258 Mills Street, Room 158
San Diego, CA 92152-5385
U.S.A.

Phone: (619) 553-9973
Fax:   (619) 553-6521
Email: seberino@spawar.navy.mil
_______________________________________


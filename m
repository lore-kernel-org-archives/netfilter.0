From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: FORWARD question
Date: Fri, 21 Nov 2003 13:08:35 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311211308.hALD8c724893@onyx.rockstone.co.uk>
References: <20031121115915.79176.qmail@web40805.mail.yahoo.com> <200311211239.hALCd3724801@onyx.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311211239.hALCd3724801@onyx.rockstone.co.uk>
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

On Friday 21 November 2003 12:38 pm, Antony Stone wrote something completely 
stupid and sent it to the list.

I said "packets being routed do not go through FORWARD".   This completely 
wrong, and I should have said "packets being routed do not go through INPUT". 
They definitely do go through FORWARD.

Corrected version of my previous response below :)

> On Friday 21 November 2003 11:59 am, Nick wrote:
> > Antony, I thought I had it all figured out.
> > Apparently, I don't... :-(
> >
> > I thought it should be in INPUT so that the router
> > 'gets' the incoming request, and once it has it, it
> > will FORWARD it to the LAN server.
>
> No no no no no no no :))

Packets being routed do not go through INPUT (you didn't used to use
ipchains, did you?   Your idea is the way that system used to work...)

> > Now, if this rule should be in the FORWARD, what
> > should I have in INPUT in order to acept NEW FTP
> > requests ? Or is FORWARD doing this automatically ?
>
> See
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html#TRAVERSINGOFT
>ABLES
>
> > I promised that the previous message would be the last
> > one. Sorry for breaking my promise :-)
>
> No problem.   You'll probably have another one in a week or so, when you
> want to do something even more exciting :)
>
> Antony.

-- 

How should I know if it works?   That's what beta testers are for.   I only 
coded it.

 - Linus Torvalds
                                                     Please reply to the list;
                                                           please don't CC me.


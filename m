From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ftp
Date: Thu, 20 May 2004 10:19:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405201019.31762.Antony@Soft-Solutions.co.uk>
References: <BAY15-F35DitpPZCg1M0008d241@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F35DitpPZCg1M0008d241@hotmail.com>
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

On Thursday 20 May 2004 5:41 am, azeem ahmad wrote:

> From: Antony Stone <Antony@Soft-Solutions.co.uk>
>
> >On Wednesday 19 May 2004 10:05 pm, azeem ahmad wrote:
> > > hi all
> > > i m unable to browse ftp. it says
> > > an error occured opening that folder on the ftp server. make sure you
> > > have permissions to access that folder
> > > details
> > > 200 type set to A
> > > 500 Illegal port command
> > > 500 LPRT not understood
> >
> > Do you get the same error when accessing the server from a machine not via
> > the netfilter firewall (eg localhost, or some other client on the same
> > subnet)?
> >
> only one box is accessing ftp that is firewall box itself. no other box
> behind the firewall can access the ftp outside.

Okay - let me rephrase the question.

Do you get the same error message from the server if you access it from some 
machine which does not go through the firewall (and is not the firewall 
itself)?   Even if you have to temporarily set up a client to test this, I 
think it would be useful, because it would be good to know if the server 
generates this error independently of anything the firewall is doing to the 
packets.

Also, have you tried adjusting the MASQUERADE rule as I suggested, so it 
applies to the external interface only, as this may have a bearing on the 
problem?

Regards,

Antony.

-- 
Success is a lousy teacher.  It seduces smart people into thinking they can't 
lose.

 - William H Gates III

                                                     Please reply to the list;
                                                           please don't CC me.



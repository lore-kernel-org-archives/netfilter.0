From: "j davis" <davis_compz@hotmail.com>
Subject: Re: IP Aliasing
Date: Fri, 31 May 2002 23:32:13 +0000
Sender: netfilter-admin@lists.samba.org
Message-ID: <F251aQLJJuJhMw5hdUK00010f63@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org


this does work, this is proablly a weekley question trailing the ever 
popular
Q   what ports for my game? This question has been asked 2 or three times 
just in the last few days...view the Virtual Host emails this week,

>From: George Georgalis <georgw@galis.org>
>To: Michael Montero <mmontero@mail.communityconnect.com>
>CC: netfilter@lists.samba.org
>Subject: Re: IP Aliasing
>Date: Fri, 31 May 2002 13:18:49 -0400
>MIME-Version: 1.0
>Received: from hotmail.com ([65.54.236.29]) by hotmail.com with Microsoft 
>SMTPSVC(5.0.2195.4905); Fri, 31 May 2002 10:29:25 -0700
>Received: from lists.samba.org ([198.186.203.85]) by hotmail.com with 
>Microsoft SMTPSVC(5.0.2195.4905); Fri, 31 May 2002 10:19:23 -0700
>Received: from va.samba.org (localhost [127.0.0.1])by lists.samba.org 
>(Postfix) with ESMTPid E5C4045C7; Fri, 31 May 2002 10:22:21 -0700 (PDT)
>Received: from trot.galis.org (ool-43530772.dyn.optonline.net 
>[67.83.7.114])by lists.samba.org (Postfix) with ESMTP id 4AD554109for 
><netfilter@lists.samba.org>; Fri, 31 May 2002 10:20:14 -0700 (PDT)
>Received: (from gx@localhost)by trot.galis.org (8.11.6/8.11.6) id 
>g4VHInI19140;Fri, 31 May 2002 13:18:49 -0400
>Delivered-To: netfilter@lists.samba.org
>Message-ID: <20020531131849.C17865@trot.haven.dom>
>References: <Pine.LNX.4.04.10205311254170.5797-100000@lysa>
>User-Agent: Mutt/1.2.5.1i
>In-Reply-To: <Pine.LNX.4.04.10205311254170.5797-100000@lysa>; from 
>mmontero@mail.communityconnect.com on Fri, May 31, 2002 at 12:55:57PM -0400
>Sender: netfilter-admin@lists.samba.org
>Errors-To: netfilter-admin@lists.samba.org
>X-BeenThere: netfilter@lists.samba.org
>X-Mailman-Version: 2.0.8
>Precedence: bulk
>List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
>List-Post: <mailto:netfilter@lists.samba.org>
>List-Subscribe: 
><http://lists.samba.org/listinfo/netfilter>,<mailto:netfilter-request@lists.samba.org?subject=subscribe>
>List-Id: netfilter user discussion list <netfilter.lists.samba.org>
>List-Unsubscribe: 
><http://lists.samba.org/listinfo/netfilter>,<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
>List-Archive: <http://lists.samba.org/pipermail/netfilter/>
>Return-Path: netfilter-admin@lists.samba.org
>X-OriginalArrivalTime: 31 May 2002 17:19:25.0848 (UTC) 
>FILETIME=[504C3180:01C208C7]
>
>On Fri, May 31, 2002 at 12:55:57PM -0400, Michael Montero wrote:
> >I'm trying to set up 2 IP aliases on my firewall box.  It's Redhat 7.2.  
>I
> >believe I have the 2 alias (eth0:0 and eth0:1) set up properly.  Is there
> >anything in particular I need to do with iptables to activate these 2
> >interfaces?  I've attempted to execute rules with the interface specified
> >as eth0:0 and iptables does not seem to like that.  Anyone have any docs 
>I
> >can read about proper IP aliasing under Redhat and what I need to do for
> >iptables?
> >
>
>I would try '-i eth0' for all you aliases and use '-i/-o address[/mask]'
>if you refer to a particular subnet. Reasoning: the interface is being
>aliased and iptables sees them all as eth0.
>
>Let me know if this works ;^) I'll be trying it shortly.
>
>// George
>
>--
>GEORGE GEORGALIS, System Admin/Architect    cell: 347-451-8229
>Security Services, Web, Mail,            mailto:george@galis.org
>File, Print, DB and DNS Servers.       http://www.galis.org/george




_________________________________________________________________
Chat with friends online, try MSN Messenger: http://messenger.msn.com



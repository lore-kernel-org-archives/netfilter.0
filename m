From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Dynamically Updating Rules
Date: Thu, 27 Jun 2002 19:30:48 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020627183051.FHYK16050.mta01-svc.ntlworld.com@there>
References: <200206271331.09893.lee@ricis.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206271331.09893.lee@ricis.com>
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
To: netfilter@lists.samba.org

On Thursday 27 June 2002 7:31 pm, Lee Leahu wrote:

> Is there a way to dynamically add and remove rules to an iptables live
> configuration?
>
> For example:
>
> I have a server and a workstion.  the workstation is locked down tightly. 
> I would like for when i ssh to a remote server, that iptables automatically
> opens the ident port on the workstation to that remote server, and after a
> connection is made, to automatically close it back up again.
>
> Is this possible???

You can create a script to add or remove rules whenever you like - the trick 
is working out how to call the script.

If the daemon / service / application you're using doesn't easily support the 
idea of calling a script when a connection comes in, you could perhaps log 
the appropriate events (either with netfilter, or the daemon), either to a 
log file which a background job is continually scanning, or pipe them to a 
process which parses and handles the log entries as they come in ?

You could even do something like run snort on the machine, and trigger on 
certain events, or monitor the conntection tracking table and respond to new 
connections which appear ?

No doubt there are plenty of other ways of doing what you want.

 

Antony


From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Filter incoming mails by sender's address?
Date: Mon, 10 Jun 2002 10:57:24 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020610145724.GV29214@cannon.eng.us.uu.net>
References: <00a401c2108d$ba70e830$cb02a8c0@wstakacsi>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <00a401c2108d$ba70e830$cb02a8c0@wstakacsi>
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
Content-Transfer-Encoding: 7bit
To: Takacs Istvan <istvan.takacs@hungax.com>
Cc: "netfilter (Elektronikus levelek)" <netfilter@lists.samba.org>

On Mon, Jun 10, 2002 at 04:47:21PM +0200, Takacs Istvan wrote:

> Hi,
> 
> Is there a way to filter incoming letters
> by the sender's address, or is it 
> completely an MTA's function?

You're right here. It's completely an MTA's function.

Except for the fact that netfilter sees port 25 (which
the world knows it's the smtp port) there is no specific
knowledge about the contents of an smtp stream within netfilter.

You're better off doing this sort of filtering at the smtp layer.

Ramin

> 
> We have a server what has to receive
> mails and process their content automaically.
> We'd like to restrict the email addresses
> to those who just enabled to send mails
> to that address.
> 
> Can I do it somehow with netfilter?
> 
> Thanks in advance!
> 
> Regards;
> 
> 		Istvan
> 


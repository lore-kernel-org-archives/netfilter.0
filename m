From: Doug Monroe <doug@planetconnect.com>
Subject: Re: Dynamicly Updating Rules
Date: Thu, 27 Jun 2002 14:26:31 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D1B58D7.EABEFCB2@planetconnect.com>
References: <200206271331.09893.lee@ricis.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: lee@ricis.com
Cc: netfilter@lists.samba.org

Lee Leahu wrote:
> 
> Is there a way to dynamically add and remove rules to an iptables live configuration?
> 
> For example:
> 
> I have a server and a workstion.  the workstation is locked down tightly.  I would like for
> when i ssh to a remote server, that iptables automatically opens the ident port on the workstation
> to that remote server, and after a connection is made, to automatically close it back up again.
> 
> Is this possible???

I suppose you could write a "wrapper" around the workstation ssh client that
does -I (insert), -A (append), -D (delete) as needed.


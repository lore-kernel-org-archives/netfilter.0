From: Patrick Schaaf <bof@bof.de>
Subject: Re: Dynamicly Updating Rules
Date: Thu, 27 Jun 2002 20:35:35 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020627203535.C2890@oknodo.bof.de>
References: <200206271331.09893.lee@ricis.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <200206271331.09893.lee@ricis.com>; from lee@ricis.com on Thu, Jun 27, 2002 at 01:31:09PM -0500
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
To: Lee Leahu <lee@ricis.com>
Cc: netfilter@lists.samba.org

> I would like for when i ssh to a remote server, that iptables automatically
> opens the ident port on the workstation to that remote server, and after a
> connection is made, to automatically close it back up again.
> Is this possible???

That is exactly what the "conntracking and NAT helpers" are doing for
protocols like FTP, where they permit a data connection when they see
a PORT command within the control connection.

You have to program this yourself, as an in-kernel module. You can take
existing helpers for reference. If you want to go that way, and you have
specific questions, best subscribe to the netfilter-devel mailing list.

best regards
  Patrick

(btw, I reformatted your lines to be under 80 characters long. Please do that
yourself in the future)



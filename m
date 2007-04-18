From: Pablo Sanchez <pablo@blueoakdb.com>
Subject: Re: Firewall L7
Date: Wed, 18 Apr 2007 08:42:38 -0400
Message-ID: <200704180842.38335.pablo@blueoakdb.com>
References: <3da957060704180538m12ec86edr2536867007a8d05@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3da957060704180538m12ec86edr2536867007a8d05@mail.gmail.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Wednesday 18 April 2007 at 8:38 am, Stephan Higuti etched:
> Hello guys.
>
> I have a firewall L7 as a bridge in my work.  The firewall are
> blocking Gmail, Hotmail, and attachments from my mail server....
> Anybody can help me?  =D

If you have a home server, you can tunnel from work to it and
circumvent the 'problem'

Depending on what you're running on your desktop at work (Unix or
Windows), you can use either ssh or putty, to create a local SOCKS
server, which tunnels to your home server.

If work blocks port 22, setup your sshd daemon at home to listen to
port 443.  ;)

Cheers,
---
pablo



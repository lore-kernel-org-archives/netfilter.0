From: "Wijaya, J." <wijayaj@gmx.net>
Subject: Re: block kazaa using iptables
Date: Fri, 25 Apr 2003 18:11:30 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304251811300248.04387953@smtp.nikonbw.com>
References: <33407.202.138.166.5.1051183732.squirrel@mail.ictuscomm.net>
Reply-To: wijayaj@gmx.net
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <33407.202.138.166.5.1051183732.squirrel@mail.ictuscomm.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wjdeypalan@ictuscomm.net, netfilter@lists.netfilter.org

Try not to block the port number, instead of blocking the access to the
server ip address, this will be a bit difficult, we have to find out all
the kazaa server addreses.

I have done this task to block yahoo messenger, because yahoo msg will use
any available port, so it is useless to block 5050 (yahoo port number), so
i just block all the ip addresses for the yahoo msg servers.

jw.

*********** REPLY SEPARATOR  ***********

On 24/04/2003 at 19:28 PM Wesley Jay Deypalan wrote:

>Hi,
>
>Is there a way to block kazaa using iptables?Already tried blocking port
>1214 but to no avail, I heard that kazaa change ports if it cannot connect
>using 1214.
>TIA,
>
>wesley





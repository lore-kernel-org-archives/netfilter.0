From: "Dick St.Peters" <stpeters@NetHeaven.com>
Subject: Re: more about martians
Date: Thu, 22 Apr 2004 10:42:08 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <16519.55744.786921.281630@saint.heaven.net>
References: <Pine.LNX.4.44.0404220240150.27078-100000@filer.marasystems.com>
	<20040422033242.86850.qmail@web40706.mail.yahoo.com>
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040422033242.86850.qmail@web40706.mail.yahoo.com>
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
To: udo <udovdh@yahoo.com>
Cc: netfilter@lists.netfilter.org

> I only want to offer ssh to the outside world (lan and
> wan) on port 22 while still being able to run sshd at
> non-root privs.
> Say port 2222 for non-root reasons but port 2222 must
> not interfere and best not be visible to the outside
> world.

You could use a loopback alias with some unused private IP,
say something like
    ifconfig lo:0 192.168.15.1 netmask 255.255.255.255

That entire address, not just one port, is invisible to the
outside world (unless you deliberately tell them about it).

--
Dick St.Peters, stpeters@NetHeaven.com 


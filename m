From: Maximilian Wilhelm <max@rfc2324.org>
Subject: Re: ipset: how to run non-root
Date: Sun, 19 Nov 2006 01:15:41 +0100
Message-ID: <20061119001541.GA13056@outback.rfc2324.org>
References: <455F8DE9.8060105@mailinator.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <455F8DE9.8060105@mailinator.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Am Samstag, den 18 November hub Mike Wright folgendes in die Tasten:

Hi!

> I'm trying to use ipset from a php script on an apache server.

> ipset requires root user in order to execute, but the webserver is 
> running as apache.  suexec is not a possibility because it won't execute 
> programs with root permissions.  It is possible to have a cron job 
> perform the task but that introduces a time delay.

> I've tried changing ownership of ipset to apache:apache but that didn't 
> work.  Still received the "must be root" warning.

> I looked into the source of ipset.c but it seems like the socket() call 
> must be done as root, and I don't know how to hack around that.

> Does anybody know how I might accomplish this?

I never used ipset, but you could use a generic trick:
 Set the owner of the ipset binary back to root and set the suid bit
 which will result in the ability for everyone who can execute the
 binary to do this "as root".

You might want to think about an execution restriction (e.g. via the group)
to prevent people who should no fiddle with ipset from doing so.

I hope you have some access control via your web application...

Ciao
Max
-- 
	Follow the white penguin.


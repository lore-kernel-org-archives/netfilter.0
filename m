From: Ted Phelps <phelps@gnusto.com>
Subject: Re: IPtables does not save it's settings
Date: Tue, 23 Jan 2007 13:23:02 -0600
Message-ID: <4646.1169580182@laika.gnusto.com>
References: <45B66017.2020701@gmail.com>
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: Your message of Tue, 23 Jan 2007 20:20:55 +0100. 
	<45B66017.2020701@gmail.com> 
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ronald <ronald645@gmail.com>, netfilter@lists.netfilter.org

Ronald writes:
> Since a week, I have been trying to figure out how iptables works. I 
> really like the program, it's nice and stable. However, since my last 
> changes the firewall doesn't seem to save the changes I make. Everytime 
> I reboot, my changes are reversed. What could have caused this?

It's designed to work that way.  Use iptables-save to write your config
to a file and iptables-restore read it back out.

Cheers,
-Ted



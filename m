From: Steven M Campbell <Netfilter@SCampbell.net>
Subject: Re: Can anyone tell wat's going on here?
Date: Wed, 11 May 2005 12:03:21 -0400
Message-ID: <42822CC9.5080209@SCampbell.net>
References: <Pine.LNX.4.63.0505111249010.3025@palangana>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.63.0505111249010.3025@palangana>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Sergio Penkale wrote:
>
> My main problem is that i don't know wat the problem is, i don't know 
> if it's iptables-related, kernel-related or what. I haven't tried 
> other kernels mainly
> because it's a lot of trouble to get the driver of my USB ADSL modem 
> to work
> between different kernel versions.
> I was using debian woody with a 2.4.19 kernel and everything worked fine,
> the problem arised when i upgraded to sarge. The main configuration 
> didn't
> change during the upgrade.
> Any suggestion on what the problem could be or at least how to trace it
> would be much appreciated.
>

Have you checked 'netstat -in' for interface errors on the ethernet 
connection, I am suspicious that you just have a duplex mismatch between 
the host and client.  Worth a look.


